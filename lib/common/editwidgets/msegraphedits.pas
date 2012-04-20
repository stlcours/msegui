{ MSEgui Copyright (c) 1999-2012 by Martin Schreiber

    See the file COPYING.MSE, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}
unit msegraphedits;

{$ifdef FPC}
 {$mode objfpc}{$h+}
{$endif}
{$ifndef mse_no_ifi}
 {$define mse_with_ifi}
{$endif}

interface
uses
 {$ifdef FPC}classes{$else}Classes{$endif},msegui,
 mseglob,mseguiglob,msescrollbar,msegraphutils,msegraphics,mseevent,
 msewidgets,mseeditglob,msestockobjects,msestat,msestatfile,
 mseclasses,msesimplewidgets,msemenus,mseact,typinfo,
 msegrids,msewidgetgrid,msedatalist,msebitmap,msetypes,msestrings,msearrayprops,
 msedrawtext,mseshapes
 {$ifdef mse_with_ifi}{,mseifi},mseifiglob,mseificomp,mseificompglob{$endif},
 msepointer,msegridsglob;

const
 defaultsliderwidth = 200;
 defaultsliderheight = 20;
 defaultboxsize = 13;
 defaultsliderscrollbaroptions = defaultscrollbaroptions + [sbo_valuekeys];
 
type
 tgrapheditframe = class(tcustomcaptionframe)
  public
   constructor create(const intf: icaptionframe);
  published
   property options;
   property levelo default -2;
   property leveli;
   property framewidth;
   property colorframe;
   property colorframeactive;
   property colordkshadow;
   property colorshadow;
   property colorlight;
   property colorhighlight;
   property colordkwidth;
   property colorhlwidth;
   property hiddenedges;
   property framei_left;
   property framei_top;
   property framei_right;
   property framei_bottom;

   property frameimage_list;
   property frameimage_left;
   property frameimage_top;
   property frameimage_right;
   property frameimage_bottom;
   property frameimage_offset;
   property frameimage_offset1;
   property frameimage_offsetdisabled;
   property frameimage_offsetmouse;
   property frameimage_offsetclicked;
   property frameimage_offsetactive;
   property frameimage_offsetactivemouse;
   property frameimage_offsetactiveclicked;

   property frameface_list;
   property frameface_offset;
   property frameface_offset1;
   property frameface_offsetdisabled;
   property frameface_offsetmouse;
   property frameface_offsetclicked;
   property frameface_offsetactive;
   property frameface_offsetactivemouse;
   property frameface_offsetactiveclicked;

   property colorclient default cl_foreground;
   property caption;
   property captionpos default cp_right;
   property captiondist;
//   property captiondistouter;
//   property captionframecentered;
   property captionoffset;
//   property captionnoclip;
   property font;
   property localprops; //before template
   property localprops1; //before template
   property template;
 end;

 tgraphdataedit = class(tactionpublishedwidget,igridwidget,istatfile
                  {$ifdef mse_with_ifi},iifidatalink{$endif})
  private
   fonchange: notifyeventty;
   fondataentered: notifyeventty;
   fcolorglyph: colorty;
   fstatvarname: msestring;
   fstatfile: tstatfile;
   foptionsedit: optionseditty;
   fedited: boolean;
   fvalueread: boolean;
{$ifdef mse_with_ifi}
   fifilink: tifivaluelinkcomp;
   procedure ifisetvalue(var avalue; var accept: boolean);
   function getifilinkkind: ptypeinfo;
   procedure setifilink(const avalue: tifilinkcomp);
   function getifilink: tifilinkcomp;
   function ifigriddata: tdatalist;
   procedure updateifigriddata(const sender: tobject; const alist: tdatalist);
   function getgriddata: tdatalist;
   function getvalueprop: ppropinfo;
{$endif}
   procedure setcolorglyph(const Value: colorty);
   procedure setstatfile(const Value: tstatfile);
   procedure setoptionsedit(const avalue: optionseditty);
   function getreadonly: boolean;
   procedure setreadonly(const avalue: boolean);
   function getedited: boolean; virtual;
   procedure setedited(const avalue: boolean); virtual;
  protected
   fgridintf: iwidgetgrid;
   fgriddatalink: pointer;
   fstate: dataeditstatesty;
//   fisdb: boolean;
 
//   procedure setisdb;  
   function geteditstate: dataeditstatesty;
   procedure seteditstate(const avalue: dataeditstatesty);
   function getoptionsedit: optionseditty; virtual;
   procedure updateoptions; virtual;
   procedure loaded; override;
   procedure internalcreateframe; override;
   procedure setenabled(const avalue: boolean); override;

   function getgridintf: iwidgetgrid;
   procedure checkgrid;
   procedure internalfillcol(const value);
   procedure internalassigncol(const value);
   procedure internalgetgridvalue(index: integer; out value);
   procedure internalsetgridvalue(index: integer; const avalue);
   procedure dochange; virtual;
   function docheckvalue(var avalue): boolean; virtual;
   procedure valuechanged;
   procedure modified; virtual; //for dbwidgets
   procedure formatchanged;
   procedure dopaint(const canvas: tcanvas); override;
   function needsfocuspaint: boolean; override;
   procedure internalcheckvalue(var avalue; var accept: boolean);
                                                            virtual; abstract;
   procedure paintglyph(const canvas: tcanvas; const acolorglyph: colorty;
                        const avalue; const arect: rectty);
                 virtual; abstract;
   procedure dofontheightdelta(var delta: integer); override;
   procedure sizechanged; override;
   
   procedure updatereadonlystate; virtual;
   procedure initeditfocus;
   
    //igridwidget
   procedure setfirstclick;
   function createdatalist(const sender: twidgetcol): tdatalist; virtual; abstract;
   procedure datalistdestroyed; virtual;
   function getdatatype: listdatatypety; virtual; abstract;
   function getdefaultvalue: pointer; virtual;
   function getrowdatapo(const arow: integer): pointer; virtual;
   procedure setgridintf(const intf: iwidgetgrid); virtual;
   function getcellframe: framety; virtual;
   function getcellcursor(const arow: integer; 
                        const acellzone: cellzonety): cursorshapety; virtual;
   procedure updatecellzone(const arow: integer; const apos: pointty;
                            var result: cellzonety); virtual;
   procedure drawcell(const canvas: tcanvas);
   procedure updateautocellsize(const canvas: tcanvas); virtual;
   procedure beforecelldragevent(var ainfo: draginfoty; const arow: integer;
                               var handled: boolean); virtual;
   procedure aftercelldragevent(var ainfo: draginfoty; const arow: integer;
                               var handled: boolean); virtual;
   procedure valuetogrid(row: integer); virtual; abstract;
   procedure gridtovalue(row: integer); virtual;
   function getnulltext: msestring;
   procedure docellevent(const ownedcol: boolean;
                                        var info: celleventinfoty); virtual;
   function sortfunc(const l,r): integer; virtual;
   procedure gridvaluechanged(const index: integer); virtual;
   procedure updatecoloptions(const aoptions: coloptionsty);
   procedure updatecoloptions1(const aoptions: coloptions1ty);
   procedure statdataread; virtual;
   procedure griddatasourcechanged; virtual;
   procedure fontchanged; override;

   //istatfile
   procedure dostatread(const reader: tstatreader);
   procedure dostatwrite(const writer: tstatwriter);
   procedure statreading;
   procedure statread;
   function getstatvarname: msestring;

   procedure readstatvalue(const reader: tstatreader); virtual;
   procedure writestatvalue(const writer: tstatwriter); virtual;
   procedure readstatstate(const reader: tstatreader); virtual;
   procedure writestatstate(const writer: tstatwriter); virtual;
   procedure readstatoptions(const reader: tstatreader); virtual;
   procedure writestatoptions(const writer: tstatwriter); virtual;

//   property optionsdb: optionseditdbty read foptionsdb write foptionsdb;   
  public
   constructor create(aowner: tcomponent); override;
   procedure initnewcomponent(const ascale: real); override;
   procedure initnewwidget(const ascale: real); override;
   procedure initgridwidget; virtual;

   property edited: boolean read getedited write setedited;
   function actualcolor: colorty; override;
   function widgetcol: twidgetcol;
   function gridrow: integer;
   function gridcol: integer;
   function griddata: tdatalist;

   function checkvalue: boolean; virtual; abstract;
   function seteditfocus: boolean;

   property objectlinker: tobjectlinker read getobjectlinker
                {$ifdef msehasimplements}implements istatfile{$endif};
//   property oncellevent: celleventty read foncellevent write foncellevent;
   property colorglyph: colorty read fcolorglyph write setcolorglyph
           default cl_glyph;
   property readonly: boolean read getreadonly write setreadonly;
  published
   property statfile: tstatfile read fstatfile write setstatfile;
   property statvarname: msestring read getstatvarname write fstatvarname;
   property optionsedit: optionseditty read getoptionsedit write setoptionsedit
                              default defaultoptionsedit;
   property onchange: notifyeventty read fonchange write fonchange;
   property ondataentered: notifyeventty read fondataentered write fondataentered;
//   property onmouseevent: mouseeventty read fonmouseevent write fonmouseevent;
//   property onkeydown: keyeventty read fonkeydown write fonkeydown;
 end;

 tpointeredit = class;
 
 paintpointerglypheventty = procedure(const sender: tpointeredit;
           const acanvas: tcanvas; const avalue: pointer;
                                      const arow: integer) of object;
                    
 tpointeredit = class(tgraphdataedit)
  private
   fvalue: pointer;
   fonpaintglyph: paintpointerglypheventty;
   procedure setvalue(const avalue: pointer);
   function getgridvalue(const index: integer): pointer;
   procedure setgridvalue(const index: integer; const avalue: pointer);
   function getgridvalues: pointerarty;
   procedure setgridvalues(const avalue: pointerarty);
  protected
   function createdatalist(const sender: twidgetcol): tdatalist; override;
   function getdatatype: listdatatypety; override;
   procedure paintglyph(const canvas: tcanvas; const acolorglyph: colorty;
                const avalue; const arect: rectty); override;
//   procedure dopaint(const canvas: tcanvas); override;
   procedure gridtovalue(arow: integer); override;
   procedure valuetogrid(arow: integer); override;
  public
   procedure initnewcomponent(const ascale: real); override;
   property value: pointer read fvalue write setvalue default nil;
   property gridvalue[const index: integer]: pointer
        read getgridvalue write setgridvalue; default;
   property gridvalues: pointerarty read getgridvalues write setgridvalues;
  published
   property visible;
   property enabled;
   property onpaintglyph: paintpointerglypheventty read fonpaintglyph 
                                                         write fonpaintglyph;
 end;
 
 tsliderscrollbar = class(tcustomscrollbar,iface)
  private
   fface: tface;
   procedure setface(const avalue: tface);
  protected
   //iface
   procedure invalidate;
   function translatecolor(const acolor: colorty): colorty;
   function getclientrect: rectty;
   procedure setlinkedvar(const source: tmsecomponent; var dest: tmsecomponent;
               const linkintf: iobjectlink = nil);
   function getcomponentstate: tcomponentstate;
   procedure widgetregioninvalid;
//   function getwidget: twidget;
  public
   constructor create(intf: iscrollbar; org: originty = org_client;
              ondimchanged: proceventty = nil); override;
   destructor destroy; override;
   procedure paint(const canvas: tcanvas; const acolor: colorty = cl_none); override;
  published
   property options default defaultsliderscrollbaroptions;
//   property width;
//   property indentstart;
//   property indentend;
   property stepsize;
   property stepctrlfact;
   property pagesize;
   property wheelsensitivity;
   property buttonlength default defaultbuttonminlength;
   property buttonendlength;
   property buttonminlength;
   property color;
   property colorpattern;
   property colorglyph;
   property facebutton;
   property faceendbutton;
   property framebutton;
   property frameendbutton1;
   property frameendbutton2;
   property face: tface read fface write setface;
 end;

 tcustomrealgraphdataedit = class(tgraphdataedit)
  private
   fonsetvalue: setrealeventty;
   fdirection: graphicdirectionty;
   procedure setvalue(const avalue: realty);
   function getgridvalue(const index: integer): realty;
   procedure setgridvalue(const index: integer; const avalue: realty);
   function getgridvalues: realarty;
   procedure setgridvalues(const avalue: realarty);
  protected
   fvalue: realty;
   procedure setdirection(const avalue: graphicdirectionty); virtual;
   function createdatalist(const sender: twidgetcol): tdatalist; override;
   function getdatatype: listdatatypety; override;
   procedure valuetogrid(arow: integer); override;
   procedure gridtovalue(arow: integer); override;
   procedure internalcheckvalue(var avalue; var accept: boolean); override;
   procedure readstatvalue(const reader: tstatreader); override;
   procedure writestatvalue(const writer: tstatwriter); override;
   procedure setnullvalue; virtual; //for dbedits
  {$ifdef mse_with_ifi}
   function getifilink: tifireallinkcomp;
   procedure setifilink(const avalue: tifireallinkcomp);
  {$endif}
  public
   constructor create(aowner: tcomponent); override;
   procedure fillcol(const value: realty);
   procedure assigncol(const avalue: trealdatalist);
   function checkvalue: boolean; override;
   function isnull: boolean;
   property gridvalue[const index: integer]: realty
        read getgridvalue write setgridvalue; default;
   property gridvalues: realarty read getgridvalues write setgridvalues;
   property value: realty read fvalue write setvalue;
   property onsetvalue: setrealeventty read fonsetvalue write fonsetvalue;
   property direction: graphicdirectionty read fdirection write setdirection default gd_right;
  published
   property visible;
   property enabled;
   property bounds_cx default defaultsliderwidth;
   property bounds_cy default defaultsliderheight;
  {$ifdef mse_with_ifi}
   property ifilink: tifireallinkcomp  read getifilink write setifilink;
  {$endif}
 end;

 trealgraphdataedit = class(tcustomrealgraphdataedit)
  published
   property value;
   property onsetvalue;
   property direction;
 end;
 
const
  defaultslideroptionswidget = defaultoptionswidget + [ow_mousewheel];
type
 tcustomslider = class(tcustomrealgraphdataedit,iscrollbar)
  private
   fscrollbar: tsliderscrollbar;
   fupdating: integer;
   procedure setscrollbar(const avalue: tsliderscrollbar);
  protected
   procedure setdirection(const avalue: graphicdirectionty); override;
   procedure objectchanged(const sender: tobject); override;
   procedure clientrectchanged; override;
   procedure clientmouseevent(var info: mouseeventinfoty); override;
   procedure domousewheelevent(var info: mousewheeleventinfoty); override;
   procedure dokeydown(var info: keyeventinfoty); override;
   procedure doenter; override;
   procedure doexit; override;
   procedure activechanged; override;
   procedure scrollevent(sender: tcustomscrollbar; event: scrolleventty);

   procedure dochange; override;
   procedure paintglyph(const canvas: tcanvas;  const acolorglyph: colorty;
                  const avalue; const arect: rectty); override;
  public
   constructor create(aowner: tcomponent); override;
   destructor destroy; override;
   procedure initgridwidget; override;
   property scrollbar: tsliderscrollbar read fscrollbar write setscrollbar;
  published
   property optionswidget default defaultslideroptionswidget;
 end;

 tslider = class(tcustomslider)
  published
   property value;
   property scrollbar;
   property onsetvalue;
   property direction;
 end;
 
const
 defaultbarcolor = cl_ltblue;
 
