{ MSEgui Copyright (c) 2017 by Martin Schreiber

    See the file COPYING.MSE, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}
//
// under construction
//
unit mseassistivehandler;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}
interface
uses
 classes,mclasses,mseclasses,mseassistiveserver,mseevent,
 mseguiglob,mseglob,msestrings,mseinterfaces,mseact,mseshapes,
 mseassistiveclient,msemenuwidgets,msegrids,msespeak,msetypes,
 msestockobjects,msegraphutils;

type
 assistiveserverstatety = (ass_active);
 assistiveserverstatesty = set of assistiveserverstatety;

 tassistivespeak = class(tcustomespeakng)
  public
   constructor create(aowner: tcomponent); override;
  published
   property datapath;
   property options;
   property device;
   property bufferlength;
   property voicedefault;
   property voices;
   property language;
   property identifier;
   property gender;
   property age;
   property variant;
   property volume;
   property rate;
   property pitch;
   property range;
   property wordgap;
   property punctuationlist;
 end;

 tassistiveserver = class(tmsecomponent,iassistiveserver)
  private
   factive: boolean;
   fspeaker: tassistivespeak;
   fvoicecaption: int32;
   fvoicetext: int32;
   procedure setactive(const avalue: boolean);
   procedure setspeaker(const avalue: tassistivespeak);
  protected
   fstate: assistiveserverstatesty;
   fdataenteredkeyserial: card32;
   procedure activate();
   procedure deactivate();

   procedure loaded() override;

   procedure startspeak();
      
    //iassistiveserver
   procedure doenter(const sender: iassistiveclient);
   procedure doitementer(const sender: iassistiveclient; //sender can be nil
                             const items: shapeinfoarty; const aindex: integer);
   procedure doitementer(const sender: iassistiveclient; //sender can be nil
                          const items: menucellinfoarty; const aindex: integer);
   procedure doclientmouseevent(const sender: iassistiveclient;
                                           const info: mouseeventinfoty);
   procedure dofocuschanged(const oldwidget,newwidget: iassistiveclient);
   procedure dokeydown(const sender: iassistiveclient;
                                         const info: keyeventinfoty);
   procedure doactionexecute(const sender: tobject; const info: actioninfoty);
   procedure dochange(const sender: iassistiveclient);
   procedure dodataentered(const sender: iassistiveclientdata);
   procedure docellevent(const sender: iassistiveclientgrid; 
                                       const info: celleventinfoty);
   procedure doeditcharenter(const sender: iassistiveclientedit;
                                                const achar: msestring);
   procedure navigbordertouched(const sender: iassistiveclient;
                                       const adirection: graphicdirectionty);
  public
   constructor create(aowner: tcomponent); override;
   destructor destroy(); override;
   procedure wait();
   procedure cancel();
   procedure speaktext(const atext: msestring; const avoice: int32 = 0);
   procedure speaktext(const atext: stockcaptionty; const avoice: int32 = 0);
   procedure speakcharacter(const achar: char32; const avoice: int32 = 0);
   procedure speakall(const sender: iassistiveclient);
   procedure speakinput(const sender: iassistiveclientdata);
  published
   property active: boolean read factive write setactive default false;
   property speaker: tassistivespeak read fspeaker write setspeaker;
   property voicecaption: int32 read fvoicecaption 
                                          write fvoicecaption default 0;
   property voicetext: int32 read fvoicetext 
                                          write fvoicetext default 0;
 end;
 
implementation
uses
 msegui,msekeyboard;
 
{ tassistiveserver }

constructor tassistiveserver.create(aowner: tcomponent);
begin
 fspeaker:= tassistivespeak.create(nil);
 inherited;
end;

destructor tassistiveserver.destroy();
begin
 inherited;
 fspeaker.free();
end;

procedure tassistiveserver.setactive(const avalue: boolean);
begin
 if factive <> avalue then begin
  factive:= avalue;
  if not (csloading in componentstate) then begin
   if avalue then begin
    activate();
   end
   else begin
    deactivate();
   end;
  end;
 end;
end;

procedure tassistiveserver.activate();
begin
 if not (csdesigning in componentstate) then begin
  fspeaker.active:= true;
  assistiveserver:= iassistiveserver(self);
  noassistivedefaultbutton:= true;
  assistivewidgetnavig:= true;
  include(fstate,ass_active);
  application.invalidate();
 end;
end;

procedure tassistiveserver.deactivate();
begin
 if not (csdesigning in componentstate) then begin
  assistiveserver:= nil;
  noassistivedefaultbutton:= false;
  assistivewidgetnavig:= false;
  fspeaker.active:= false;
  exclude(fstate,ass_active);
  application.invalidate();
 end;
end;

