unit targetconsole_mfm;
{$ifdef FPC}{$mode objfpc}{$h+}{$INTERFACES CORBA}{$endif}

interface

implementation
uses
 mseclasses,targetconsole;

const
 objdata: record size: integer; data: array[0..2956] of byte end =
      (size: 2957; data: (
  84,80,70,48,16,116,116,97,114,103,101,116,99,111,110,115,111,108,101,102,
  111,15,116,97,114,103,101,116,99,111,110,115,111,108,101,102,111,13,111,112,
  116,105,111,110,115,119,105,100,103,101,116,11,13,111,119,95,97,114,114,111,
  119,102,111,99,117,115,15,111,119,95,97,114,114,111,119,102,111,99,117,115,
  105,110,16,111,119,95,97,114,114,111,119,102,111,99,117,115,111,117,116,11,
  111,119,95,115,117,98,102,111,99,117,115,17,111,119,95,100,101,115,116,114,
  111,121,119,105,100,103,101,116,115,9,111,119,95,104,105,110,116,111,110,12,
  111,119,95,97,117,116,111,115,99,97,108,101,0,8,98,111,117,110,100,115,
  95,120,3,205,0,8,98,111,117,110,100,115,95,121,3,111,1,9,98,111,
  117,110,100,115,95,99,120,3,112,1,9,98,111,117,110,100,115,95,99,121,
  3,137,0,15,102,114,97,109,101,46,103,114,105,112,95,115,105,122,101,2,
  10,18,102,114,97,109,101,46,103,114,105,112,95,111,112,116,105,111,110,115,
  11,14,103,111,95,99,108,111,115,101,98,117,116,116,111,110,16,103,111,95,
  102,105,120,115,105,122,101,98,117,116,116,111,110,12,103,111,95,116,111,112,
  98,117,116,116,111,110,0,11,102,114,97,109,101,46,100,117,109,109,121,2,
  0,9,112,111,112,117,112,109,101,110,117,7,11,116,112,111,112,117,112,109,
  101,110,117,49,7,118,105,115,105,98,108,101,8,23,99,111,110,116,97,105,
  110,101,114,46,111,112,116,105,111,110,115,119,105,100,103,101,116,11,13,111,
  119,95,109,111,117,115,101,102,111,99,117,115,11,111,119,95,116,97,98,102,
  111,99,117,115,13,111,119,95,97,114,114,111,119,102,111,99,117,115,15,111,
  119,95,97,114,114,111,119,102,111,99,117,115,105,110,16,111,119,95,97,114,
  114,111,119,102,111,99,117,115,111,117,116,11,111,119,95,115,117,98,102,111,
  99,117,115,19,111,119,95,109,111,117,115,101,116,114,97,110,115,112,97,114,
  101,110,116,17,111,119,95,100,101,115,116,114,111,121,119,105,100,103,101,116,
  115,12,111,119,95,97,117,116,111,115,99,97,108,101,0,18,99,111,110,116,
  97,105,110,101,114,46,98,111,117,110,100,115,95,120,2,0,18,99,111,110,
  116,97,105,110,101,114,46,98,111,117,110,100,115,95,121,2,0,19,99,111,
  110,116,97,105,110,101,114,46,98,111,117,110,100,115,95,99,120,3,102,1,
  19,99,111,110,116,97,105,110,101,114,46,98,111,117,110,100,115,95,99,121,
  3,137,0,21,99,111,110,116,97,105,110,101,114,46,102,114,97,109,101,46,
  100,117,109,109,121,2,0,20,100,114,97,103,100,111,99,107,46,111,112,116,
  105,111,110,115,100,111,99,107,11,10,111,100,95,115,97,118,101,112,111,115,
  10,111,100,95,99,97,110,109,111,118,101,11,111,100,95,99,97,110,102,108,
  111,97,116,10,111,100,95,99,97,110,100,111,99,107,11,111,100,95,112,114,
  111,112,115,105,122,101,0,8,115,116,97,116,102,105,108,101,7,22,109,97,
  105,110,102,111,46,112,114,111,106,101,99,116,115,116,97,116,102,105,108,101,
  7,99,97,112,116,105,111,110,6,14,84,97,114,103,101,116,32,99,111,110,
  115,111,108,101,21,105,99,111,110,46,116,114,97,110,115,112,97,114,101,110,
  116,99,111,108,111,114,4,0,0,0,128,12,105,99,111,110,46,111,112,116,
  105,111,110,115,11,10,98,109,111,95,109,97,115,107,101,100,0,17,105,99,
  111,110,46,116,114,97,110,115,112,97,114,101,110,99,121,4,0,0,0,128,
  10,105,99,111,110,46,105,109,97,103,101,10,12,4,0,0,0,0,0,0,
  2,0,0,0,24,0,0,0,24,0,0,0,120,3,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,224,224,224,25,248,252,248,22,224,224,224,2,
  248,252,248,1,200,204,200,20,128,128,128,1,224,224,224,2,248,252,248,1,
  200,204,200,1,248,252,248,18,224,224,224,1,128,128,128,1,224,224,224,2,
  248,252,248,1,200,204,200,1,248,252,248,18,224,224,224,1,128,128,128,1,
  224,224,224,2,248,252,248,1,200,204,200,1,248,252,248,11,0,0,0,2,
  248,252,248,3,0,0,0,2,224,224,224,1,128,128,128,1,224,224,224,2,
  248,252,248,1,200,204,200,1,248,252,248,5,200,200,200,1,224,224,224,1,
  248,252,248,6,0,0,0,1,248,252,248,1,0,0,0,1,248,252,248,2,
  224,224,224,1,128,128,128,1,224,224,224,2,248,252,248,1,200,204,200,1,
  248,252,248,4,184,184,184,1,0,0,0,1,40,40,40,1,248,252,248,7,
  0,0,0,1,248,252,248,3,224,224,224,1,128,128,128,1,224,224,224,2,
  248,252,248,1,200,204,200,1,248,252,248,4,88,88,88,1,64,64,64,1,
  0,0,0,1,192,196,192,1,248,252,248,6,0,0,0,1,248,252,248,3,
  224,224,224,1,128,128,128,1,224,224,224,2,248,252,248,1,200,204,200,1,
  248,252,248,3,232,236,232,1,8,8,8,1,176,180,176,1,64,68,64,1,
  96,100,96,1,248,252,248,6,0,0,0,1,248,252,248,3,224,224,224,1,
  128,128,128,1,224,224,224,2,248,252,248,1,200,204,200,1,248,252,248,3,
  144,148,144,1,24,24,24,1,248,252,248,1,160,164,160,1,8,12,8,1,
  240,244,240,1,248,252,248,5,0,0,0,1,248,252,248,3,224,224,224,1,
  128,128,128,1,224,224,224,2,248,252,248,1,200,204,200,1,248,252,248,3,
  48,52,48,1,112,116,112,1,248,252,248,1,240,244,240,1,8,12,8,1,
  160,160,160,1,248,252,248,5,0,0,0,1,248,252,248,3,224,224,224,1,
  128,128,128,1,224,224,224,2,248,252,248,1,200,204,200,1,248,252,248,2,
  208,208,208,1,0,0,0,1,208,208,208,1,248,252,248,2,96,100,96,1,
  56,60,56,1,248,252,248,5,0,0,0,1,248,252,248,3,224,224,224,1,
  128,128,128,1,224,224,224,2,248,252,248,1,200,204,200,1,248,252,248,2,
  112,112,112,1,0,0,0,1,56,56,56,3,32,36,32,1,0,0,0,1,
  216,220,216,1,248,252,248,4,0,0,0,1,248,252,248,3,224,224,224,1,
  128,128,128,1,224,224,224,2,248,252,248,1,200,204,200,1,248,252,248,1,
  248,248,248,1,16,20,16,1,96,96,96,1,152,156,152,4,32,32,32,1,
  120,124,120,1,248,252,248,4,0,0,0,1,248,252,248,3,224,224,224,1,
  128,128,128,1,224,224,224,2,248,252,248,1,200,204,200,1,248,252,248,1,
  168,172,168,1,0,0,0,1,224,228,224,1,248,252,248,4,120,124,120,1,
  24,28,24,1,248,252,248,4,0,0,0,1,248,252,248,3,224,224,224,1,
  128,128,128,1,224,224,224,2,248,252,248,1,200,204,200,1,248,252,248,1,
  72,76,72,1,64,64,64,1,248,252,248,5,216,216,216,1,0,0,0,1,
  184,184,184,1,248,252,248,3,0,0,0,1,248,252,248,3,224,224,224,1,
  128,128,128,1,224,224,224,2,248,252,248,1,200,204,200,1,248,252,248,13,
  0,0,0,1,248,252,248,1,0,0,0,1,248,252,248,2,224,224,224,1,
  128,128,128,1,224,224,224,2,248,252,248,1,200,204,200,1,248,252,248,11,
  0,0,0,2,248,252,248,3,0,0,0,2,224,224,224,1,128,128,128,1,
  224,224,224,2,248,252,248,1,200,204,200,1,248,252,248,18,224,224,224,1,
  128,128,128,1,224,224,224,2,248,252,248,1,200,204,200,1,248,252,248,18,
  224,224,224,1,128,128,128,1,224,224,224,2,248,252,248,1,224,224,224,20,
  128,128,128,1,224,224,224,2,128,128,128,22,224,224,224,25,0,0,0,0,
  254,255,127,0,254,255,127,191,254,255,95,8,254,255,95,0,254,255,95,0,
  254,253,95,0,254,255,95,0,254,255,95,0,254,255,95,0,254,255,95,0,
  254,255,95,3,254,255,95,0,254,255,95,0,254,255,95,191,254,255,95,8,
  254,255,95,0,254,255,95,3,254,255,95,64,254,255,95,0,254,255,95,0,
  2,0,64,0,254,255,127,0,0,0,0,0,6,111,110,105,100,108,101,7,
  19,116,97,114,103,101,116,99,111,110,115,111,108,101,111,110,105,100,108,101,
  6,111,110,115,104,111,119,7,20,116,97,114,116,103,101,116,99,111,110,115,
  111,108,101,111,110,115,104,111,119,15,109,111,100,117,108,101,99,108,97,115,
  115,110,97,109,101,6,9,116,100,111,99,107,102,111,114,109,0,11,116,119,
  105,100,103,101,116,103,114,105,100,4,103,114,105,100,13,111,112,116,105,111,
  110,115,119,105,100,103,101,116,11,13,111,119,95,109,111,117,115,101,102,111,
  99,117,115,11,111,119,95,116,97,98,102,111,99,117,115,13,111,119,95,97,
  114,114,111,119,102,111,99,117,115,15,111,119,95,97,114,114,111,119,102,111,
  99,117,115,105,110,16,111,119,95,97,114,114,111,119,102,111,99,117,115,111,
  117,116,17,111,119,95,102,111,99,117,115,98,97,99,107,111,110,101,115,99,
  17,111,119,95,100,101,115,116,114,111,121,119,105,100,103,101,116,115,17,111,
  119,95,102,111,110,116,108,105,110,101,104,101,105,103,104,116,12,111,119,95,
  97,117,116,111,115,99,97,108,101,0,8,98,111,117,110,100,115,95,120,2,
  0,8,98,111,117,110,100,115,95,121,2,0,9,98,111,117,110,100,115,95,
  99,120,3,102,1,9,98,111,117,110,100,115,95,99,121,3,137,0,11,102,
  114,97,109,101,46,100,117,109,109,121,2,0,7,97,110,99,104,111,114,115,
  11,0,9,102,111,110,116,46,110,97,109,101,6,9,115,116,102,95,102,105,
  120,101,100,10,102,111,110,116,46,100,117,109,109,121,2,0,11,111,112,116,
  105,111,110,115,103,114,105,100,11,19,111,103,95,102,111,99,117,115,99,101,
  108,108,111,110,101,110,116,101,114,15,111,103,95,97,117,116,111,102,105,114,
  115,116,114,111,119,20,111,103,95,99,111,108,99,104,97,110,103,101,111,110,
  116,97,98,107,101,121,12,111,103,95,97,117,116,111,112,111,112,117,112,0,
  8,114,111,119,99,111,117,110,116,2,0,11,114,111,119,99,111,117,110,116,
  109,97,120,3,136,19,14,100,97,116,97,99,111,108,115,46,99,111,117,110,
  116,2,1,14,100,97,116,97,99,111,108,115,46,105,116,101,109,115,14,1,
  5,119,105,100,116,104,3,184,11,7,111,112,116,105,111,110,115,11,7,99,
  111,95,102,105,108,108,12,99,111,95,115,97,118,101,115,116,97,116,101,10,
  99,111,95,114,111,119,102,111,110,116,11,99,111,95,114,111,119,99,111,108,
  111,114,13,99,111,95,122,101,98,114,97,99,111,108,111,114,0,8,119,105,
  100,116,104,109,105,110,3,184,11,10,119,105,100,103,101,116,110,97,109,101,
  6,8,116,101,114,109,105,110,97,108,0,0,16,100,97,116,97,114,111,119,
  108,105,110,101,119,105,100,116,104,2,0,13,100,97,116,97,114,111,119,104,
  101,105,103,104,116,2,15,13,114,101,102,102,111,110,116,104,101,105,103,104,
  116,2,13,0,9,116,116,101,114,109,105,110,97,108,8,116,101,114,109,105,
  110,97,108,13,111,112,116,105,111,110,115,119,105,100,103,101,116,11,13,111,
  119,95,109,111,117,115,101,102,111,99,117,115,11,111,119,95,116,97,98,102,
  111,99,117,115,13,111,119,95,97,114,114,111,119,102,111,99,117,115,15,111,
  119,95,97,114,114,111,119,102,111,99,117,115,105,110,16,111,119,95,97,114,
  114,111,119,102,111,99,117,115,111,117,116,17,111,119,95,100,101,115,116,114,
  111,121,119,105,100,103,101,116,115,17,111,119,95,102,111,110,116,108,105,110,
  101,104,101,105,103,104,116,12,111,119,95,97,117,116,111,115,99,97,108,101,
  0,8,98,111,117,110,100,115,95,120,2,0,8,98,111,117,110,100,115,95,
  121,2,0,9,98,111,117,110,100,115,95,99,120,3,184,11,9,98,111,117,
  110,100,115,95,99,121,2,15,7,118,105,115,105,98,108,101,8,10,111,110,
  115,101,110,100,116,101,120,116,7,8,115,101,110,100,116,101,120,116,13,114,
  101,102,102,111,110,116,104,101,105,103,104,116,2,13,0,0,0,10,116,112,
  111,112,117,112,109,101,110,117,11,116,112,111,112,117,112,109,101,110,117,49,
  18,109,101,110,117,46,115,117,98,109,101,110,117,46,99,111,117,110,116,2,
  1,18,109,101,110,117,46,115,117,98,109,101,110,117,46,105,116,101,109,115,
  14,1,7,99,97,112,116,105,111,110,6,5,67,108,101,97,114,5,115,116,
  97,116,101,11,15,97,115,95,108,111,99,97,108,99,97,112,116,105,111,110,
  17,97,115,95,108,111,99,97,108,111,110,101,120,101,99,117,116,101,0,9,
  111,110,101,120,101,99,117,116,101,7,8,99,108,101,97,114,101,120,101,0,
  0,4,76,101,102,116,2,88,3,84,111,112,2,48,0,0,0)
 );

initialization
 registerobjectdata(@objdata,ttargetconsolefo,'');
end.