type
 tbarface = class(tface)
  public
   constructor create(const intf: iface); reintroduce;
 end;

 tcustomprogressbar = class;
  
 tbarframe = class(tframe)
  private
   fowner: tcustomprogressbar;
  public
   constructor create(const aowner: tcustomprogressbar);
 end;

 tcustomprogressbar = class(tcustomrealgraphdataedit,iface)
  private
   fbar_face: tbarface;
   fbar_frame: tbarframe;
   ffacerect: rectty;
   fframebarrect: rectty;
   ffacebarrect: rectty;
   fvaluerange: real;
   fvaluestart: real;
   fformat: string;
   ftextflags: textflagsty;
   fonfinished: progresseventty;
   fonprogress: progresseventty;
   fcancel: boolean;
   procedure setvalue(const avalue: realty);
   procedure setbar_face(const avalue: tbarface);
   procedure updatebarrect(const avalue: realty; const arect: rectty;
                    out facedest,framebardest,facebardest: rectty);
   procedure updatebar;
   procedure setvaluerange(const avalue: real);
   procedure setvaluestart(const avalue: real);
   procedure setformat(const avalue: string);
   procedure settextflags(const avalue: textflagsty);
   procedure setbar_frame(const avalue: tbarframe);
   procedure readformat(reader: treader);
   procedure writeformat(writer: twriter);
   procedure readvaluescale(reader: treader);
  protected
   procedure clientrectchanged; override;
   procedure dochange; override;
   procedure paintglyph(const canvas: tcanvas;  const acolorglyph: colorty;
                  const avalue; const arect: rectty); override;
   procedure internalcreateframe; override;
   procedure defineproperties(filer: tfiler); override;
  public
   constructor create(aowner: tcomponent); override;
   destructor destroy; override;
   procedure changedirection(const avalue: graphicdirectionty;
                                      var dest: graphicdirectionty); override;
   procedure doprogress(const sender: tobject; const avalue: real;
                                               var acancel: boolean);
                             //threadsave
   property cancel: boolean read fcancel write fcancel;
                    //ored with doprogress.acancel, resetted by value:= 0.0
   property value: realty read fvalue write setvalue;
          //threadsave, range 0 .. 1.0
  published
   property onsetvalue;
   property direction;

   property optionswidget default defaultoptionswidgetnofocus;
   property bar_face: tbarface read fbar_face write setbar_face;
   property bar_frame: tbarframe read fbar_frame write setbar_frame;
   property valuerange: real read fvaluerange write setvaluerange; //default 100
   property valuestart: real read fvaluestart write setvaluestart;
   property format: string read fformat write setformat stored false;
                   //default '0%', '' for no numeric
   property textflags: textflagsty read ftextflags write settextflags default
                              [tf_ycentered,tf_xcentered];
   property font: twidgetfont read getfont write setfont stored isfontstored;
   property onprogress: progresseventty read fonprogress write fonprogress;
               //called from doprogress
   property onfinished: progresseventty read fonfinished write fonfinished;
               //called in doprogress if avalue = 1.0 or canceled
 end;

 tprogressbar = class(tcustomprogressbar)
  published
   property value;
 end;
  
 ttogglegraphdataedit = class(tgraphdataedit)
  private
   foptions: buttonoptionsty;
   function getcheckedrow: integer;
   procedure setcheckedrow(const avalue: integer);
  protected
   fcheckcaption: boolean;
   fclickedrow: integer;
   procedure setoptions(const avalue: buttonoptionsty); virtual;
   procedure togglevalue(const areadonly: boolean;
                               const down: boolean); virtual; abstract;
   procedure togglegridvalue(const index: integer); virtual; abstract;
   procedure resetgridvalue(const index: integer); virtual; abstract;
   procedure checkgridvalue(const index: integer); virtual; abstract;
   function gridvaluechecked(const aindex: integer): boolean; virtual; abstract;
   procedure mouseevent(var info: mouseeventinfoty); override;
   procedure dokeyup(var info: keyeventinfoty); override;
   procedure doshortcut(var info: keyeventinfoty; const sender: twidget); override;
   procedure statechanged; override;
   procedure docellevent(const ownedcol: boolean; 
                       var info: celleventinfoty); override;
   procedure modified; override;
   procedure checkradiorow(aindex: integer);
  public
   constructor create(aowner: tcomponent); override;
   property checkedrow: integer read getcheckedrow write setcheckedrow; 
          //needs bo_radiotemcol, -1 if none
  published
   property options: buttonoptionsty read foptions write setoptions
               default defaultbuttonoptions;
   property colorglyph;
 end;

 tcustombooleanedit = class;
 booleaneditarty = array of tcustombooleanedit;

 tcustombooleanedit = class(ttogglegraphdataedit)
  private
   fvalue: longbool;
   fvaluedefault: longbool;
   fonsetvalue: setbooleaneventty;
   fgroup: integer;
   procedure setvalue(const Value: boolean); virtual;
   function getglyph: stockglyphty; virtual;
   function getgridvalue(const index: integer): longbool;
   procedure setgridvalue(const index: integer; const Value: longbool); virtual;
   function getgridvalues: longboolarty;
   procedure setgridvalues(const Value: longboolarty);
   function getgridbooleanvalues: booleanarty;
   procedure setgridbooleanvalues(const Value: booleanarty);
   function getvalue: boolean;
   function getvaluedefault: boolean;
   procedure setvaluedefault(const Value: boolean);
  {$ifdef mse_with_ifi}
   function getifilink: tifibooleanlinkcomp;
   procedure setifilink(const avalue: tifibooleanlinkcomp);
  {$endif}
  protected
   class function classskininfo: skininfoty; override;
   procedure setnullvalue;
   function getdefaultvalue: pointer; override;
   procedure valuetogrid(arow: integer); override;
   procedure gridtovalue(arow: integer); override;
   procedure resetgridvalue(const index: integer); override;
   procedure checkgridvalue(const index: integer); override;
   function gridvaluechecked(const aindex: integer): boolean; override;
   function createdatalist(const sender: twidgetcol): tdatalist; override;
   function getdatatype: listdatatypety; override;
   procedure togglevalue(const areadonly: boolean;
                                    const down: boolean); override;
   procedure paintglyph(const canvas: tcanvas;  const acolorglyph: colorty; 
                    const avalue; const arect: rectty); override;
   procedure internalcheckvalue(var avalue; var accept: boolean); override;
   procedure readstatvalue(const reader: tstatreader); override;
   procedure writestatvalue(const writer: tstatwriter); override;
   function getvaluebitmask: longword;
   procedure setvaluebitmask(const avalue: longword);
   function getgridvaluebitmask(const index: integer): longword;
   procedure setgridvaluebitmask(const index: integer; const avalue: longword);
   procedure dokeydown(var info: keyeventinfoty); override;
  public
   constructor create(aowner: tcomponent); override;
   procedure fillcol(const avalue: longbool);
   function checkvalue: boolean; override;
   procedure togglegridvalue(const index: integer); override;
   
   property value: boolean read getvalue write setvalue default false;
   property valuedefault: boolean read getvaluedefault 
                                       write setvaluedefault default false;
                      //streaming of longbool does not work on kylix and fpc
   property gridvalue[const index: integer]: longbool
                          read getgridvalue write setgridvalue; default;
   function valuetag(const falsevalue: integer): integer;
   function valuetagbit: longword;
                  //if value -> bits[tag] else -> 0
   function gridvaluetagbit(const index: integer): longword;
                  //if value -> bits[tag] else -> 0
   property valuebitmask: longword read getvaluebitmask write setvaluebitmask;
                  //ored valuetagbit of all edits in group
   property gridvaluebitmask[const index: integer]: longword 
                           read getgridvaluebitmask write setgridvaluebitmask;
                  //ored valuetagbit of all edits in group

   function gridvaluetag(const index: integer; 
                                         const falsevalue: integer): integer;
           //if value = true -> tag, falsevalue otherwise
   procedure updatetagvalue(const bitset: integer);
           //value -> true if bitset and tag <> 0
   procedure gridupdatetagvalue(const index: integer; const bitset: integer);
   property gridvalues: longboolarty read getgridvalues write setgridvalues;
   property gridbooleanvalues: booleanarty read getgridbooleanvalues 
                                                 write setgridbooleanvalues;
   function groupmembers: booleaneditarty;
   function tagitem(const atag: integer): tcustombooleanedit; //nil if none

   property bounds_cx default defaultboxsize;
   property bounds_cy default defaultboxsize;
   property onsetvalue: setbooleaneventty read fonsetvalue write fonsetvalue;
   property group: integer read fgroup write fgroup default 0;
{$ifdef mse_with_ifi}
   property ifilink: tifibooleanlinkcomp read getifilink write setifilink;
{$endif}
  published
   property visible;
   property enabled;
 end;

 tbooleanedit = class(tcustombooleanedit)
  published
   property bounds_cx  default defaultboxsize;
   property bounds_cy  default defaultboxsize;
   property onsetvalue;
   property value;
   property valuedefault;
   property group;
{$ifdef mse_with_ifi}
   property ifilink;
{$endif}
 end;
 
 tcustombooleaneditradio = class(tcustombooleanedit)
  private
   function getglyph: stockglyphty; override;
   procedure reset;
   procedure setvalue(const avalue: boolean); override;
   function getcheckedtag: integer;
   procedure setcheckedtag(const avalue: integer);
   procedure setgridvalue(const aindex: integer; const aValue: longbool); override;
   function internalcheckeditem(out single: boolean): tcustombooleaneditradio; //nil if none
  protected
   fresetting: integer;
   procedure togglevalue(const areadonly: boolean;
                              const down: boolean); override;
  public
   procedure togglegridvalue(const index: integer); override;
   function checkeditem: tcustombooleaneditradio; //nil if none
   property checkedtag: integer read getcheckedtag write setcheckedtag;
                             //-1 if none checked
 end;

 tbooleaneditradio = class(tcustombooleaneditradio)
  published
   property bounds_cx  default defaultboxsize;
   property bounds_cy  default defaultboxsize;
   property onsetvalue;
   property value;
   property valuedefault;
   property group;
 end;

 tcustomintegergraphdataedit = class(ttogglegraphdataedit)
  private
   fvalue: integer;
   fvaluedefault: integer;
   fonsetvalue: setintegereventty;
   fmin: integer;
   fmax: integer;
   fdatalist: tintegerdatalist;
   procedure setvalue(const Value: integer);
   function getgridvalue(const index: integer): integer;
   procedure setgridvalue(const index, Value: integer);
   function getgridvalues: integerarty;
   procedure setgridvalues(const Value: integerarty);
  {$ifdef mse_with_ifi}
   function getifilink: tifiintegerlinkcomp;
   procedure setifilink(const avalue: tifiintegerlinkcomp);
  {$endif}
  protected
   procedure setgridintf(const intf: iwidgetgrid); override;
   function createdatalist(const sender: twidgetcol): tdatalist; override;
   function getdatatype: listdatatypety; override;
   function getdefaultvalue: pointer; override;
   procedure valuetogrid(arow: integer); override;
   procedure gridtovalue(arow: integer); override;
   procedure resetgridvalue(const index: integer); override;
   procedure checkgridvalue(const index: integer); override;
   function gridvaluechecked(const aindex: integer): boolean; override;
   procedure internalcheckvalue(var avalue; var accept: boolean); override;
   procedure readstatvalue(const reader: tstatreader); override;
   procedure writestatvalue(const writer: tstatwriter); override;
   procedure togglevalue(const areadonly: boolean;
                                   const down: boolean); override;
   procedure doinc(var avalue: integer; const down: boolean);
   procedure datalistdestroyed; override;
  public
   function checkvalue: boolean; override;
   procedure togglegridvalue(const index: integer); override;
   procedure fillcol(const avalue: integer);
   property gridvalue[const index: integer]: integer
        read getgridvalue write setgridvalue; default;
   property gridvalues: integerarty read getgridvalues write setgridvalues;
   property datalist: tintegerdatalist read fdatalist;
   property onsetvalue: setintegereventty read fonsetvalue write fonsetvalue;
   property value: integer read fvalue write setvalue default 0;
   property valuedefault: integer read fvaluedefault write fvaluedefault default 0;
   property min: integer read fmin write fmin default 0; //checked by togglevalue
   property max: integer read fmax write fmax default 0; //checked by togglevalue
  published
  {$ifdef mse_with_ifi}
   property ifilink: tifiintegerlinkcomp  read getifilink write setifilink;
  {$endif}
 end;

 tcustomdatabutton = class;
 
 tvaluefacearrayprop = class(tpersistentarrayprop)
  private
   fowner: tcustomdatabutton;
  protected
   function getitems(const index: integer): tface;
   procedure createitem(const index: integer; var item: tpersistent); override;
  public
   constructor create(const aowner: tcustomdatabutton);
   class function getitemclasstype: persistentclassty; override;
   property items[const index: integer]: tface read getitems; default;
 end;

 databuttoneventty = procedure(const sender: tcustomdatabutton) of object;
  
 tcustomdatabutton = class(tcustomintegergraphdataedit,iactionlink,iimagelistinfo)
  private