procedure tassistiveserver.setspeaker(const avalue: tassistivespeak);
begin
 fspeaker.assign(avalue);
end;

procedure tassistiveserver.loaded();
begin
 inherited;
 if factive then begin
  factive:= false;
  active:= true;
 end;
end;

procedure tassistiveserver.wait();
begin
 fspeaker.wait();
end;

procedure tassistiveserver.cancel();
begin
 fspeaker.cancel();
end;

procedure tassistiveserver.speaktext(const atext: msestring;
               const avoice: int32 = 0);
begin
 fspeaker.speak(atext,[so_endpause],avoice);
end;

procedure tassistiveserver.speaktext(const atext: stockcaptionty;
               const avoice: int32 = 0);
begin
 speaktext(stockobjects.captions[atext],avoice);
end;

procedure tassistiveserver.speakcharacter(const achar: char32;
               const avoice: int32 = 0);
begin
 startspeak();
 fspeaker.speakcharacter(achar,[so_endpause],avoice);
end;

procedure tassistiveserver.speakall(const sender: iassistiveclient);
var
 fla1: assistiveflagsty;
 s1: msestring;
begin
 fla1:= sender.getassistiveflags();
 startspeak();
 s1:= '';
 if asf_button in fla1 then begin
  s1:= stockobjects.captions[sc_button] + ' ';
 end;
 s1:= s1 + sender.getassistivecaption();
 speaktext(s1,fvoicecaption);
 speaktext(sender.getassistivetext(),fvoicetext);
end;

procedure tassistiveserver.speakinput(const sender: iassistiveclientdata);
begin
 startspeak();
 speaktext(sc_input,fvoicecaption);
 speaktext(sender.getassistivecaption(),fvoicecaption);
 speaktext(sender.getassistivetext(),fvoicetext);
end;

procedure tassistiveserver.startspeak();
begin
 cancel();
end;

procedure tassistiveserver.doenter(const sender: iassistiveclient);
begin
 speakall(sender);
end;

procedure tassistiveserver.doitementer(const sender: iassistiveclient;
               const items: shapeinfoarty; const aindex: integer);
begin
end;

procedure tassistiveserver.doitementer(const sender: iassistiveclient;
               const items: menucellinfoarty; const aindex: integer);
begin
end;

procedure tassistiveserver.doclientmouseevent(const sender: iassistiveclient;
               const info: mouseeventinfoty);
begin
end;

procedure tassistiveserver.dofocuschanged(const oldwidget: iassistiveclient;
               const newwidget: iassistiveclient);
begin
end;

procedure tassistiveserver.dokeydown(const sender: iassistiveclient;
               const info: keyeventinfoty);
var
 fla1: assistiveflagsty;
begin
 if not (es_child in info.eventstate) then begin
  if (info.key = key_return) and 
                (info.shiftstate*keyshiftstatesmask = []) then begin
   fla1:= sender.getassistiveflags();
   if info.serial <> fdataenteredkeyserial then begin
    speakall(sender);
   end;
  end;
  fdataenteredkeyserial:= 0;
 end;
end;

procedure tassistiveserver.doactionexecute(const sender: tobject;
               const info: actioninfoty);
begin
end;

procedure tassistiveserver.dochange(const sender: iassistiveclient);
begin
end;

procedure tassistiveserver.dodataentered(const sender: iassistiveclientdata);
begin
 fdataenteredkeyserial:= 0;
 if application.keyeventinfo <> nil then begin
  fdataenteredkeyserial:= application.keyeventinfo^.serial;
 end;
 speakinput(sender);
end;

procedure tassistiveserver.docellevent(const sender: iassistiveclientgrid;
               const info: celleventinfoty);
begin
end;

procedure tassistiveserver.doeditcharenter(const sender: iassistiveclientedit;
               const achar: msestring);
begin
 if length(achar) = 1 then begin
  speakcharacter(getucs4char(achar,1),fvoicetext);
 end
 else begin
  speaktext(achar,fvoicetext);
 end;
end;

procedure tassistiveserver.navigbordertouched(const sender: iassistiveclient;
               const adirection: graphicdirectionty);
var
 ca1: stockcaptionty;
begin
 case adirection of
  gd_left: begin
   ca1:= sc_leftborder;
  end;
  gd_up: begin
   ca1:= sc_topborder;
  end;
  gd_right: begin
   ca1:= sc_rightborder;
  end;
  gd_down: begin
   ca1:= sc_bottomborder;
  end;
  else begin
   exit;
  end;
 end;
 startspeak();
 speaktext(ca1,fvoicecaption);
end;

{ tassistivespeak }

constructor tassistivespeak.create(aowner: tcomponent);
begin
 inherited;
 setsubcomponent(true);
end;

end.