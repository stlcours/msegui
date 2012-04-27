{ MSEgui Copyright (c) 2006-2012 by Martin Schreiber

    See the file COPYING.MSE, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}
unit mseformattiffread;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}
interface
const
 tifflabel = 'tif';
 
implementation
uses
 classes,msegraphics,msebitmap,fpreadtiff,msegraphicstream,msestockobjects;
 
type
 tmsefpreadertiff = class(tfpreadertiff)
  protected
//   function  InternalCheck(Str: TStream): boolean; override;
 end;
 
function readgraphic(const source: tstream; const index: integer; 
                const dest: tobject): boolean;
begin
 if dest is tbitmap then begin
  result:= readfpgraphic(source,tmsefpreadertiff,tbitmap(dest));
  if result then begin
   tbitmap(dest).change;
  end;
 end
 else begin
  result:= false;
 end;
end;

{ tmsefpreadertiff }
{
function tmsefpreadertiff.InternalCheck(Str: TStream): boolean;
var
 int1: integer;
 ar1: array[0..7] of char;
begin
 result:= false;
 int1:= str.position;
 try
  str.readbuffer(ar1,sizeof(ar1));
  if ar1 = #137#80#78#71#13#10#26#10 then begin
   result:= true;
  end;
 finally
  str.position:= int1;
 end;
end;
}
initialization
 registergraphicformat(tifflabel,{$ifdef FPC}@{$endif}readgraphic,nil,
         stockobjects.captions[sc_TIFF_Image],['*.tif','*.tiff']);
end.