//   fonexecute: notifyeventty;
   fvaluefaces: tvaluefacearrayprop;
   fimageoffset: integer;
   fimagenums: tintegerarrayprop;
   fimagenr: integer;
   fimagenrdisabled: integer;
   fimageoffsetdisabled: integer;
   fimageoffsetmouse: integer;
   fimageoffsetclicked: integer;
   fvaluecaptions: tmsestringarrayprop;
   fonupdate: databuttoneventty;
   procedure setcolorglyph(const avalue: colorty);
   function iscolorglyphstored: boolean;
   procedure setvaluefaces(const avalue: tvaluefacearrayprop);
   procedure setvaluecaptions(const avalue: tmsestringarrayprop);
   procedure setcaption(const avalue: captionty);
   function iscaptionstored: boolean;
   function getimagelist: timagelist;
   procedure setimagelist(const avalue: timagelist);
   function isimageliststored: Boolean;
   procedure setcaptiondist(const avalue: integer);
   procedure setimagepos(const avalue: imageposty);
   procedure setimagenr(const avalue: imagenrty);
   function isimagenrstored: boolean;
   procedure setimageoffset(const avalue: integer);
   procedure setimagenums(const avalue: tintegerarrayprop);
   procedure setimagenrdisabled(const avalue: imagenrty);
   function isimagenrdisabledstored: Boolean;
   procedure setimageoffsetdisabled(const avalue: integer);
   procedure setimagedist(const avalue: integer);
   procedure setshortcut(const avalue: shortcutty);
   function isshortcutstored: boolean;
   function getshortcut: shortcutty;
   function getshortcut1: shortcutty;
   procedure setshortcut1(const avalue: shortcutty);
   function isshortcut1stored: boolean;
   procedure setonexecute(const avalue: notifyeventty);
   function isonexecutestored: boolean;
   procedure setonbeforeexecute(const avalue: accepteventty);
   function isonbeforeexecutestored: boolean;
   procedure setstate(const avalue: actionstatesty);
   function isstatestored: boolean;

   procedure setaction(const avalue: tcustomaction);
   procedure readcaptionpos(reader: treader);
   procedure settextflags(const avalue: textflagsty);
   procedure setshortcuts(const avalue: shortcutarty);
   procedure setshortcuts1(const avalue: shortcutarty);  
   procedure readshortcut(reader: treader);
   procedure readshortcut1(reader: treader);
   procedure readsc(reader: treader);
   procedure writesc(writer: twriter);
   procedure readsc1(reader: treader);
   procedure writesc1(writer: twriter);
   procedure setimageoffsetmouse(const avalue: integer);
   procedure setimageoffsetclicked(const avalue: integer);
  protected
   finfo: shapeinfoty;
   factioninfo: actioninfoty;
   procedure doidle(var again: boolean);
   procedure internalexecute;
   procedure doasyncevent(var atag: integer); override;
   procedure defineproperties(filer: tfiler); override;
   procedure loaded; override;
   procedure setenabled(const avalue: boolean); override;
   procedure setvisible(const avalue: boolean); override;

   procedure docellevent(const ownedcol: boolean; 
                       var info: celleventinfoty); override;
   
   procedure setcolor(const avalue: colorty); override;
   //iactionlink
   function getactioninfopo: pactioninfoty;
   function shortcutseparator: msechar;
   procedure calccaptiontext(var ainfo: actioninfoty);
   procedure actionchanged;

   procedure setnullvalue;
   procedure doexecute; virtual;
   procedure domousewheelevent(var info: mousewheeleventinfoty); override;
   procedure togglevalue(const areadonly: boolean;
                                 const down: boolean); override;
   procedure statechanged; override;
   procedure mouseevent(var info: mouseeventinfoty); override;
   procedure dokeydown(var info: keyeventinfoty); override;
   procedure dokeyup(var info: keyeventinfoty); override;
   procedure doshortcut(var info: keyeventinfoty; const sender: twidget); override;
   procedure clientrectchanged; override;
   function getframestateflags: framestateflagsty; override;
   procedure paintglyph(const canvas: tcanvas; const acolorglyph: colorty;
                  const avalue; const arect: rectty); override;
   procedure internalcreateframe; override;
   procedure setgridintf(const intf: iwidgetgrid); override;
   function checkfocusshortcut(var info: keyeventinfoty): boolean; override;
   procedure setactualimagenr(const avalue: integer);
   procedure setoptions(const avalue: buttonoptionsty); override;
   function verticalfontheightdelta: boolean; override;

   class function classskininfo: skininfoty; override;
  public
   constructor create(aowner: tcomponent); override;
   destructor destroy; override;
   procedure doupdate;
   procedure synctofontheight; override;
   procedure initgridwidget; override;
   procedure initnewcomponent(const ascale: real); override;
   property optionswidget default defaultoptionswidget - [ow_mousefocus];
   property valuefaces: tvaluefacearrayprop read fvaluefaces write setvaluefaces;
   property valuecaptions: tmsestringarrayprop read fvaluecaptions
                                                  write setvaluecaptions;
   property font: twidgetfont read getfont write setfont stored isfontstored;
   property action: tcustomaction read factioninfo.action write setaction;
   property caption: captionty read factioninfo.captiontext write setcaption stored iscaptionstored;
   property textflags: textflagsty read finfo.ca.textflags 
                         write settextflags default defaultcaptiontextflags;
   property imagepos: imageposty read finfo.ca.imagepos write setimagepos
                              default ip_center;
//   property captionpos: captionposty read finfo.ca.captionpos write setcaptionpos
//                              default cp_center;
   property captiondist: integer read finfo.ca.captiondist write setcaptiondist
                            default defaultshapecaptiondist;
   property imagelist: timagelist read getimagelist write setimagelist
                    stored isimageliststored;
   property imagenr: imagenrty read factioninfo.imagenr write setimagenr
                            stored isimagenrstored default -1;
   property imagenrdisabled: imagenrty read factioninfo.imagenrdisabled
                              write setimagenrdisabled
                            stored isimagenrdisabledstored default -2;
                      //-1 = none, -2 = grayed, -3 = imageoffsetdisabled
   property imagedist: integer read finfo.ca.imagedist 
                                               write setimagedist default 0;
   property colorglyph: colorty read factioninfo.colorglyph write setcolorglyph
                      stored iscolorglyphstored default cl_default;
   property shortcut: shortcutty read getshortcut write setshortcut
                            stored false default 0;
   property shortcut1: shortcutty read getshortcut1 write setshortcut1
                            stored false default 0;
   property shortcuts: shortcutarty read factioninfo.shortcut write setshortcuts;
   property shortcuts1: shortcutarty read factioninfo.shortcut1 write setshortcuts1;
   property onupdate: databuttoneventty read fonupdate write fonupdate;
   property onexecute: notifyeventty read factioninfo.onexecute
                            write setonexecute stored isonexecutestored;
   property onbeforeexecute: accepteventty read factioninfo.onbeforeexecute
                   write setonbeforeexecute stored isonbeforeexecutestored;

   property imageoffset: integer read fimageoffset write setimageoffset default 0;
   property imageoffsetdisabled: integer read fimageoffsetdisabled
                                 write setimageoffsetdisabled default 0;
   property imageoffsetmouse: integer read fimageoffsetmouse 
                                       write setimageoffsetmouse default 0;
   property imageoffsetclicked: integer read fimageoffsetclicked 
                                       write setimageoffsetclicked default 0;
   property imagenums: tintegerarrayprop read fimagenums write setimagenums;

   property options;
   property focusrectdist: integer read finfo.focusrectdist write finfo.focusrectdist 
                   default defaultshapefocusrectdist;
   property onsetvalue;
   property value default -1;
   property valuedefault default -1;
   property min default -1; 
   property max default 0;
  published
   property visible stored false;
   property enabled stored false;
   property state: actionstatesty read factioninfo.state write setstate 
                             stored isstatestored default [];
 end;

 tdatabutton = class(tcustomdatabutton)
  published
   property optionswidget;
   property optionsskin;
   property valuefaces;
   property valuecaptions;
   property font;

   property action;
   property caption;
   property textflags;
   property shortcut;
   property shortcut1;
   property imagepos;
   property captiondist;
   property imagelist;
   property imagenr;
   property imagenrdisabled;
   property imagedist;
   property colorglyph;
   property options;
   property focusrectdist;
   property onupdate;
   property onexecute;
   property onbeforeexecute;

   property imageoffset;
   property imageoffsetdisabled;
   property imageoffsetmouse;
   property imageoffsetclicked;
   property imagenums;
   property onsetvalue;
   property value;
   property valuedefault;
   property min; 
   property max;
 end;

 tstockglyphdatabutton = class(tcustomdatabutton)
  private
   fglyph: stockglyphty;
   procedure setglyph(const avalue: stockglyphty);
  public
   constructor create(aowner: tcomponent); override;
  published
   property action;
   
   property glyph: stockglyphty read fglyph write setglyph default stg_none;
   property imagenums;
   property optionswidget;
   property optionsskin;
   property valuefaces;
   property font;
   property caption;
   property textflags;
   property imagepos;
   property captiondist;
   property options;
   property imagedist;
   property focusrectdist;
   property onupdate;
   property onexecute;
   property onbeforeexecute;
   property onsetvalue;
   property value;
   property valuedefault;
   property min; 
   property max;
 end; 
 
 tcustomdataicon = class(tcustomintegergraphdataedit)
 //if value = -1 then blank else
 // if value < 0 then imagenums[0..30] are painted if bit[0..30] is 1
 //  else image[value] is painted
  private
   fimagelist: timagelist;
   fimageoffset: integer;
   fimagenums: tintegerarrayprop;
   procedure setimagelist(const aValue: timagelist);
   procedure setimageoffset(const aValue: integer);
   procedure imagenumschanged(const sender: tarrayprop; const index: integer);
   procedure setimagenums(const avalue: tintegerarrayprop);
  protected
   procedure setnullvalue;
   procedure paintglyph(const canvas: tcanvas; const acolorglyph: colorty;
                const avalue; const arect: rectty); override;
   procedure objectevent(const sender: tobject;
                             const event: objecteventty); override;
  public
   constructor create(aowner: tcomponent); override;
   destructor destroy; override;
   property imagelist: timagelist read fimagelist write setimagelist;
   property imageoffset: integer read fimageoffset write setimageoffset default 0;
   property imagenums: tintegerarrayprop read fimagenums write setimagenums;
   property valuedefault default -1;
   property value default -1;
  published
   property visible;
   property enabled;
 end;
 
 tdataicon = class(tcustomdataicon)
  published
   property onsetvalue;
   property value default -1;
   property valuedefault default -1;
   property min; 
   property max;
   property imagelist;
   property imageoffset;
   property imagenums;
 end;
 
implementation
uses
 SysUtils,msekeyboard,msebits,msereal,msedispwidgets,mseformatstr,mserichstring,
 mseactions,msestreaming;

type
 tcustomframe1 = class(tcustomframe);
 tdatalist1 = class(tdatalist);
 twidgetcol1 = class(twidgetcol);
 twidget1 = class(twidget);
 tarrayprop1 = class(tarrayprop);
 tcustomwidgetgrid1 = class(tcustomwidgetgrid);

const
 valuevarname = 'value';

{ tgrapheditframe }

constructor tgrapheditframe.create(const intf: icaptionframe);
begin
 inherited;
 fstate:= fstate + [fs_drawfocusrect,fs_captionfocus,fs_captionhint,
                     fs_paintrectfocus];
 fi.colorclient:= cl_foreground;
 fi.levelo:= -2;
 captionpos:= cp_right;
 internalupdatestate;
end;

{ tsliderscrollbar }

constructor tsliderscrollbar.create(intf: iscrollbar; org: originty;
  ondimchanged: proceventty);
begin
 inherited;
 foptions:= defaultsliderscrollbaroptions;
 buttonlength:= defaultbuttonminlength;
 fface:= tface.create(iface(self));
end;

destructor tsliderscrollbar.destroy;
begin
 inherited;
 fface.Free;
end;

procedure tsliderscrollbar.setface(const avalue: tface);
begin
 fface.assign(avalue);
end;
{
function tsliderscrollbar.getwidget: twidget;
begin
 result:= fintf.getwidget;
end;
}
function tsliderscrollbar.translatecolor(const acolor: colorty): colorty;
begin
 result:= fintf.translatecolor(acolor);
end;

procedure tsliderscrollbar.paint(const canvas: tcanvas;
                                          const acolor: colorty = cl_none);
begin
 fface.paint(canvas,fdrawinfo.scrollrect);
 inherited;
end;

procedure tsliderscrollbar.invalidate;
begin
 fintf.getwidget.invalidate;
end;

function tsliderscrollbar.getclientrect: rectty;
begin
 result:= fintf.getwidget.clientrect;
end;

procedure tsliderscrollbar.setlinkedvar(const source: tmsecomponent;
               var dest: tmsecomponent; const linkintf: iobjectlink = nil);
begin
 twidget1(fintf.getwidget).setlinkedvar(source,dest,linkintf);
end;

function tsliderscrollbar.getcomponentstate: tcomponentstate;
begin
 result:= fintf.getwidget.componentstate;
end;

procedure tsliderscrollbar.widgetregioninvalid;
begin
 twidget1(fintf.getwidget).widgetregioninvalid;
end;

{ tcustomrealgraphdataedit }

constructor tcustomrealgraphdataedit.create(aowner: tcomponent);
begin
 inherited;
 size:= makesize(defaultsliderwidth,defaultsliderheight);
end;

procedure tcustomrealgraphdataedit.setvalue(const avalue: realty);
begin
 if fvalue <> avalue then begin
  if not (des_isdb in fstate) and (avalue = emptyreal) then begin
   fvalue:= 0;
  end
  else begin
   fvalue:= avalue;
  end;
  valuechanged;
 end;
end;

function tcustomrealgraphdataedit.createdatalist(const sender: twidgetcol): tdatalist;
begin
 result:= tgridrealdatalist.create(sender);
end;

function tcustomrealgraphdataedit.getdatatype: listdatatypety;
begin
 result:= dl_real;
end;

procedure tcustomrealgraphdataedit.internalcheckvalue(var avalue; var accept: boolean);
begin
 if canevent(tmethod(fonsetvalue)) then begin
  fonsetvalue(self,realty(avalue),accept);
 end;
{$ifdef mse_with_ifi}
 ifisetvalue(avalue,accept);
{$endif} 
 if accept then begin
  value:= realty(avalue);
 end;
end;

procedure tcustomrealgraphdataedit.valuetogrid(arow: integer);
begin
 fgridintf.setdata(arow,fvalue);
end;

procedure tcustomrealgraphdataedit.gridtovalue(arow: integer);
begin
 fgridintf.getdata(arow,fvalue);
 inherited;
end;

procedure tcustomrealgraphdataedit.readstatvalue(const reader: tstatreader);
begin
 value:= reader.readreal(valuevarname,fvalue);
end;

procedure tcustomrealgraphdataedit.writestatvalue(const writer: tstatwriter);
begin
 writer.writereal(valuevarname,fvalue);
end;

procedure tcustomrealgraphdataedit.setdirection(const avalue: graphicdirectionty);
begin
 if fdirection <> avalue then begin
  if not (csreading in componentstate) then begin
   changedirection(avalue,fdirection);  
  end
  else begin
   fdirection:= avalue;
  end;
 end;
end;

function tcustomrealgraphdataedit.getgridvalue(const index: integer): realty;
begin
 internalgetgridvalue(index,result);
end;

procedure tcustomrealgraphdataedit.setgridvalue(const index: integer;
               const avalue: realty);
begin
 internalsetgridvalue(index,avalue);
end;

function tcustomrealgraphdataedit.getgridvalues: realarty;
begin
 result:= trealdatalist(fgridintf.getcol.datalist).asarray;
end;

procedure tcustomrealgraphdataedit.setgridvalues(const avalue: realarty);
begin
 trealdatalist(fgridintf.getcol.datalist).asarray:= avalue;
end;

procedure tcustomrealgraphdataedit.fillcol(const value: realty);
begin
 internalfillcol(value);
end;

procedure tcustomrealgraphdataedit.assigncol(const avalue: trealdatalist);
begin
 internalassigncol(avalue);
end;

function tcustomrealgraphdataedit.isnull: boolean;
begin
 result:= value = emptyreal;
end;

procedure tcustomrealgraphdataedit.setnullvalue;
begin
 value:= emptyreal;
end;

function tcustomrealgraphdataedit.checkvalue: boolean;
begin
 result:= docheckvalue(fvalue);
end;

{$ifdef mse_with_ifi}
function tcustomrealgraphdataedit.getifilink: tifireallinkcomp;
begin
 result:= tifireallinkcomp(fifilink);
end;

procedure tcustomrealgraphdataedit.setifilink(const avalue: tifireallinkcomp);
begin
 inherited setifilink(avalue);
end;
{$endif}

{ tcustomslider }

constructor tcustomslider.create(aowner: tcomponent);
begin
 fscrollbar:= tsliderscrollbar.create(iscrollbar(self));
// fscrollbar.options:= [sbo_moveauto];
 inherited;
 optionswidget:= defaultslideroptionswidget;
 size:= makesize(defaultsliderwidth,defaultsliderheight);
end;

destructor tcustomslider.destroy;
begin
 fscrollbar.Free;
 inherited;
end;

procedure tcustomslider.paintglyph(const canvas: tcanvas;
               const acolorglyph: colorty; const avalue; const arect: rectty);
var
 rea1: realty;
 col1: colorty;
begin
 if @avalue = nil then begin
  rea1:= fvalue;
  col1:= cl_none;
 end
 else begin
  rea1:= realty(avalue); //cell
  with cellinfoty(canvas.drawinfopo^) do begin
   col1:= color;
   canvas.move(innerrect.pos);
  end;
 end;
 if rea1 = emptyreal then begin
  rea1:= 0;
 end; 
 inc(fupdating);
 fscrollbar.value:= rea1;
 fscrollbar.paint(canvas,col1);
 if @avalue <> nil then begin
  canvas.remove(cellinfoty(canvas.drawinfopo^).innerrect.pos);
 end;
 dec(fupdating);
