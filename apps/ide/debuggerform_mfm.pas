unit debuggerform_mfm;
{$ifdef FPC}{$mode objfpc}{$h+}{$INTERFACES CORBA}{$endif}

interface

implementation
uses
 mseclasses,debuggerform;

const
 objdata: record size: integer; data: array[0..1730] of byte end =
      (size: 1731; data: (
  84,80,70,48,11,116,100,101,98,117,103,103,101,114,102,111,10,100,101,98,
  117,103,103,101,114,102,111,13,111,112,116,105,111,110,115,119,105,100,103,101,
  116,11,13,111,119,95,97,114,114,111,119,102,111,99,117,115,15,111,119,95,
  97,114,114,111,119,102,111,99,117,115,105,110,16,111,119,95,97,114,114,111,
  119,102,111,99,117,115,111,117,116,11,111,119,95,115,117,98,102,111,99,117,
  115,17,111,119,95,100,101,115,116,114,111,121,119,105,100,103,101,116,115,9,
  111,119,95,104,105,110,116,111,110,12,111,119,95,97,117,116,111,115,99,97,
  108,101,0,8,98,111,117,110,100,115,95,120,2,123,8,98,111,117,110,100,
  115,95,121,2,118,9,98,111,117,110,100,115,95,99,120,3,185,1,9,98,
  111,117,110,100,115,95,99,121,2,100,5,99,111,108,111,114,4,1,0,0,
  128,15,102,114,97,109,101,46,103,114,105,112,95,115,105,122,101,2,10,18,
  102,114,97,109,101,46,103,114,105,112,95,111,112,116,105,111,110,115,11,14,
  103,111,95,99,108,111,115,101,98,117,116,116,111,110,16,103,111,95,102,105,
  120,115,105,122,101,98,117,116,116,111,110,12,103,111,95,116,111,112,98,117,
  116,116,111,110,0,11,102,114,97,109,101,46,100,117,109,109,121,2,0,7,
  118,105,115,105,98,108,101,8,23,99,111,110,116,97,105,110,101,114,46,111,
  112,116,105,111,110,115,119,105,100,103,101,116,11,13,111,119,95,109,111,117,
  115,101,102,111,99,117,115,11,111,119,95,116,97,98,102,111,99,117,115,13,
  111,119,95,97,114,114,111,119,102,111,99,117,115,15,111,119,95,97,114,114,
  111,119,102,111,99,117,115,105,110,16,111,119,95,97,114,114,111,119,102,111,
  99,117,115,111,117,116,11,111,119,95,115,117,98,102,111,99,117,115,19,111,
  119,95,109,111,117,115,101,116,114,97,110,115,112,97,114,101,110,116,17,111,
  119,95,100,101,115,116,114,111,121,119,105,100,103,101,116,115,12,111,119,95,
  97,117,116,111,115,99,97,108,101,0,18,99,111,110,116,97,105,110,101,114,
  46,98,111,117,110,100,115,95,120,2,0,18,99,111,110,116,97,105,110,101,
  114,46,98,111,117,110,100,115,95,121,2,0,19,99,111,110,116,97,105,110,
  101,114,46,98,111,117,110,100,115,95,99,120,3,175,1,19,99,111,110,116,
  97,105,110,101,114,46,98,111,117,110,100,115,95,99,121,2,100,21,99,111,
  110,116,97,105,110,101,114,46,102,114,97,109,101,46,100,117,109,109,121,2,
  0,16,100,114,97,103,100,111,99,107,46,99,97,112,116,105,111,110,6,8,
  68,101,98,117,103,103,101,114,20,100,114,97,103,100,111,99,107,46,111,112,
  116,105,111,110,115,100,111,99,107,11,10,111,100,95,115,97,118,101,112,111,
  115,10,111,100,95,99,97,110,109,111,118,101,11,111,100,95,99,97,110,102,
  108,111,97,116,10,111,100,95,99,97,110,100,111,99,107,11,111,100,95,112,
  114,111,112,115,105,122,101,0,7,111,112,116,105,111,110,115,11,10,102,111,
  95,115,97,118,101,112,111,115,12,102,111,95,115,97,118,101,115,116,97,116,
  101,0,8,115,116,97,116,102,105,108,101,7,22,109,97,105,110,102,111,46,
  112,114,111,106,101,99,116,115,116,97,116,102,105,108,101,17,105,99,111,110,
  46,116,114,97,110,115,112,97,114,101,110,99,121,4,0,0,0,128,15,109,
  111,100,117,108,101,99,108,97,115,115,110,97,109,101,6,9,116,100,111,99,
  107,102,111,114,109,0,8,116,116,111,111,108,98,97,114,10,103,100,98,116,
  111,111,108,98,97,114,13,111,112,116,105,111,110,115,119,105,100,103,101,116,
  11,15,111,119,95,97,114,114,111,119,102,111,99,117,115,105,110,16,111,119,
  95,97,114,114,111,119,102,111,99,117,115,111,117,116,17,111,119,95,100,101,
  115,116,114,111,121,119,105,100,103,101,116,115,12,111,119,95,116,105,109,101,
  100,104,105,110,116,0,8,98,111,117,110,100,115,95,120,2,0,8,98,111,
  117,110,100,115,95,121,2,0,9,98,111,117,110,100,115,95,99,120,3,175,
  1,9,98,111,117,110,100,115,95,99,121,2,100,11,102,114,97,109,101,46,
  100,117,109,109,121,2,0,7,97,110,99,104,111,114,115,11,0,13,98,117,
  116,116,111,110,115,46,99,111,117,110,116,2,13,13,98,117,116,116,111,110,
  115,46,119,105,100,116,104,2,24,14,98,117,116,116,111,110,115,46,104,101,
  105,103,104,116,2,24,13,98,117,116,116,111,110,115,46,105,116,101,109,115,
  14,1,6,97,99,116,105,111,110,7,15,97,99,116,105,111,110,115,109,111,
  46,114,101,115,101,116,0,1,6,97,99,116,105,111,110,7,19,97,99,116,
  105,111,110,115,109,111,46,105,110,116,101,114,114,117,112,116,0,1,6,97,
  99,116,105,111,110,7,18,97,99,116,105,111,110,115,109,111,46,99,111,110,
  116,105,110,117,101,0,1,6,97,99,116,105,111,110,7,14,97,99,116,105,
  111,110,115,109,111,46,110,101,120,116,0,1,6,97,99,116,105,111,110,7,
  14,97,99,116,105,111,110,115,109,111,46,115,116,101,112,0,1,6,97,99,
  116,105,111,110,7,16,97,99,116,105,111,110,115,109,111,46,102,105,110,105,
  115,104,0,1,7,111,112,116,105,111,110,115,11,13,109,97,111,95,115,101,
  112,97,114,97,116,111,114,0,0,1,4,104,105,110,116,6,16,78,101,120,
  116,32,105,110,115,116,114,117,99,116,105,111,110,6,97,99,116,105,111,110,
  7,15,97,99,116,105,111,110,115,109,111,46,110,101,120,116,105,5,115,116,
  97,116,101,11,12,97,115,95,108,111,99,97,108,104,105,110,116,0,0,1,
  4,104,105,110,116,6,16,83,116,101,112,32,105,110,115,116,114,117,99,116,
  105,111,110,6,97,99,116,105,111,110,7,15,97,99,116,105,111,110,115,109,
  111,46,115,116,101,112,105,5,115,116,97,116,101,11,12,97,115,95,108,111,
  99,97,108,104,105,110,116,0,0,1,7,111,112,116,105,111,110,115,11,13,
  109,97,111,95,115,101,112,97,114,97,116,111,114,0,0,1,6,97,99,116,
  105,111,110,7,20,97,99,116,105,111,110,115,109,111,46,98,107,112,116,115,
  111,110,97,99,116,5,115,116,97,116,101,11,10,97,115,95,99,104,101,99,
  107,101,100,15,97,115,95,108,111,99,97,108,99,104,101,99,107,101,100,0,
  7,111,112,116,105,111,110,115,11,12,109,97,111,95,99,104,101,99,107,98,
  111,120,0,0,1,6,97,99,116,105,111,110,7,22,97,99,116,105,111,110,
  115,109,111,46,119,97,116,99,104,101,115,111,110,97,99,116,5,115,116,97,
  116,101,11,10,97,115,95,99,104,101,99,107,101,100,15,97,115,95,108,111,
  99,97,108,99,104,101,99,107,101,100,0,7,111,112,116,105,111,110,115,11,
  12,109,97,111,95,99,104,101,99,107,98,111,120,0,0,1,6,97,99,116,
  105,111,110,7,23,97,99,116,105,111,110,115,109,111,46,98,108,117,101,100,
  111,116,115,111,110,97,99,116,5,115,116,97,116,101,11,10,97,115,95,99,
  104,101,99,107,101,100,15,97,115,95,108,111,99,97,108,99,104,101,99,107,
  101,100,0,7,111,112,116,105,111,110,115,11,12,109,97,111,95,99,104,101,
  99,107,98,111,120,0,0,0,7,111,112,116,105,111,110,115,11,25,116,98,
  111,95,100,114,97,103,115,111,117,114,99,101,101,110,97,98,108,101,100,111,
  110,108,121,23,116,98,111,95,100,114,97,103,100,101,115,116,101,110,97,98,
  108,101,100,111,110,108,121,0,0,0,0)
 );

initialization
 registerobjectdata(@objdata,tdebuggerfo,'');
end.