end;

procedure tcustomslider.setdirection(const avalue: graphicdirectionty);
begin
 fscrollbar.direction:= avalue;
 inherited;
end;

procedure tcustomslider.clientrectchanged;
begin
 inherited;
 fscrollbar.dim:= innerclientrect;
end;

procedure tcustomslider.clientmouseevent(var info: mouseeventinfoty);
begin
 if not (es_processed in info.eventstate) and not (csdesigning in componentstate) and
        not (oe_readonly in getoptionsedit) then begin
  fscrollbar.mouseevent(info);
 end;
 inherited;
end;

procedure tcustomslider.domousewheelevent(var info: mousewheeleventinfoty);
begin
 scrollbar.mousewheelevent(info);
 if not (es_processed in info.eventstate) then begin
  inherited;
 end;
end;

procedure tcustomslider.dokeydown(var info: keyeventinfoty);
begin
 if not (es_processed in info.eventstate) and not (csdesigning in componentstate) and
    not (oe_readonly in getoptionsedit) then begin
  fscrollbar.keydown(info);
 end;
 inherited;
end;

procedure tcustomslider.scrollevent(sender: tcustomscrollbar; event: scrolleventty);
var
 rea1: realty;
begin
 case event of
  sbe_valuechanged: begin
   if fupdating = 0 then begin
    inc(fupdating);
    rea1:= sender.value;
    if not docheckvalue(rea1) then begin
     sender.value:= value;
    end
    else begin
     sender.value:= rea1;
    end;
    dec(fupdating);
   end;
  end;
 end;
end;

procedure tcustomslider.doenter;
begin
 fscrollbar.enter;
 inherited;
end;

procedure tcustomslider.doexit;
begin
 fscrollbar.exit;
 inherited;
end;

procedure tcustomslider.activechanged;
begin
 fscrollbar.activechanged;
 inherited;
end;

procedure tcustomslider.setscrollbar(const avalue: tsliderscrollbar);
begin
 fscrollbar.assign(avalue);
end;

procedure tcustomslider.dochange;
begin
 inc(fupdating);
 fscrollbar.value:= fvalue;
 dec(fupdating);
 inherited;
end;

procedure tcustomslider.objectchanged(const sender: tobject);
begin
 inherited;
 fscrollbar.checktemplate(sender);
end;

procedure tcustomslider.initgridwidget;
begin
 inherited;
 fscrollbar.options:= fscrollbar.options + 
                       [sbo_noarrowkeys,sbo_nopagekeys,sbo_noreflectedclick];
 color:= cl_parent;
end;

{ tgraphdataedit }

constructor tgraphdataedit.create(aowner: tcomponent);
begin
 foptionsedit:= defaultoptionsedit;
 inherited;
 fcolorglyph:= cl_glyph;
end;

procedure tgraphdataedit.internalcreateframe;
begin
 tgrapheditframe.create(iscrollframe(self));
end;

procedure tgraphdataedit.setcolorglyph(const Value: colorty);
begin
 if fcolorglyph <> value then begin
  fcolorglyph := Value;
  invalidate;
 end;
end;

procedure tgraphdataedit.dopaint(const canvas: tcanvas);
var
 col1: colorty;
begin
 inherited;
 col1:= fcolorglyph;
 if col1 = cl_font then begin
  if (fgridintf <> nil) and (ffont = nil) then begin
   with fgridintf.getcol do begin
    col1:= rowfont(grid.row).color;
   end;
  end
  else begin
   col1:= getfont1.color;
  end;
 end;
 {$ifdef FPC} {$checkpointer off} {$endif}
 paintglyph(canvas,col1,nil^,innerclientrect);
 {$ifdef FPC} {$checkpointer default} {$endif}
 if (fgridintf <> nil) and not (csdesigning in componentstate) then begin
  fgridintf.widgetpainted(canvas);
 end;
end;

function tgraphdataedit.needsfocuspaint: boolean;
begin
 result:= (fgridintf = nil) and inherited needsfocuspaint;
end;

procedure tgraphdataedit.dofontheightdelta(var delta: integer);
begin
 inherited;
 gridwidgetfontheightdelta(self,fgridintf,delta);
end;

procedure tgraphdataedit.sizechanged;
begin
 inherited;
 gridwidgetsized(self,fgridintf);
end;

procedure tgraphdataedit.dochange;
begin
 if not (ws_loadedproc in fwidgetstate) then begin
  if canevent(tmethod(fonchange)) then begin
   fonchange(self);
  end;
{$ifdef mse_with_ifi}
  if fifiserverintf <> nil then begin
   fifiserverintf.valuechanged(iificlient(self));
  end;
{$endif}
 end;
 invalidate;
end;

procedure tgraphdataedit.setgridintf(const intf: iwidgetgrid);
begin
 fgridintf:= intf;
 if fgridintf <> nil then begin
  fgriddatalink:= tcustomwidgetgrid1(fgridintf.getgrid).getgriddatalink;
 end
 else begin
  fgriddatalink:= nil;
 end;
 {$ifdef mse_with_ifi}
{
 if fgridintf <> nil then begin
  if (fifilink <> nil) and (fifilink.controller.datalist <> nil) then begin
   updateifigriddata(fifilink.controller.datalist);
  end;
 end;
}
{$endif}

end;

function tgraphdataedit.getcellframe: framety;
begin
 if fframe <> nil then begin
  result:= fframe.cellframe;
 end
 else begin
  result:= nullframe;
 end;
end;

procedure tgraphdataedit.drawcell(const canvas: tcanvas);
var
 col1: colorty;
begin
 with cellinfoty(canvas.drawinfopo^) do begin
  if datapo <> nil then begin
   col1:= fcolorglyph;
   if col1 = cl_font then begin
    col1:= font.color;
   end;
   paintglyph(canvas,col1,datapo^,innerrect);
  end;
 end;
end;

procedure tgraphdataedit.updateautocellsize(const canvas: tcanvas);
begin
 //dummy;
end;

{
procedure tgraphdataedit.updatecellzone(const pos: pointty; var result: cellzonety);
begin
 //dummy
end;
}
procedure tgraphdataedit.initgridwidget;
begin
 defaultinitgridwidget(self,fgridintf);
 fgridintf.getcol.options:= fgridintf.getcol.options + [co_drawfocus];
{
 if fframe <> nil then begin
  with fframe do begin
   leveli:= 0;
   levelo:= 0;
   colorclient:= cl_transparent;
  end;
 end;
 fgridintf.getcol.options:= fgridintf.getcol.options + [co_drawfocus];
 optionswidget:= optionswidget - [ow_autoscale];
 optionsskin:= optionsskin + defaultgridskinoptions;
}
end;

function tgraphdataedit.docheckvalue(var avalue): boolean;
begin
 result:= true;
 internalcheckvalue(avalue,result);
 if result then begin
  fedited:= false;
  if canevent(tmethod(fondataentered)) then begin
   fondataentered(self);
  end;
 {$ifdef mse_with_ifi}
  if fifiserverintf <> nil then begin
   fifiserverintf.dataentered(iifidatalink(self),gridrow);
  end;
 {$endif}
 end;
end;
{
function tgraphdataedit.edited: boolean;
begin
 result:= fedited;
end;
}
procedure tgraphdataedit.initeditfocus;
begin
 //dummy
end;

procedure tgraphdataedit.initnewwidget(const ascale: real);
begin
 if fgridintf <> nil then begin
  fgridintf.getcol.options:= fgridintf.getcol.grid.datacols.options;
               //restore default options
 end;
 inherited;
end;

function tgraphdataedit.actualcolor: colorty;
begin
 if (fgridintf <> nil) and (fcolor = cl_default) then begin
  result:= fgridintf.getcol.rowcolor(fgridintf.getrow);
 end
 else begin
  result:= inherited actualcolor;
 end;
end;

procedure tgraphdataedit.initnewcomponent(const ascale: real);
begin
 inherited;
 internalcreateframe;
 fframe.scale(ascale);
end;

function tgraphdataedit.getstatvarname: msestring;
begin
 result:= fstatvarname;
end;

procedure tgraphdataedit.dostatread(const reader: tstatreader);
begin
 fvalueread:= false;
 if not (des_isdb in fstate) and (fgridintf = nil) and 
                        canstatvalue(foptionsedit,reader) then begin
  fvalueread:= true;
  readstatvalue(reader);
 end;
 if canstatstate(foptionsedit,reader) then begin
  readstatstate(reader);
 end;
 if canstatoptions(foptionsedit,reader) then begin
  readstatoptions(reader);
 end;
end;

procedure tgraphdataedit.dostatwrite(const writer: tstatwriter);
begin
 if not (des_isdb in fstate) and (fgridintf = nil) and 
                                 canstatvalue(foptionsedit,writer) then begin
  writestatvalue(writer);
 end;
 if canstatstate(foptionsedit,writer) then begin
  writestatstate(writer);
 end;
 if canstatoptions(foptionsedit,writer) then begin
  writestatoptions(writer);
 end;
end;

procedure tgraphdataedit.setstatfile(const Value: tstatfile);
begin
 setstatfilevar(istatfile(self),value,fstatfile);
end;

procedure tgraphdataedit.statreading;
begin
 //dummy
end;

procedure tgraphdataedit.statread;
begin
 if (oe_checkvaluepaststatread in foptionsedit) and fvalueread then begin
  checkvalue;
 end;
end;

procedure tgraphdataedit.setfirstclick;
begin
 //dummy
end;

function tgraphdataedit.getdefaultvalue: pointer;
begin
 result:= nil;
end;

function tgraphdataedit.getrowdatapo(const arow: integer): pointer;
begin
 result:= nil;
end;

function tgraphdataedit.getgridintf: iwidgetgrid;
begin
 result:= fgridintf;
end;

procedure tgraphdataedit.checkgrid;
begin
 if fgridintf = nil then begin
  raise exception.Create('No grid.');
 end;
end;

function tgraphdataedit.seteditfocus: boolean;
begin
 if not readonly then begin
  if fgridintf = nil then begin
   if canfocus then begin
    setfocus;
   end;
  end
  else begin
   with fgridintf.getcol do begin
    grid.col:= index;
    if grid.canfocus then begin
     if not focused then begin
      grid.setfocus;
     end;
    end; 
   end;
  end;
 end;
 result:= focused;
end;

function tgraphdataedit.griddata: tdatalist;
begin
 checkgrid;
 result:= fgridintf.getcol.datalist;
end;

function tgraphdataedit.widgetcol: twidgetcol;
begin
 if fgridintf = nil then begin
  result:= nil;
 end
 else begin
  result:= fgridintf.getcol;
 end;
end;

function tgraphdataedit.gridrow: integer;
begin
 if fgridintf = nil then begin
  result:= -1;
 end
 else begin
  result:= fgridintf.getcol.grid.row;
 end;
end;

function tgraphdataedit.gridcol: integer;
begin
 if fgridintf = nil then begin
  result:= -1;
 end
 else begin
  result:= fgridintf.getcol.index;
 end;
end;

procedure tgraphdataedit.gridtovalue(row: integer);
begin
 invalidate;
 //dochange;
end;

function tgraphdataedit.getnulltext: msestring;
begin
 result:= '';
end;

procedure tgraphdataedit.readstatoptions(const reader: tstatreader);
begin
 //dummy
end;

procedure tgraphdataedit.readstatstate(const reader: tstatreader);
begin
 //dummy
end;

procedure tgraphdataedit.readstatvalue(const reader: tstatreader);
begin
 //dummy
end;

procedure tgraphdataedit.writestatoptions(const writer: tstatwriter);
begin
 //dummy
end;

procedure tgraphdataedit.writestatstate(const writer: tstatwriter);
begin
 //dummy
end;

procedure tgraphdataedit.writestatvalue(const writer: tstatwriter);
begin
 //dummy
end;

function tgraphdataedit.geteditstate: dataeditstatesty;
begin
 result:= fstate;
end;

procedure tgraphdataedit.seteditstate(const avalue: dataeditstatesty);
begin
 fstate:= avalue;
end;
{
procedure tgraphdataedit.setisdb;
begin
 fisdb:= true;
end;
}
function tgraphdataedit.getoptionsedit: optionseditty;
begin
 result:= foptionsedit;
{$ifdef mse_with_ifi}
 if fifiserverintf <> nil then begin
  fifiserverintf.updateoptionsedit(result);
 end;
{$endif}
end;

procedure tgraphdataedit.updateoptions;
begin
 //dummy
end;

procedure tgraphdataedit.setoptionsedit(const avalue: optionseditty);
begin
 if foptionsedit <> avalue then begin
  foptionsedit:= avalue;
  if fgridintf <> nil then begin
   fgridintf.updateeditoptions(foptionsedit);
  end;
  updateoptions;
 end;
end;

function tgraphdataedit.sortfunc(const l, r): integer;
begin
 result:= tdatalist1(twidgetcol1(fgridintf.getcol).fdata).compare(l,r);
end;

procedure tgraphdataedit.internalgetgridvalue(index: integer;
  out value);
begin
 checkgrid;
 fgridintf.getdata(index,value);
end;

procedure tgraphdataedit.internalsetgridvalue(index: integer;
                                                        const avalue);
begin
 checkgrid;
 fgridintf.setdata(index,avalue);
end;

procedure tgraphdataedit.docellevent(const ownedcol: boolean; var info: celleventinfoty);
begin
 //dummy
end;

procedure tgraphdataedit.valuechanged;
begin
 if not (csloading in componentstate) then begin
  if (fgridintf <> nil) and not (csdesigning in componentstate) then begin
   valuetogrid(fgridintf.getrow);
  end;
  if not (ws_loadedproc in fwidgetstate) then begin
   modified;
  end;
  dochange;
 end;
end;

procedure tgraphdataedit.formatchanged;
begin
 if not (csloading in componentstate) then begin
  if fgridintf <> nil then begin
   fgridintf.changed;
  end;
  invalidate;
 end;
end;

procedure tgraphdataedit.loaded;
begin
 inherited;
 include(fwidgetstate,ws_loadedproc);
 try
  valuechanged;
  formatchanged;
 finally
  exclude(fwidgetstate,ws_loadedproc);
 end;
end;

procedure tgraphdataedit.gridvaluechanged(const index: integer);
begin
 //dummy
end;

procedure tgraphdataedit.updatecoloptions(const aoptions: coloptionsty);
var
 opt1: optionseditty;
begin
 opt1:= foptionsedit;
 fgridintf.coloptionstoeditoptions(opt1);
 optionsedit:= opt1;
end;

procedure tgraphdataedit.updatecoloptions1(const aoptions: coloptions1ty);
begin
 //dummy
end;

procedure tgraphdataedit.statdataread;
begin
 //dummy
end;

procedure tgraphdataedit.griddatasourcechanged;
begin
 //dummy
end; 

procedure tgraphdataedit.updatereadonlystate;
begin
 //dummy
end;

procedure tgraphdataedit.internalfillcol(const value);
begin
 checkgrid;
 with tdatalist1(fgridintf.getcol.datalist) do begin
  tdatalist1(fgridintf.getcol.datalist).internalfill(count,value);
 end;
end;

procedure tgraphdataedit.internalassigncol(const value);
begin
 checkgrid;
 with fgridintf.getcol do begin
  datalist.Assign(tdatalist(value));
 end;
end;

procedure tgraphdataedit.setenabled(const avalue: boolean);
begin
 inherited;
 if (fgridintf <> nil) and not (csloading in componentstate) then begin
  fgridintf.getcol.enabled:= avalue;
 end;
end;

function tgraphdataedit.getreadonly: boolean;
begin
 result:= oe_readonly in foptionsedit;
end;

procedure tgraphdataedit.setreadonly(const avalue: boolean);
begin
 if avalue then begin
  optionsedit:= optionsedit + [oe_readonly];
 end
 else begin
  optionsedit:= optionsedit - [oe_readonly];
 end;  
end;

procedure tgraphdataedit.beforecelldragevent(var ainfo: draginfoty;
               const arow: integer; var handled: boolean);
begin
 //dummy
end;

procedure tgraphdataedit.aftercelldragevent(var ainfo: draginfoty;
               const arow: integer; var handled: boolean);
begin
 //dummy
end;

procedure tgraphdataedit.fontchanged;
begin
 inherited;
 if fcolorglyph = cl_font then begin
  invalidate;
 end;
end;

procedure tgraphdataedit.modified;
begin
 //dummy
end;

function tgraphdataedit.getcellcursor(const arow: integer;
                              const acellzone: cellzonety): cursorshapety;
begin
 result:= actualcursor(nullpoint);
end;

procedure tgraphdataedit.updatecellzone(const arow: integer;
                                  const apos: pointty; var result: cellzonety);
begin
 //dummy
end;

procedure tgraphdataedit.datalistdestroyed;
begin
 //dummy
end;

{$ifdef mse_with_ifi}
function tgraphdataedit.getifilinkkind: ptypeinfo;
begin
 result:= typeinfo(iifidatalink);
end;

function tgraphdataedit.getifilink: tifilinkcomp;
begin
 result:= fifilink;
end;

procedure tgraphdataedit.setifilink(const avalue: tifilinkcomp);
begin
 mseificomp.setifilinkcomp(iifidatalink(self),avalue,tifilinkcomp(fifilink));
end;

procedure tgraphdataedit.ifisetvalue(var avalue; var accept: boolean);
begin
 if accept and (fifiserverintf <> nil) then begin
  fifiserverintf.setvalue(iifidatalink(self),avalue,accept,gridrow);
 end;
end;

function tgraphdataedit.ifigriddata: tdatalist;
begin
 result:= nil;
 if fgridintf <> nil then begin
  result:= fgridintf.getcol.datalist;
 end;
end;

procedure tgraphdataedit.updateifigriddata(const sender: tobject; 
                                                    const alist: tdatalist);
begin
 if fgridintf <> nil then begin
  fgridintf.updateifigriddata(alist);
 end;
end;

function tgraphdataedit.getgriddata: tdatalist;
begin
 result:= nil;
 if fgridintf <> nil then begin
  result:= fgridintf.getcol.datalist;
 end;
end;

function tgraphdataedit.getvalueprop: ppropinfo;
begin
  result:= getpropinfo(self,'value');
end;
{$endif mse_with_ifi}

function tgraphdataedit.getedited: boolean;
begin
 result:= fedited;
end;

procedure tgraphdataedit.setedited(const avalue: boolean);
begin
 fedited:= avalue;
end;


{ ttogglegraphdataedit}

constructor ttogglegraphdataedit.create(aowner: tcomponent);
begin
 fclickedrow:= -1;
 foptions:= defaultbuttonoptions;
 inherited;
end;

procedure ttogglegraphdataedit.dokeyup(var info: keyeventinfoty);
begin
 with info do begin
  if (key = key_space) and
        (shiftstate = []) and (bo_executeonkey in foptions) then begin
   include(eventstate,es_processed);
   togglevalue(oe_readonly in getoptionsedit,false);
  end;
 end;
 inherited;
end;

procedure ttogglegraphdataedit.doshortcut(var info: keyeventinfoty; const sender: twidget);
begin
 if (bo_executeonshortcut in foptions) and checkfocusshortcut(info) then begin
  include(info.eventstate,es_processed);
  togglevalue(oe_readonly in getoptionsedit,false);
  if (bo_focusonshortcut in foptions) and canfocus then begin
   setfocus;
  end;
 end;
 if not (es_processed in info .eventstate) then begin
  inherited;
 end;
end;

procedure ttogglegraphdataedit.mouseevent(var info: mouseeventinfoty);
var
 bo1: boolean;
begin
 bo1:= not (csdesigning in componentstate) and 
          iswidgetclick(info,fcheckcaption) and (bo_executeonclick in foptions);
 inherited;
 if bo1 then begin
         //twidgetgrid needs childmouseevent
  togglevalue(oe_readonly in getoptionsedit,false);
 end;
end;

procedure ttogglegraphdataedit.docellevent(const ownedcol: boolean;
               var info: celleventinfoty);
var
 clickedrowbefore: integer;
begin
 inherited;
 if (bo_resetcheckedonrowexit in foptions) and isrowchange(info) and 
           (info.newcell.row <> checkedrow) then begin
  checkedrow:= -1;
 end;
 if ownedcol and (info.eventkind in 
             [cek_buttonpress,cek_buttonrelease,cek_mouseleave]) then begin
  clickedrowbefore:= fclickedrow;
  case info.eventkind of
   cek_mouseleave: begin
    fclickedrow:= -1;
   end;
   cek_buttonpress: begin
    if (bo_executeonclick in foptions) and
       (info.mouseeventinfopo^.shiftstate*keyshiftstatesmask = []) and
       (info.mouseeventinfopo^.button = mb_left) and
                       enabled and not readonly then begin
     fclickedrow:= info.cell.row;
    end;
   end;
   cek_buttonrelease: begin
    if {not info.processed and} not focused and (fclickedrow >= 0) then begin
     togglegridvalue(fclickedrow);
     checkradiorow(fclickedrow);
    end;
    fclickedrow:= -1;
   end;
  end;
  if fclickedrow <> clickedrowbefore then begin
   fgridintf.getcol.grid.invalidatecell(info.cell);
  end;
 end;
end;

procedure ttogglegraphdataedit.statechanged;
begin
 if not enabled then begin
  fclickedrow:= -1;
 end;
 inherited;
end;

procedure ttogglegraphdataedit.setoptions(const avalue: buttonoptionsty);
begin
 foptions:= avalue;
end;

procedure ttogglegraphdataedit.checkradiorow(aindex: integer);
var
 datalist1: tdatalist;
 int1: integer;
begin
 if (fgridintf <> nil) and (bo_radioitemcol in foptions) then begin
  if aindex < 0 then begin
   aindex:= fgridintf.grid.row;
  end;
  datalist1:= fgridintf.getcol.datalist;
  int1:= datalist1.checkeditem;
  if gridvaluechecked(aindex) then begin
   if (int1 >= 0) and (int1 <> aindex) then begin
    resetgridvalue(int1);
   end;
   datalist1.checkeditem:= aindex;
  end
  else begin
   if (int1 >= 0) and (int1 = aindex) then begin
    datalist1.checkeditem:= -1;
   end;
  end;
 end;
end;

procedure ttogglegraphdataedit.modified;
begin
 checkradiorow(-1);
 inherited;
end;

function ttogglegraphdataedit.getcheckedrow: integer;
var
 datalist1: tdatalist;
begin
 result:= -1;
 if (fgridintf <> nil) and (bo_radioitemcol in foptions) then begin
  datalist1:= fgridintf.getcol.datalist;
  if datalist1 <> nil then begin
   result:= datalist1.checkeditem;
  end;
 end;  
end;

procedure ttogglegraphdataedit.setcheckedrow(const avalue: integer);
var
 datalist1: tdatalist;
begin
 if checkedrow <> avalue then begin
  if (fgridintf <> nil) and (bo_radioitemcol in foptions) then begin
   datalist1:= fgridintf.getcol.datalist;
   if datalist1 <> nil then begin
    if avalue < 0 then begin
     if datalist1.checkeditem >= 0 then begin
      resetgridvalue(datalist1.checkeditem);
      datalist1.checkeditem:= -1;
     end;
    end    
    else begin
     checkgridvalue(avalue);
     checkradiorow(avalue);
    end;
   end;
  end; 
 end;
end;

{ tcustombooleanedit }

procedure tcustombooleanedit.internalcheckvalue(var avalue; var accept: boolean);
var
 bo1: boolean;
begin
 if canevent(tmethod(fonsetvalue)) then begin
  bo1:= longbool(avalue);
  fonsetvalue(self,bo1,accept);
  longbool(avalue):= bo1;
 end;
{$ifdef mse_with_ifi}
 ifisetvalue(avalue,accept);
{$endif}
 if accept then begin
  value:= longbool(avalue);
 end;
end;

procedure tcustombooleanedit.togglevalue(const areadonly: boolean;
                                                     const down: boolean);
var
 bo1: longbool;
begin
 if not areadonly then begin
  bo1:= not fvalue;
  fedited:= true;
  docheckvalue(bo1);
 end;
end;

procedure tcustombooleanedit.togglegridvalue(const index: integer);
begin
 gridvalue[index]:= not gridvalue[index];
end;

constructor tcustombooleanedit.create(aowner: tcomponent);
begin
 fcheckcaption:= true;
 inherited;
 size:= makesize(defaultboxsize,defaultboxsize);
end;

function tcustombooleanedit.createdatalist(const sender: twidgetcol): tdatalist;
begin
 result:= tgridintegerdatalist.create(sender);
end;

function tcustombooleanedit.getdatatype: listdatatypety;
begin
 result:= dl_integer;
end;

function tcustombooleanedit.getglyph: stockglyphty;
begin
 result:= stg_checked;
end;

procedure tcustombooleanedit.paintglyph(const canvas: tcanvas; 
                               const acolorglyph: colorty; const avalue;
                               const arect: rectty);
var
 bo1: boolean;
begin
 if @avalue = nil then begin
  bo1:= fvalue;
 end
 else begin
  bo1:= boolean(avalue);
 end;
 if bo1 xor (bo_reversed in foptions) then begin
   stockobjects.paintglyph(canvas,getglyph,arect,not isenabled,acolorglyph);
 end;
end;

procedure tcustombooleanedit.setvalue(const Value: boolean);
begin
 fvalue := Value;
 valuechanged;
end;

procedure tcustombooleanedit.readstatvalue(const reader: tstatreader);
begin
 value:= reader.readboolean(valuevarname,value);
end;

procedure tcustombooleanedit.writestatvalue(const writer: tstatwriter);
begin
 writer.writeboolean(valuevarname,value);
end;

function tcustombooleanedit.getdefaultvalue: pointer;
begin
 result:= @fvaluedefault;
end;

class function tcustombooleanedit.classskininfo: skininfoty;
begin
 result:= inherited classskininfo;
 result.objectkind:= sok_booleanedit;
end;

procedure tcustombooleanedit.setnullvalue;
begin
 value:= false;
end;

procedure tcustombooleanedit.gridtovalue(arow: integer);
var
 int1: integer;
begin
 int1:= 0;
 if fvalue then begin
  int1:= 1;
 end;
 fgridintf.getdata(arow,int1);
 fvalue:= int1 <> 0;
 inherited;
end;

procedure tcustombooleanedit.valuetogrid(arow: integer);
var
 int1: integer;
begin
 int1:= integer(longbool(fvalue));
 fgridintf.setdata(arow,int1);
end;

procedure tcustombooleanedit.fillcol(const avalue: longbool);
begin
 checkgrid;
 with tdatalist1(fgridintf.getcol.datalist) do begin
  tdatalist1(fgridintf.getcol.datalist).internalfill(count,avalue);
 end;
 fgridintf.getcol.changed;
end;

function tcustombooleanedit.checkvalue: boolean;
begin
 result:= docheckvalue(fvalue);
end;

function tcustombooleanedit.getgridvalue(const index: integer): longbool;
begin
 internalgetgridvalue(index,result);
end;

procedure tcustombooleanedit.setgridvalue(const index: integer;
  const Value: longbool);
begin
 internalsetgridvalue(index,value);
end;

function tcustombooleanedit.getgridvalues: longboolarty;
begin
 result:= longboolarty(tintegerdatalist(fgridintf.getcol.datalist).asarray);
end;

procedure tcustombooleanedit.setgridvalues(const Value: longboolarty);
begin
 tintegerdatalist(fgridintf.getcol.datalist).asarray:= integerarty(value);
end;

function tcustombooleanedit.getgridbooleanvalues: booleanarty;
begin
 result:= tintegerdatalist(fgridintf.getcol.datalist).asbooleanarray;
end;

procedure tcustombooleanedit.setgridbooleanvalues(const Value: booleanarty);
begin
 tintegerdatalist(fgridintf.getcol.datalist).asbooleanarray:= value;
end;

function tcustombooleanedit.valuetag(const falsevalue: integer): integer;
begin
 if fvalue then begin
  result:= tag;
 end
 else begin
  result:= falsevalue;
 end;
end;

function tcustombooleanedit.gridvaluetag(const index: integer;
                       const falsevalue: integer): integer;
begin
 if getgridvalue(index) then begin
  result:= tag;
 end
 else begin
  result:= falsevalue;
 end;
end;

procedure tcustombooleanedit.updatetagvalue(const bitset: integer);
           //value -> true if bitset and tag <> 0
begin
 value:= bitset and tag <> 0;
end;

procedure tcustombooleanedit.gridupdatetagvalue(const index: integer; const bitset: integer);
begin
 setgridvalue(index,bitset and tag <> 0);
end;

function tcustombooleanedit.valuetagbit: longword;
                  //if value -> bits[tag] else -> 0
begin
 if fvalue then begin
  result:= bits[tag and $1f];
 end
 else begin
  result:= 0;
 end;
end;

function tcustombooleanedit.gridvaluetagbit(const index: integer): longword;
                  //if value -> bits[tag] else -> 0
begin
 if gridvalue[index] then begin
  result:= bits[tag and $1f];
 end
 else begin
  result:= 0;
 end;
end;

function tcustombooleanedit.getvaluebitmask: longword;
                  //ored valuetagbit of all edits in group
var
 ar1: booleaneditarty;
 int1: integer;
begin
 ar1:= groupmembers;
 result:= 0;
 for int1:= 0 to high(ar1) do begin
  result:= result or ar1[int1].valuetagbit;
 end;
end;

procedure tcustombooleanedit.setvaluebitmask(const avalue: longword);
var
 ar1: booleaneditarty;
 int1: integer;
begin
 ar1:= groupmembers;
 for int1:= 0 to high(ar1) do begin
  with ar1[int1] do begin
   value:= avalue and bits[tag and $1f] <> 0;
  end;
 end;
end;

function tcustombooleanedit.getgridvaluebitmask(const index: integer): longword;
                  //ored valuetagbit of all edits in group
var
 ar1: booleaneditarty;
 int1: integer;
begin
 ar1:= groupmembers;
 result:= 0;
 for int1:= 0 to high(ar1) do begin
  result:= result or ar1[int1].gridvaluetagbit(index);
 end;
end;

procedure tcustombooleanedit.setgridvaluebitmask(const index: integer; const avalue: longword);
var
 ar1: booleaneditarty;
 int1: integer;
begin
 ar1:= groupmembers;
 for int1:= 0 to high(ar1) do begin
  with ar1[int1] do begin
   gridvalue[index]:= avalue and bits[tag and $1f] <> 0;
  end;
 end;
end;

function tcustombooleanedit.getvalue: boolean;
begin
 result:= fvalue;
end;

function tcustombooleanedit.getvaluedefault: boolean;
begin
 result:= fvaluedefault;
end;

procedure tcustombooleanedit.setvaluedefault(const Value: boolean);
begin
 fvaluedefault:= value;
end;

function tcustombooleanedit.groupmembers: booleaneditarty;
var
 int1,int2: integer;
 widget1: twidget;
begin
 if fparentwidget = nil then begin
  setlength(result,1);
  result[0]:= self;
 end
 else begin
  setlength(result,fparentwidget.widgetcount); //max
  int2:= 0;
  for int1:= 0 to high(result) do begin
   widget1:= twidget1(fparentwidget).fwidgets[int1];
   if (widget1 is tcustombooleanedit) and 
      (tcustombooleanedit(widget1).fgroup = self.fgroup)  then begin
    result[int2]:= tcustombooleanedit(widget1);
    inc(int2);
   end;
  end;
  setlength(result,int2);
 end;
end;

function tcustombooleanedit.tagitem(const atag: integer): tcustombooleanedit; //nil if none
var
 int1: integer;
 widget1: twidget;
begin
 result:= nil;
 if fparentwidget <> nil then begin
  for int1:= 0 to fparentwidget.widgetcount - 1 do begin
   widget1:= twidget1(fparentwidget).fwidgets[int1];
   if (widget1 is tcustombooleanedit) and 
         (tcustombooleanedit(widget1).fgroup = self.fgroup) and
          (widget1.tag = atag) then begin
    result:= tbooleanedit(widget1);
    break;
   end;
  end;
 end;
end;

procedure tcustombooleanedit.dokeydown(var info: keyeventinfoty);
begin
 with info do begin
  if not (es_processed in eventstate) then begin
   if ((key = key_0) or (key = key_1) or (key = key_period)) and
         (shiftstate = []) and (bo_executeonkey in foptions) then begin
    include(eventstate,es_processed);
    if ((key = key_1) xor value) or (key = key_period) then begin
     togglevalue(oe_readonly in getoptionsedit,false);
    end;
   end;
   if not (es_processed in eventstate) then begin
    inherited;
   end;
  end;
 end;
end;

{$ifdef mse_with_ifi}
function tcustombooleanedit.getifilink: tifibooleanlinkcomp;
begin
 result:= tifibooleanlinkcomp(fifilink);
end;

procedure tcustombooleanedit.setifilink(const avalue: tifibooleanlinkcomp);
begin
 inherited setifilink(avalue);
end;

{$endif}

procedure tcustombooleanedit.resetgridvalue(const index: integer);
begin
 gridvalue[index]:= false;
end;

procedure tcustombooleanedit.checkgridvalue(const index: integer);
begin
 gridvalue[index]:= true;
end;

function tcustombooleanedit.gridvaluechecked(const aindex: integer): boolean;
begin
 result:= gridvalue[aindex];
end;

{ tcustombooleaneditradio }

function tcustombooleaneditradio.getglyph: stockglyphty;
begin
 result:= stg_checkedradio;
end;

procedure tcustombooleaneditradio.reset;
begin
 if value then begin
  inc(fresetting);
  try
   value:= false
  finally
   dec(fresetting);
  end;
 end;
end;

procedure tcustombooleaneditradio.setvalue(const avalue: boolean);
var
 widget: twidget;
 int1: integer;
begin
 if avalue and (fparentwidget <> nil) then begin
  for int1:= 0 to fparentwidget.widgetcount - 1 do begin
   widget:= fparentwidget.widgets[int1];
   if (widget is tcustombooleaneditradio) and (widget <> self) and
        (tcustombooleaneditradio(widget).fgroup = fgroup) then begin
    tcustombooleaneditradio(widget).reset;
   end;
  end;
 end;
 inherited;
end;

procedure tcustombooleaneditradio.setgridvalue(const aindex: integer;
                                                   const avalue: longbool);
var
 widget: twidget;
 int1: integer;
begin
 if avalue and (fparentwidget <> nil) then begin
  for int1:= 0 to fparentwidget.widgetcount - 1 do begin
   widget:= fparentwidget.widgets[int1];
   if (widget is tcustombooleaneditradio) and (widget <> self) and
        (tcustombooleaneditradio(widget).fgroup = fgroup) then begin
    tcustombooleaneditradio(widget).gridvalue[aindex]:= false;
   end;
  end;
 end;
 inherited;
end;

function tcustombooleaneditradio.internalcheckeditem(
               out single: boolean): tcustombooleaneditradio; //nil if none
var
 widget: twidget;
 int1,int2: integer;
begin
 result:= nil;
 int2:= 0;
 if fparentwidget <> nil then begin
  for int1:= 0 to fparentwidget.widgetcount - 1 do begin
   widget:= fparentwidget.widgets[int1];
   if (widget is tcustombooleaneditradio) and
        (tcustombooleaneditradio(widget).fgroup = fgroup) and
         tcustombooleaneditradio(widget).value then begin
    inc(int2);
    if result <> nil then begin
     break;
    end;
    result:= tcustombooleaneditradio(widget);
   end;
  end;
 end
 else begin
  if fvalue then begin
   result:= self;
  end;
 end;
 single:= int2 <= 1;
end;

function tcustombooleaneditradio.checkeditem: tcustombooleaneditradio; 
                            //nil if none
var
 bo1: boolean;
begin
 result:= internalcheckeditem(bo1);
end;

procedure tcustombooleaneditradio.togglevalue(const areadonly: boolean;
                                         const down: boolean);
var
 bo1: boolean;
 bo2: longbool;
begin
 if not areadonly then begin
  internalcheckeditem(bo1);
  if (bo_cantoggle in foptions) or not fvalue or not bo1 then begin
   bo2:= not fvalue;
   docheckvalue(bo2);
  end;
 end;
end;

procedure tcustombooleaneditradio.togglegridvalue(const index: integer);
begin
 if not getgridvalue(index) then begin
  setgridvalue(index,true);
 end;
end;

function tcustombooleaneditradio.getcheckedtag: integer;
var
 item: tcustombooleaneditradio;
begin
 item:= checkeditem;
 if item <> nil then begin
  result:= item.Tag;
 end
 else begin
  result:= -1;
 end;
end;

procedure tcustombooleaneditradio.setcheckedtag(const avalue: integer);
var
 widget: twidget;
 item: tcustombooleaneditradio;
 int1: integer;
begin
 if fparentwidget <> nil then begin
  for int1:= 0 to fparentwidget.widgetcount - 1 do begin
   widget:= fparentwidget.widgets[int1];
   if (widget is tcustombooleaneditradio) and
        (tcustombooleaneditradio(widget).fgroup = fgroup) and
         (widget.tag = avalue) then begin
    tcustombooleaneditradio(widget).value:= true;
    exit;
   end;
  end;
  item:= checkeditem;
  if item <> nil then begin
   item.value:= false;
  end;
 end;
end;

{ tcustomintegergraphdataedit }

procedure tcustomintegergraphdataedit.internalcheckvalue(var avalue;
  var accept: boolean);
begin
 if canevent(tmethod(fonsetvalue)) then begin
  fonsetvalue(self,integer(avalue),accept);
 end;
{$ifdef mse_with_ifi}
 ifisetvalue(avalue,accept);
{$endif} 
 if accept then begin
  value:= integer(avalue);
 end;
end;

procedure tcustomintegergraphdataedit.setvalue(const Value: integer);
begin
 fvalue := Value;
 valuechanged;
end;

procedure tcustomintegergraphdataedit.readstatvalue(const reader: tstatreader);
begin
 value:= reader.readinteger(valuevarname,value);
end;

procedure tcustomintegergraphdataedit.writestatvalue(const writer: tstatwriter);
begin
 writer.writeinteger(valuevarname,value);
end;

function tcustomintegergraphdataedit.getdefaultvalue: pointer;
begin
 result:= @fvaluedefault;
end;

procedure tcustomintegergraphdataedit.gridtovalue(arow: integer);
begin
 fgridintf.getdata(arow,fvalue);
 inherited;
end;

procedure tcustomintegergraphdataedit.valuetogrid(arow: integer);
begin
 fgridintf.setdata(arow,fvalue);
end;

function tcustomintegergraphdataedit.checkvalue: boolean;
begin
 result:= docheckvalue(fvalue);
end;

procedure tcustomintegergraphdataedit.doinc(var avalue: integer;
                                                const down: boolean);
begin
 if down then begin
  dec(avalue);
  if avalue < fmin then begin
   avalue:= fmax;
  end;
 end
 else begin
  inc(avalue);
  if avalue > fmax then begin
   avalue:= fmin;
  end;
 end;
end;

procedure tcustomintegergraphdataedit.togglevalue(const areadonly: boolean;
                                                          const down: boolean);
var
 int1: integer;
begin
 if not areadonly then begin
  int1:= fvalue;
  doinc(int1,down);
  docheckvalue(int1);
 end;
end;

procedure tcustomintegergraphdataedit.togglegridvalue(const index: integer);
var
 int1: integer;
begin
 int1:= gridvalue[index];
 doinc(int1,false);
 gridvalue[index]:= int1;
end;

procedure tcustomintegergraphdataedit.fillcol(const avalue: integer);
begin
 checkgrid;
 fdatalist.fill(fdatalist.count,avalue);
end;

function tcustomintegergraphdataedit.createdatalist(
  const sender: twidgetcol): tdatalist;
begin
 fdatalist:= tgridintegerdatalist.create(sender);
 result:= fdatalist;
end;

function tcustomintegergraphdataedit.getdatatype: listdatatypety;
begin
 result:= dl_integer;
end;

function tcustomintegergraphdataedit.getgridvalue(const index: integer): integer;
begin
 internalgetgridvalue(index,result);
end;

procedure tcustomintegergraphdataedit.setgridvalue(const index, Value: integer);
begin
 internalsetgridvalue(index,value);
end;

function tcustomintegergraphdataedit.getgridvalues: integerarty;
begin
 checkgrid;
 result:= fdatalist.asarray;
end;

procedure tcustomintegergraphdataedit.setgridvalues(const Value: integerarty);
begin
 checkgrid;
 fdatalist.asarray:= value;
end;

procedure tcustomintegergraphdataedit.setgridintf(const intf: iwidgetgrid);
begin
 if intf <> nil then begin
  fdatalist:= tintegerdatalist(intf.getcol.datalist);
 end
 else begin
  fdatalist:= nil;
 end;
 inherited;
end;

procedure tcustomintegergraphdataedit.resetgridvalue(const index: integer);
begin
 gridvalue[index]:= valuedefault;
end;

procedure tcustomintegergraphdataedit.checkgridvalue(const index: integer);
var
 int1: integer;
begin
 int1:= fvaluedefault + 1;
 if int1 > fmax then begin
  int1:= int1 -2;
  if int1 < fmin then begin
   int1:= fmin;
  end;
 end;
 gridvalue[index]:= int1;
end;

function tcustomintegergraphdataedit.gridvaluechecked(
                                      const aindex: integer): boolean;
begin
 result:= gridvalue[aindex] <> valuedefault;
end;

procedure tcustomintegergraphdataedit.datalistdestroyed;
begin
 fdatalist:= nil;
end;
{$ifdef mse_with_ifi}
function tcustomintegergraphdataedit.getifilink: tifiintegerlinkcomp;
begin
 result:= tifiintegerlinkcomp(fifilink);
end;

procedure tcustomintegergraphdataedit.setifilink(const avalue: tifiintegerlinkcomp);
begin
 inherited setifilink(avalue);
end;
{$endif}

{ tvaluefacearrayprop }

constructor tvaluefacearrayprop.create(const aowner: tcustomdatabutton);
begin
 fowner:= aowner;
 inherited create(nil);
end;

class function tvaluefacearrayprop.getitemclasstype: persistentclassty;
begin
 result:= tface;
end;

procedure tvaluefacearrayprop.createitem(const index: integer;
                                        var item: tpersistent);
begin
 item:= tface.create(iface(fowner));
end;

function tvaluefacearrayprop.getitems(const index: integer): tface;
begin
 result:= tface(inherited getitems(index));
end;

{ tcustomdatabutton }

constructor tcustomdatabutton.create(aowner: tcomponent);
begin
 foptions:= defaultbuttonoptions;
 initactioninfo(factioninfo);
 inherited;
 fimagenums:= tintegerarrayprop.create;
 fimagenr:= -1;
 fimagenrdisabled:= -2;
 fvalue:= -1;
 fvaluedefault:= -1;
 fmin:= -1;
 fmax:= 0;
 fvaluefaces:= tvaluefacearrayprop.create(self);
 fvaluecaptions:= tmsestringarrayprop.create;
 optionswidget:= defaultoptionswidget - [ow_mousefocus];
 initshapeinfo(finfo);
 finfo.ca.imagepos:= ip_center;
 finfo.ca.dim:= innerclientrect;
 finfo.color:= cl_transparent;
 finfo.ca.colorglyph:= cl_black;
 finfo.state:= finfo.state + [shs_showfocusrect,shs_showdefaultrect];
 include(fwidgetstate1,ws1_nodesignframe);
 size:= makesize(defaultbuttonwidth,defaultbuttonheight);
end;

destructor tcustomdatabutton.destroy;
begin
 if bo_updateonidle in foptions then begin
  application.unregisteronidle({$ifdef FPC}@{$endif}doidle); 
 end;
 fvaluefaces.free;
 fvaluecaptions.free;
 fimagenums.free;
 inherited;
end;

class function tcustomdatabutton.classskininfo: skininfoty;
begin
 result:= inherited classskininfo;
 result.objectkind:= sok_databutton;
end;

function tcustomdatabutton.verticalfontheightdelta: boolean;
begin
 result:= tf_rotate90 in textflags;
end;

procedure tcustomdatabutton.synctofontheight;
begin
 inherited;
 if tf_rotate90 in textflags then begin
  bounds_cx:= font.glyphheight + innerclientframewidth.cx + 6;
 end
 else begin
  bounds_cy:= font.glyphheight + innerclientframewidth.cy + 6;
 end;
end;

procedure tcustomdatabutton.initnewcomponent(const ascale: real);
begin
 //dummy
end;

procedure tcustomdatabutton.clientrectchanged;
begin
 inherited;
 frameskinoptionstoshapestate(fframe,finfo);
 if shs_flat in finfo.state then begin
  exclude(fwidgetstate1,ws1_nodesignframe);
 end
 else begin
  include(fwidgetstate1,ws1_nodesignframe);
 end;
 if shs_noinnerrect in finfo.state then begin
  finfo.ca.dim:= clientrect;
 end
 else begin
  finfo.ca.dim:= innerclientrect;
 end;
end;

function tcustomdatabutton.getframestateflags: framestateflagsty;
begin
 with finfo do begin
  result:= combineframestateflags(not isenabled,
              not (bo_nodefaultframeactive in foptions) and 
                           (shs_default in finfo.state) or active,
              shs_mouse in state,shs_clicked in state);
 end;
end;
{
function tcustomdatabutton.getframeclicked: boolean;
begin
 result:= ss_clicked in finfo.state;
end;

function tcustomdatabutton.getframemouse: boolean;
begin
 result:= ss_mouse in finfo.state;
end;

function tcustomdatabutton.getframeactive: boolean;
begin
 result:= not (bo_nodefaultframeactive in foptions) and 
                           (ss_default in finfo.state) or active;
end;
}
procedure tcustomdatabutton.doexecute;
begin
 if (options * [bo_nocandefocus,bo_candefocuswindow] <> [bo_candefocuswindow]) or
      rootwidget.canparentclose then begin
  doactionexecute(self,factioninfo,false,
             (options * [bo_nocandefocus,bo_candefocuswindow] <> []));
 end;
// doactionexecute(self,factioninfo);
end;

procedure tcustomdatabutton.mouseevent(var info: mouseeventinfoty);
begin
 inherited;
 if not (csdesigning in componentstate) {and 
        not (es_processed in info.eventstate)} then begin
  subpoint1(info.pos,paintpos);
  try
   updatemouseshapestate(finfo,info,self,fframe,nil,
                              bo_executeonclick in foptions);
  finally
   addpoint1(info.pos,paintpos);
  end;
 end;
end;

procedure tcustomdatabutton.dokeydown(var info: keyeventinfoty);
begin
 inherited;
 if (info.shiftstate = []) and (bo_executeonkey in foptions) then begin
  if (info.key = key_space) then begin
   include(finfo.state,shs_clicked);
   invalidaterect(finfo.ca.dim);
  end
  else begin
   if isenterkey(self,info.key) then begin
    include(info.eventstate,es_processed);
    togglevalue(oe_readonly in getoptionsedit,false);
   end;
  end;
 end;
end;

procedure tcustomdatabutton.dokeyup(var info: keyeventinfoty);
begin
 if (info.key = key_space) and (shs_clicked in finfo.state) then begin
  exclude(finfo.state,shs_clicked);
  invalidaterect(finfo.ca.dim);
 end;
 inherited;
end;

procedure tcustomdatabutton.doshortcut(var info: keyeventinfoty; const sender: twidget);
var
 bo1,bo2: boolean;
begin
 if not (es_processed in info.eventstate) and 
               not (csdesigning in componentstate) and 
                            not (shs_disabled in finfo.state) then begin
  if checkfocusshortcut(info) then begin
   setfocus;
  end;
  bo1:= checkactionshortcut(factioninfo,info);
  if not bo1 then begin
   if not (es_preview in info.eventstate) then begin
    bo2:= es_processed in info.eventstate;
    exclude(info.eventstate,es_processed);
    bo1:= (bo_executeonshortcut in options) and 
     msegui.checkshortcut(info,factioninfo.caption1,bo_altshortcut in options) or
    (finfo.state * [shs_invisible,shs_disabled,shs_default] = [shs_default]) and
       (info.key = key_return) and
       ((info.shiftstate = []) or 
        (bo_executedefaultonenterkey in options) and 
        (info.shiftstate = [ss_second]));
    if bo1 then begin
     bo2:= true;
     togglevalue(oe_readonly in getoptionsedit,false);
 //    internalexecute;
    end;
    if bo2 then begin
     include(info.eventstate,es_processed);
    end;
   end;
  end
  else begin
   togglevalue(oe_readonly in getoptionsedit,false);
  end;
  if not (es_processed in info.eventstate) then begin
   inherited;
  end;
 end;
end;

procedure tcustomdatabutton.statechanged;
begin
 inherited;
 updatewidgetshapestate(finfo,self);
end;

procedure tcustomdatabutton.setcolorglyph(const avalue: colorty);
begin
 setactioncolorglyph(iactionlink(self),avalue);
end;

function tcustomdatabutton.iscolorglyphstored: boolean;
begin
 result:= isactioncolorglyphstored(factioninfo);
end;

procedure tcustomdatabutton.setactualimagenr(const avalue: integer);
begin
 with finfo,ca do begin 
  if (avalue >= 0) and (avalue < fimagenums.count) then begin
   imagenr:= fimagenums[avalue];
  end
  else begin
   imagenr:= fimagenr;
  end;
  if shs_disabled in finfo.state then begin
   if fimagenrdisabled = -3 then begin
    if imagenr >= 0 then begin
     imagenrdisabled:= imagenr + fimageoffsetdisabled;
    end;
   end
   else begin
    imagenrdisabled:= fimagenrdisabled;
   end;
  end
  else begin
   if shs_clicked in state then begin
    inc(imagenr,fimageoffsetclicked);
   end
   else begin
    if shs_mouse in state then begin
     inc(imagenr,fimageoffsetmouse);
    end
   end;
   if imagenr >= 0 then begin
    inc(imagenr,fimageoffset);
   end;
  end;
 end;
end;

procedure tcustomdatabutton.paintglyph(const canvas: tcanvas;
                const acolorglyph: colorty; const avalue;
                const arect: rectty);
               
 function actualcaption(const aindex: integer): richstringty;
 begin
  if (aindex >= 0) and (aindex < fvaluecaptions.count) then begin
   result.text:= fvaluecaptions[aindex];
   result.format:= nil;
  end
  else begin
   result:= factioninfo.caption1;
  end;
 end;
 
 function actualface(const aindex: integer): tface;
 begin
  if (aindex >= 0) and (aindex < fvaluefaces.count) then begin
   result:= fvaluefaces[aindex];
  end
  else begin
   result:= nil;
  end;
 end;
 
var
 statebefore: shapestatesty;
 dimbefore: rectty;
begin
 finfo.ca.colorglyph:= acolorglyph;
 finfo.imagenrdisabled:= fimagenrdisabled;
 if (@avalue <> nil) then begin
  finfo.ca.caption:= actualcaption(integer(avalue));
  finfo.face:= actualface(integer(avalue));
  statebefore:= finfo.state;
  dimbefore:= finfo.ca.dim;
  finfo.ca.dim:= arect;
  finfo.state:= finfo.state - [shs_focused,shs_clicked,shs_mouse];
  with pcellinfoty(canvas.drawinfopo)^ do begin
   if ismousecell and (bo_executeonclick in foptions) and 
                                   enabled and not readonly then begin
    include(finfo.state,shs_mouse);
   end;
   if cell.row = fclickedrow then begin
    include(finfo.state,shs_clicked);
   end;
  end;
  setactualimagenr(integer(avalue));
  drawbutton(canvas,finfo);
  finfo.state:= statebefore;
  finfo.ca.dim:= dimbefore;
 end
 else begin
  finfo.ca.caption:= actualcaption(fvalue);
  finfo.face:= actualface(fvalue);
  setactualimagenr(fvalue);
  drawbutton(canvas,finfo);
 end;
end;

procedure tcustomdatabutton.internalcreateframe;
begin
 tcaptionframe.create(iscrollframe(self));
end;

procedure tcustomdatabutton.initgridwidget;
begin
 inherited;
 if fgridintf <> nil then begin
  with fgridintf.getcol do begin
   if self.color = cl_default then begin
    color:= cl_parent;
   end
   else begin
    color:= self.color;
   end;
   options:= options - [co_drawfocus];
  end;
 end;
end;

procedure tcustomdatabutton.setvaluefaces(const avalue: tvaluefacearrayprop);
begin
 fvaluefaces.assign(avalue);
end;

procedure tcustomdatabutton.setvaluecaptions(const avalue: tmsestringarrayprop);
begin
 fvaluecaptions.assign(avalue);
end;

procedure tcustomdatabutton.setcaption(const avalue: captionty);
begin
 setactioncaption(iactionlink(self),avalue);
// formatchanged;
end;

procedure tcustomdatabutton.settextflags(const avalue: textflagsty);
begin
 if finfo.ca.textflags <> avalue then begin
  finfo.ca.textflags:= checktextflags(finfo.ca.textflags,avalue);
  invalidate;
  checkautosize;
 end;
end;

function tcustomdatabutton.iscaptionstored: boolean;
begin
 result:= isactioncaptionstored(factioninfo);
end;

procedure tcustomdatabutton.setcaptiondist(const avalue: integer);
begin
 if avalue <> finfo.ca.captiondist then begin
  finfo.ca.captiondist:= avalue;
  formatchanged;
  checkautosize;
 end;
end;

procedure tcustomdatabutton.setimagepos(const avalue: imageposty);
begin
 if avalue <> finfo.ca.imagepos then begin
  finfo.ca.imagepos:= avalue;
  formatchanged;
  checkautosize;
 end;
end;

function tcustomdatabutton.getimagelist: timagelist;
begin
 result:= timagelist(factioninfo.imagelist);
end;

procedure tcustomdatabutton.setimagelist(const avalue: timagelist);
begin
 setactionimagelist(iactionlink(self),avalue);
end;

function tcustomdatabutton.isimageliststored: Boolean;
begin
 result:= isactionimageliststored(factioninfo);
end;

procedure tcustomdatabutton.setimagenr(const avalue: imagenrty);
begin
 fimagenr:= avalue;
 setactionimagenr(iactionlink(self),avalue);
end;

function tcustomdatabutton.isimagenrstored: Boolean;
begin
 result:= isactionimagenrstored(factioninfo);
end;

procedure tcustomdatabutton.setimagenrdisabled(const avalue: imagenrty);
begin
 fimagenrdisabled:= avalue;
 setactionimagenrdisabled(iactionlink(self),avalue);
end;

function tcustomdatabutton.isimagenrdisabledstored: Boolean;
begin
 result:= isactionimagenrdisabledstored(factioninfo);
end;

procedure tcustomdatabutton.setnullvalue;
begin
 value:= -1;
end;

procedure tcustomdatabutton.setgridintf(const intf: iwidgetgrid);
begin
 inherited;
 exclude(finfo.state,shs_showdefaultrect);
end;

function tcustomdatabutton.checkfocusshortcut(var info: keyeventinfoty): boolean;
begin
 result:= inherited checkfocusshortcut(info) or 
         msegui.checkshortcut(info,finfo.ca.caption,true);
end;

procedure tcustomdatabutton.togglevalue(const areadonly: boolean;
                                                     const down: boolean);
begin
 inherited;
 internalexecute;
end;

procedure tcustomdatabutton.setimageoffset(const avalue: integer);
begin
 if fimageoffset <> avalue then begin
  fimageoffset := aValue;
  formatchanged;
 end;
end;

procedure tcustomdatabutton.setimageoffsetdisabled(const avalue: integer);
begin
 if fimageoffsetdisabled <> avalue then begin
  fimageoffsetdisabled := avalue;
  formatchanged;
 end;
end;

procedure tcustomdatabutton.setimageoffsetmouse(const avalue: integer);
begin
 if fimageoffsetmouse <> avalue then begin
  fimageoffsetmouse := avalue;
  formatchanged;
 end;
end;

procedure tcustomdatabutton.setimageoffsetclicked(const avalue: integer);
begin
 if fimageoffsetclicked <> avalue then begin
  fimageoffsetclicked := avalue;
  formatchanged;
 end;
end;

procedure tcustomdatabutton.setshortcut(const avalue: shortcutty);
begin
 setactionshortcut(iactionlink(self),avalue);
end;

function tcustomdatabutton.isshortcutstored: boolean;
begin
 result:= isactionshortcutstored(factioninfo);
end;

function tcustomdatabutton.getshortcut: shortcutty;
begin
 result:= getsimpleshortcut(factioninfo);
end;

function tcustomdatabutton.getshortcut1: shortcutty;
begin
 result:= getsimpleshortcut1(factioninfo);
end;

procedure tcustomdatabutton.setshortcut1(const avalue: shortcutty);
begin
 setactionshortcut1(iactionlink(self),avalue);
end;

function tcustomdatabutton.isshortcut1stored: boolean;
begin
 result:= isactionshortcut1stored(factioninfo);
end;

procedure tcustomdatabutton.setonexecute(const avalue: notifyeventty);
begin
 setactiononexecute(iactionlink(self),avalue,csloading in componentstate);
end;

function tcustomdatabutton.isonexecutestored: boolean;
begin
 result:= isactiononexecutestored(factioninfo);
end;

procedure tcustomdatabutton.setonbeforeexecute(const avalue: accepteventty);
begin
 setactiononbeforeexecute(iactionlink(self),avalue,csloading in componentstate);
end;

function tcustomdatabutton.isonbeforeexecutestored: boolean;
begin
 result:= isactiononbeforeexecutestored(factioninfo);
end;

procedure tcustomdatabutton.setimagedist(const avalue: integer);
begin
 if avalue <> finfo.ca.imagedist then begin
  finfo.ca.imagedist:= avalue;
  formatchanged;
  checkautosize;
 end;
end;

procedure tcustomdatabutton.setimagenums(const avalue: tintegerarrayprop);
begin
 fimagenums.assign(avalue);
end;

procedure tcustomdatabutton.setoptions(const avalue: buttonoptionsty);
var
 delta: buttonoptionsty;
begin
 if avalue <> foptions then begin
  delta:= buttonoptionsty(
        {$ifdef FPC}longword{$else}longword{$endif}(foptions) xor
        {$ifdef FPC}longword{$else}longword{$endif}(avalue));
  if bo_updateonidle in delta then begin
   if (bo_updateonidle in avalue) and 
                               not (csdesigning in componentstate) then begin
    application.registeronidle({$ifdef FPC}@{$endif}doidle); 
   end
   else begin
    application.unregisteronidle({$ifdef FPC}@{$endif}doidle); 
   end;
  end;
  foptions:= avalue;
  buttonoptionstoshapestate(foptions,finfo.state);
  invalidate;
  if bo_shortcutcaption in avalue then begin
   setactionoptions(iactionlink(self),factioninfo.options + [mao_shortcutcaption]);
  end
  else begin
   setactionoptions(iactionlink(self),factioninfo.options - [mao_shortcutcaption]);
  end;
 end;
end;
{
begin
 if foptions <> avalue then begin
  foptions:= avalue - [bo_shortcutcaption];
  buttonoptionstoshapestate(foptions,finfo.state);
  invalidate;
 end;
end;
}
function tcustomdatabutton.getactioninfopo: pactioninfoty;
begin
 result:= @factioninfo;
end;

function tcustomdatabutton.shortcutseparator: msechar;
begin
 result:= ' ';
end;

procedure tcustomdatabutton.calccaptiontext(var ainfo: actioninfoty);
begin
 mseactions.calccaptiontext(ainfo,shortcutseparator);
end;

procedure tcustomdatabutton.actionchanged;
begin
 finfo.color:= fcolor;
 actioninfotoshapeinfo(self,factioninfo,finfo);
 inherited setcolor(finfo.color); 
 finfo.color:= cl_transparent;
// if csdesigning in componentstate then begin
  exclude(finfo.state,shs_invisible);
// end;
 formatchanged;
 checkautosize;
end;

procedure tcustomdatabutton.setaction(const avalue: tcustomaction);
begin
 linktoaction(iactionlink(self),avalue,factioninfo);
end;

procedure tcustomdatabutton.setstate(const avalue: actionstatesty);
begin
 setactionstate(iactionlink(self),avalue);
 visible:= not (as_invisible in factioninfo.state);
 enabled:= not (as_disabled in factioninfo.state);
end;

procedure tcustomdatabutton.setenabled(const avalue: boolean);
begin
 if avalue then begin
  setactionstate(iactionlink(self),state - [as_disabled]);
 end
 else begin
  setactionstate(iactionlink(self),state + [as_disabled]);
 end;
 inherited;
end;

procedure tcustomdatabutton.setvisible(const avalue: boolean);
begin
 if avalue then begin
  setactionstate(iactionlink(self),state - [as_invisible]);
 end
 else begin
  setactionstate(iactionlink(self),state + [as_invisible]);
 end;
 inherited;
end;

function tcustomdatabutton.isstatestored: boolean;
begin
 result:= isactionstatestored(factioninfo);
end;

procedure tcustomdatabutton.readcaptionpos(reader: treader);
begin
 imagepos:= readcaptiontoimagepos(reader);
end;

procedure tcustomdatabutton.readshortcut(reader: treader);
begin
 shortcut:= translateshortcut(reader.readinteger);
end;

procedure tcustomdatabutton.readshortcut1(reader: treader);
begin
 shortcut1:= translateshortcut(reader.readinteger);
end;

procedure tcustomdatabutton.readsc(reader: treader);
begin
 shortcuts:= readshortcutarty(reader);
end;

procedure tcustomdatabutton.writesc(writer: twriter);
begin
 writeshortcutarty(writer,factioninfo.shortcut);
end;

procedure tcustomdatabutton.readsc1(reader: treader);
begin
 shortcuts1:= readshortcutarty(reader);
end;

procedure tcustomdatabutton.writesc1(writer: twriter);
begin
 writeshortcutarty(writer,factioninfo.shortcut1);
end;

procedure tcustomdatabutton.defineproperties(filer: tfiler);
begin
 inherited;
 filer.defineproperty('captionpos',{$ifdef FPC}@{$endif}readcaptionpos,nil,false);
 filer.defineproperty('shortcut',{$ifdef FPC}@{$endif}readshortcut,nil,false);
 filer.defineproperty('shortcut1',{$ifdef FPC}@{$endif}readshortcut1,nil,false);
 filer.defineproperty('sc',{$ifdef FPC}@{$endif}readsc,
                           {$ifdef FPC}@{$endif}writesc,
       isactionshortcutstored(factioninfo) and
       ((filer.ancestor = nil) and (factioninfo.shortcut <> nil) or
       ((filer.ancestor <> nil) and 
         not issameshortcut(factioninfo.shortcut,
                  tcustombutton(filer.ancestor).shortcuts))));
 filer.defineproperty('sc1',{$ifdef FPC}@{$endif}readsc1,
                           {$ifdef FPC}@{$endif}writesc1,
       isactionshortcut1stored(factioninfo) and
       ((filer.ancestor = nil) and (factioninfo.shortcut1 <> nil) or
       ((filer.ancestor <> nil) and 
         not issameshortcut(factioninfo.shortcut,
                  tcustombutton(filer.ancestor).shortcuts))));
end;

procedure tcustomdatabutton.loaded;
begin
 inherited;
 actionendload(iactionlink(self));
end;

procedure tcustomdatabutton.docellevent(const ownedcol: boolean;
               var info: celleventinfoty);
begin
 inherited;
 if ownedcol and (info.eventkind in [cek_mouseenter,cek_mouseleave]) then begin
  fgridintf.getcol.grid.invalidatecell(info.cell);
 end;
end;

procedure tcustomdatabutton.setshortcuts(const avalue: shortcutarty);
begin
 setactionshortcuts(iactionlink(self),avalue);
end;

procedure tcustomdatabutton.setshortcuts1(const avalue: shortcutarty);
begin
 setactionshortcuts1(iactionlink(self),avalue);
end;

procedure tcustomdatabutton.internalexecute;
begin
 if bo_asyncexecute in foptions then begin
  asyncevent;
 end
 else begin
  doexecute;
 end;
end;

procedure tcustomdatabutton.doasyncevent(var atag: integer);
begin
 if atag = 0 then begin
  doexecute;
 end;
end;

procedure tcustomdatabutton.setcolor(const avalue: colorty);
begin
 if csloading in componentstate then begin
  inherited;      //no actionchanged
 end;
 setactioncolor(iactionlink(self),avalue);
end;

procedure tcustomdatabutton.doupdate;
begin
 if factioninfo.action <> nil then begin
  factioninfo.action.doupdate;
 end;
 if canevent(tmethod(fonupdate)) then begin
  fonupdate(self);
 end;
end;

procedure tcustomdatabutton.doidle(var again: boolean);
begin
 doupdate;
end;

procedure tcustomdatabutton.domousewheelevent(var info: mousewheeleventinfoty);
begin
 if not (es_transientfor in info.eventstate) then begin
  inherited togglevalue(oe_readonly in getoptionsedit,info.wheel = mw_down);
 end
 else begin
  inherited;
 end;
end;

{ tstockglyphdatabutton }

constructor tstockglyphdatabutton.create(aowner: tcomponent);
begin
 inherited;
 imagelist:= stockobjects.glyphs;
 glyph:= stg_none;
end;

procedure tstockglyphdatabutton.setglyph(const avalue: stockglyphty);
begin
 fglyph:= avalue;
 imagenr:= ord(avalue);
end;

{ tcustomdataicon }

constructor tcustomdataicon.create(aowner: tcomponent);
begin
 inherited;
 fvaluedefault:= -1;
 fvalue:= fvaluedefault;
 fimagenums:= tintegerarrayprop.create;
 fimagenums.onchange:= {$ifdef FPC}@{$endif}imagenumschanged;
end;

destructor tcustomdataicon.destroy;
begin
 fimagenums.free;
 inherited;
end;

procedure tcustomdataicon.setnullvalue;
begin
 value:= -1;
end;

procedure tcustomdataicon.objectevent(const sender: tobject;
  const event: objecteventty);
begin
 inherited;
 if (sender = fimagelist) and (event = oe_changed) then begin
  formatchanged;
 end;
end;

procedure tcustomdataicon.paintglyph(const canvas: tcanvas;
                       const acolorglyph: colorty; const avalue;
                       const arect: rectty);
var
 int1,int2: integer;
 po1: pintegeraty;
begin
 if (fimagelist <> nil) then begin
  if @avalue = nil then begin
   int1:= fvalue
  end
  else begin
   int1:= integer(avalue);
  end;
  if (int1 >= 0) then begin
   int1:= int1 + fimageoffset;
   if (int1 < fimagelist.count) and (int1 >= 0) then begin
    fimagelist.paint(canvas,int1,arect,[al_ycentered,al_xcentered]);
   end;
  end
  else begin
   if (int1 <> -1) and (longword(int1) <> $80000000) then begin
   {$warnings off}
    po1:= pintegeraty(tarrayprop1(fimagenums).getdatapo^);
   {$warnings on}
    for int2:= 0 to fimagenums.count-1 do begin
     if int1 and bits[int2] <> 0 then begin
      fimagelist.paint(canvas,po1^[int2],arect,[al_ycentered,al_xcentered]);
     end;
    end;
   end;
  end;
 end;
end;

procedure tcustomdataicon.setimagelist(const aValue: timagelist);
begin
 setlinkedvar(avalue,tmsecomponent(fimagelist));
 formatchanged;
end;

procedure tcustomdataicon.setimageoffset(const aValue: integer);
begin
 if fimageoffset <> avalue then begin
  fimageoffset := aValue;
  formatchanged;
 end;
end;

procedure tcustomdataicon.setimagenums(const avalue: tintegerarrayprop);
begin
 fimagenums.assign(avalue);
end;

procedure tcustomdataicon.imagenumschanged(const sender: tarrayprop; const index: integer);
begin
 formatchanged;
end;


{ tpointeredit }

function tpointeredit.createdatalist(const sender: twidgetcol): tdatalist;
begin
 result:= tgridpointerdatalist.create(sender);
end;

function tpointeredit.getdatatype: listdatatypety;
begin
 result:= dl_none;
end;

procedure tpointeredit.setvalue(const avalue: pointer);
begin
 fvalue:= avalue;
 valuechanged;
end;

function tpointeredit.getgridvalue(const index: integer): pointer;
begin
 internalgetgridvalue(index,result);
end;

procedure tpointeredit.setgridvalue(const index: integer; const avalue: pointer);
begin
 internalsetgridvalue(index,avalue);
end;

function tpointeredit.getgridvalues: pointerarty;
begin
 result:= tpointerdatalist(fgridintf.getcol.datalist).asarray;
end;

procedure tpointeredit.setgridvalues(const avalue: pointerarty);
begin
 tpointerdatalist(fgridintf.getcol.datalist).asarray:= avalue;
end;
{
procedure tpointeredit.dopaint(const canvas: tcanvas);
begin
 //dummy
end;
}
procedure tpointeredit.initnewcomponent(const ascale: real);
begin
 //do nothing
end;

procedure tpointeredit.paintglyph(const canvas: tcanvas; 
               const acolorglyph: colorty; const avalue;
               const arect: rectty);
var
 po1: pointer;
 int1: integer;
begin
 if canevent(tmethod(fonpaintglyph)) then begin
  if @avalue = nil then begin
   po1:= fvalue;
   int1:= gridrow;
  end
  else begin
   po1:= pointer(avalue);
   int1:= pcellinfoty(canvas.drawinfopo)^.cell.row;
  end;
  fonpaintglyph(self,canvas,po1,int1);
 end;
end;

procedure tpointeredit.gridtovalue(arow: integer);
begin
 fgridintf.getdata(arow,fvalue);
 inherited;
end;

procedure tpointeredit.valuetogrid(arow: integer);
begin
 fgridintf.setdata(arow,fvalue);
end;

{ tbarface }

constructor tbarface.create(const intf: iface);
begin
 inherited;
 with fade_color do begin
  count:= 1;
  items[0]:= defaultbarcolor;
 end;
end;

{ tbarframe }

constructor tbarframe.create(const aowner: tcustomprogressbar);
begin
 fowner:= aowner;
 fstate:= [fs_nowidget,fs_nosetinstance];
 inherited create(iscrollframe(aowner));
end;

{ tcustomprogressbar }

constructor tcustomprogressbar.create(aowner: tcomponent);
begin
 fbar_face:= tbarface.create(iface(self));
 fbar_frame:= tbarframe.create(self);
 fformat:= '0%';
 fvaluerange:= 100;
 ftextflags:= [tf_ycentered,tf_xcentered];
 inherited;
 optionswidget:= defaultoptionswidgetnofocus;
end;

destructor tcustomprogressbar.destroy;
begin
 inherited;
 fbar_face.free;
 fbar_frame.free;
end;

procedure tcustomprogressbar.setvalue(const avalue: realty);
begin
 if not (csloading in componentstate) then begin
  application.lock;
  try
   if avalue = 0.0 then begin
    fcancel:= false;
   end; 
   inherited;
  finally
   application.unlock;
  end;
 end
 else begin
  inherited;
 end;
end;

procedure tcustomprogressbar.setbar_face(const avalue: tbarface);
begin
 fbar_face.assign(avalue);
end;

procedure tcustomprogressbar.updatebarrect(const avalue: realty; const arect: rectty;
                              out facedest,framebardest,facebardest: rectty);
var
 int1,int2,int3: integer;
begin
 if avalue = emptyreal then begin
  facedest:= nullrect;
  framebardest:= nullrect;
  facebardest:= nullrect;
 end
 else begin
  with fbar_frame do begin
   facedest.x:= arect.x + fi.innerframe.left;  //origin = paintpos
   facedest.y:= arect.y + fi.innerframe.top;
   int2:= (finnerframe.left+finnerframe.right);
   int3:= (finnerframe.top+finnerframe.bottom);
   facedest.cx:= arect.cx - int2;
   facedest.cy:= arect.cy - int3;
  end;
//  facedest:= deflaterect(arect,fbar_frame.innerframe);
//  facedest.pos:= pointty(fbar_frame.fi.innerframe.topleft);
                    //origin = paintpos
  framebardest:= arect;
  if fdirection in [gd_right,gd_left] then begin
   int1:= round(avalue*facedest.cx) + int2;
   if fdirection = gd_left then begin
    inc(framebardest.x,framebardest.cx - int1);
   end;
   framebardest.cx:= int1;
  end
  else begin
   int1:= round(avalue*facedest.cy) + int3;
   if fdirection = gd_up then begin
    inc(framebardest.y,framebardest.cy - int1);
   end;
   framebardest.cy:= int1;
  end;
  facebardest:= deflaterect(framebardest,fbar_frame.innerframe);
  subpoint1(facebardest.pos,pointty(fbar_frame.fpaintframe.topleft));
                                 //origin = paintpos
 end;
end;

procedure tcustomprogressbar.updatebar;
begin
 updatebarrect(fvalue,innerclientrect,ffacerect,fframebarrect,ffacebarrect);
end;

procedure tcustomprogressbar.clientrectchanged;
begin
 inherited;
 updatebar;
end;

procedure tcustomprogressbar.dochange;
begin
 updatebar;
 inherited;
end;

procedure tcustomprogressbar.changedirection(const avalue: graphicdirectionty;
               var dest: graphicdirectionty);
begin
 fbar_face.fade_direction:= rotatedirection(fbar_face.fade_direction,avalue,dest);
 fbar_frame.changedirection(avalue,dest);
 inherited;
 updatebar;
end;

procedure tcustomprogressbar.paintglyph(const canvas: tcanvas;
                               const acolorglyph: colorty; const avalue;
                               const arect: rectty);
var
 po1,po2,po3: prectty;
 rect1,rect2,rect3: rectty;
 rea1: realty;
begin
 if @avalue = nil then begin
  po1:= @ffacerect;
  po2:= @fframebarrect;
  po3:= @ffacebarrect;
  rea1:= fvalue;
 end
 else begin
  po1:= @rect1;
  po2:= @rect2;
  po3:= @rect3;
  rea1:= realty(avalue);
  updatebarrect(realty(avalue),arect,rect1,rect2,rect3);  
 end;
 if not (rea1 = emptyreal) then begin
  canvas.save;
  fbar_frame.paintbackground(canvas,po2^); //moves origin to paintrect and sets cliprect
  canvas.intersectcliprect(po3^);
  fbar_face.paint(canvas,po1^);
  canvas.restore;
  fbar_frame.paintoverlay(canvas,po2^);
  if fformat <> '' then begin
   drawtext(canvas,realtytostr(applyrange(rea1,fvaluerange,fvaluestart),
                                         fformat),arect,ftextflags,ffont);
  end;
 end;
end;

procedure tcustomprogressbar.internalcreateframe;
begin
 tdispframe.create(iscrollframe(self));
end;

procedure tcustomprogressbar.setvaluerange(const avalue: real);
begin
 fvaluerange:= avalue;
 formatchanged;
end;

procedure tcustomprogressbar.setvaluestart(const avalue: real);
begin
 fvaluestart:= avalue;
 formatchanged;
end;

procedure tcustomprogressbar.setformat(const avalue: string);
begin
 fformat:= avalue;
 formatchanged;
end;

procedure tcustomprogressbar.settextflags(const avalue: textflagsty);
begin
 ftextflags:= avalue;
 formatchanged;
end;

procedure tcustomprogressbar.setbar_frame(const avalue: tbarframe);
begin
 fbar_frame.assign(avalue);
end;

procedure tcustomprogressbar.doprogress(const sender: tobject; const avalue: real;
               var acancel: boolean);
begin
 application.lock;
 try
  value:= avalue;
  acancel:= acancel or cancel;
  if canevent(tmethod(fonprogress)) then begin
   fonprogress(sender,avalue,acancel);
  end;
  if (acancel or (avalue >= 1.0)) and canevent(tmethod(fonfinished)) then begin
   fonfinished(sender,avalue,acancel);
  end;
 finally
  application.unlock;
 end;
end;

procedure tcustomprogressbar.readformat(reader: treader);
begin
 fformat:= treader_readmsestring(reader);
// {$ifdef mse_unicodestring}
// fformat:= reader.readunicodestring;
// {$else}
// fformat:= reader.readwidestring;
// {$endif}
end;

procedure tcustomprogressbar.writeformat(writer: twriter);
begin
 twriter_writemsestring(writer,fformat);
// {$ifdef mse_unicodestring}
// writer.writeunicodestring(fformat);
// {$else}
// writer.writewidestring(fformat);
// {$endif}
end;

procedure tcustomprogressbar.readvaluescale(reader: treader);
begin
 valuerange:= valuescaletorange(reader);
end;

procedure tcustomprogressbar.defineproperties(filer: tfiler);
begin
 filer.defineproperty('format',{$ifdef FPC}@{$endif}readformat,
                                    {$ifdef FPC}@{$endif}writeformat,true);
 filer.defineproperty('valuescale',{$ifdef FPC}@{$endif}readvaluescale,nil,false);
end;

end.
