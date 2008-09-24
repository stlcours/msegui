unit memoryform_mfm;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}

interface

implementation
uses
 mseclasses,memoryform;

const
 objdata: record size: integer; data: array[0..5899] of byte end =
      (size: 5900; data: (
  84,80,70,48,9,116,109,101,109,111,114,121,102,111,8,109,101,109,111,114,
  121,102,111,13,111,112,116,105,111,110,115,119,105,100,103,101,116,11,13,111,
  119,95,97,114,114,111,119,102,111,99,117,115,11,111,119,95,115,117,98,102,
  111,99,117,115,17,111,119,95,100,101,115,116,114,111,121,119,105,100,103,101,
  116,115,9,111,119,95,104,105,110,116,111,110,12,111,119,95,97,117,116,111,
  115,99,97,108,101,0,8,98,111,117,110,100,115,95,120,2,100,8,98,111,
  117,110,100,115,95,121,2,100,9,98,111,117,110,100,115,95,99,120,3,197,
  1,9,98,111,117,110,100,115,95,99,121,3,98,1,15,102,114,97,109,101,
  46,103,114,105,112,95,115,105,122,101,2,10,18,102,114,97,109,101,46,103,
  114,105,112,95,111,112,116,105,111,110,115,11,14,103,111,95,99,108,111,115,
  101,98,117,116,116,111,110,16,103,111,95,102,105,120,115,105,122,101,98,117,
  116,116,111,110,12,103,111,95,116,111,112,98,117,116,116,111,110,19,103,111,
  95,98,97,99,107,103,114,111,117,110,100,98,117,116,116,111,110,0,11,102,
  114,97,109,101,46,100,117,109,109,121,2,0,8,116,97,98,111,114,100,101,
  114,2,1,7,118,105,115,105,98,108,101,8,23,99,111,110,116,97,105,110,
  101,114,46,111,112,116,105,111,110,115,119,105,100,103,101,116,11,13,111,119,
  95,109,111,117,115,101,102,111,99,117,115,11,111,119,95,116,97,98,102,111,
  99,117,115,13,111,119,95,97,114,114,111,119,102,111,99,117,115,11,111,119,
  95,115,117,98,102,111,99,117,115,19,111,119,95,109,111,117,115,101,116,114,
  97,110,115,112,97,114,101,110,116,17,111,119,95,100,101,115,116,114,111,121,
  119,105,100,103,101,116,115,12,111,119,95,97,117,116,111,115,99,97,108,101,
  0,18,99,111,110,116,97,105,110,101,114,46,98,111,117,110,100,115,95,120,
  2,0,18,99,111,110,116,97,105,110,101,114,46,98,111,117,110,100,115,95,
  121,2,0,19,99,111,110,116,97,105,110,101,114,46,98,111,117,110,100,115,
  95,99,120,3,187,1,19,99,111,110,116,97,105,110,101,114,46,98,111,117,
  110,100,115,95,99,121,3,98,1,21,99,111,110,116,97,105,110,101,114,46,
  102,114,97,109,101,46,100,117,109,109,121,2,0,20,100,114,97,103,100,111,
  99,107,46,111,112,116,105,111,110,115,100,111,99,107,11,10,111,100,95,115,
  97,118,101,112,111,115,13,111,100,95,115,97,118,101,122,111,114,100,101,114,
  10,111,100,95,99,97,110,109,111,118,101,10,111,100,95,99,97,110,115,105,
  122,101,11,111,100,95,99,97,110,102,108,111,97,116,10,111,100,95,99,97,
  110,100,111,99,107,15,111,100,95,112,114,111,112,111,114,116,105,111,110,97,
  108,11,111,100,95,112,114,111,112,115,105,122,101,0,8,115,116,97,116,102,
  105,108,101,7,22,109,97,105,110,102,111,46,112,114,111,106,101,99,116,115,
  116,97,116,102,105,108,101,7,99,97,112,116,105,111,110,6,6,77,101,109,
  111,114,121,6,111,110,115,104,111,119,7,8,102,111,114,109,115,104,111,119,
  15,109,111,100,117,108,101,99,108,97,115,115,110,97,109,101,6,9,116,100,
  111,99,107,102,111,114,109,0,11,116,115,116,114,105,110,103,103,114,105,100,
  4,103,114,105,100,13,111,112,116,105,111,110,115,119,105,100,103,101,116,11,
  13,111,119,95,109,111,117,115,101,102,111,99,117,115,11,111,119,95,116,97,
  98,102,111,99,117,115,13,111,119,95,97,114,114,111,119,102,111,99,117,115,
  17,111,119,95,102,111,99,117,115,98,97,99,107,111,110,101,115,99,13,111,
  119,95,109,111,117,115,101,119,104,101,101,108,17,111,119,95,100,101,115,116,
  114,111,121,119,105,100,103,101,116,115,18,111,119,95,102,111,110,116,103,108,
  121,112,104,104,101,105,103,104,116,12,111,119,95,97,117,116,111,115,99,97,
  108,101,0,8,98,111,117,110,100,115,95,120,2,0,8,98,111,117,110,100,
  115,95,121,2,40,9,98,111,117,110,100,115,95,99,120,3,187,1,9,98,
  111,117,110,100,115,95,99,121,3,58,1,11,102,114,97,109,101,46,100,117,
  109,109,121,2,0,7,97,110,99,104,111,114,115,11,6,97,110,95,116,111,
  112,9,97,110,95,98,111,116,116,111,109,0,8,116,97,98,111,114,100,101,
  114,2,4,9,102,111,110,116,46,110,97,109,101,6,9,115,116,102,95,102,
  105,120,101,100,11,102,111,110,116,46,120,115,99,97,108,101,5,0,0,0,
  0,0,0,0,128,255,63,10,102,111,110,116,46,100,117,109,109,121,2,0,
  14,100,97,116,97,99,111,108,115,46,99,111,117,110,116,2,16,14,100,97,
  116,97,99,111,108,115,46,119,105,100,116,104,2,20,18,100,97,116,97,99,
  111,108,115,46,116,101,120,116,102,108,97,103,115,11,12,116,102,95,120,99,
  101,110,116,101,114,101,100,12,116,102,95,121,99,101,110,116,101,114,101,100,
  11,116,102,95,110,111,115,101,108,101,99,116,0,20,100,97,116,97,99,111,
  108,115,46,111,112,116,105,111,110,115,101,100,105,116,11,14,115,99,111,101,
  95,117,110,100,111,111,110,101,115,99,26,115,99,111,101,95,102,111,114,99,
  101,114,101,116,117,114,110,99,104,101,99,107,118,97,108,117,101,14,115,99,
  111,101,95,101,97,116,114,101,116,117,114,110,15,115,99,111,101,95,97,117,
  116,111,115,101,108,101,99,116,27,115,99,111,101,95,97,117,116,111,115,101,
  108,101,99,116,111,110,102,105,114,115,116,99,108,105,99,107,0,14,100,97,
  116,97,99,111,108,115,46,105,116,101,109,115,14,1,5,119,105,100,116,104,
  2,20,9,116,101,120,116,102,108,97,103,115,11,12,116,102,95,120,99,101,
  110,116,101,114,101,100,12,116,102,95,121,99,101,110,116,101,114,101,100,11,
  116,102,95,110,111,115,101,108,101,99,116,0,11,111,112,116,105,111,110,115,
  101,100,105,116,11,14,115,99,111,101,95,117,110,100,111,111,110,101,115,99,
  26,115,99,111,101,95,102,111,114,99,101,114,101,116,117,114,110,99,104,101,
  99,107,118,97,108,117,101,14,115,99,111,101,95,101,97,116,114,101,116,117,
  114,110,15,115,99,111,101,95,97,117,116,111,115,101,108,101,99,116,27,115,
  99,111,101,95,97,117,116,111,115,101,108,101,99,116,111,110,102,105,114,115,
  116,99,108,105,99,107,0,13,100,97,116,97,108,105,115,116,46,100,97,116,
  97,1,6,0,6,0,6,0,6,0,6,0,0,10,111,110,115,101,116,118,
  97,108,117,101,7,12,99,101,108,108,115,101,116,118,97,108,117,101,13,111,
  110,100,97,116,97,101,110,116,101,114,101,100,7,5,97,100,101,110,116,0,
  1,5,119,105,100,116,104,2,20,9,116,101,120,116,102,108,97,103,115,11,
  12,116,102,95,120,99,101,110,116,101,114,101,100,12,116,102,95,121,99,101,
  110,116,101,114,101,100,11,116,102,95,110,111,115,101,108,101,99,116,0,11,
  111,112,116,105,111,110,115,101,100,105,116,11,14,115,99,111,101,95,117,110,
  100,111,111,110,101,115,99,26,115,99,111,101,95,102,111,114,99,101,114,101,
  116,117,114,110,99,104,101,99,107,118,97,108,117,101,14,115,99,111,101,95,
  101,97,116,114,101,116,117,114,110,15,115,99,111,101,95,97,117,116,111,115,
  101,108,101,99,116,27,115,99,111,101,95,97,117,116,111,115,101,108,101,99,
  116,111,110,102,105,114,115,116,99,108,105,99,107,0,13,100,97,116,97,108,
  105,115,116,46,100,97,116,97,1,6,0,6,0,6,0,6,0,6,0,0,
  0,1,5,119,105,100,116,104,2,20,9,116,101,120,116,102,108,97,103,115,
  11,12,116,102,95,120,99,101,110,116,101,114,101,100,12,116,102,95,121,99,
  101,110,116,101,114,101,100,11,116,102,95,110,111,115,101,108,101,99,116,0,
  11,111,112,116,105,111,110,115,101,100,105,116,11,14,115,99,111,101,95,117,
  110,100,111,111,110,101,115,99,26,115,99,111,101,95,102,111,114,99,101,114,
  101,116,117,114,110,99,104,101,99,107,118,97,108,117,101,14,115,99,111,101,
  95,101,97,116,114,101,116,117,114,110,15,115,99,111,101,95,97,117,116,111,
  115,101,108,101,99,116,27,115,99,111,101,95,97,117,116,111,115,101,108,101,
  99,116,111,110,102,105,114,115,116,99,108,105,99,107,0,13,100,97,116,97,
  108,105,115,116,46,100,97,116,97,1,6,0,6,0,6,0,6,0,6,0,
  0,0,1,5,119,105,100,116,104,2,20,9,116,101,120,116,102,108,97,103,
  115,11,12,116,102,95,120,99,101,110,116,101,114,101,100,12,116,102,95,121,
  99,101,110,116,101,114,101,100,11,116,102,95,110,111,115,101,108,101,99,116,
  0,11,111,112,116,105,111,110,115,101,100,105,116,11,14,115,99,111,101,95,
  117,110,100,111,111,110,101,115,99,26,115,99,111,101,95,102,111,114,99,101,
  114,101,116,117,114,110,99,104,101,99,107,118,97,108,117,101,14,115,99,111,
  101,95,101,97,116,114,101,116,117,114,110,15,115,99,111,101,95,97,117,116,
  111,115,101,108,101,99,116,27,115,99,111,101,95,97,117,116,111,115,101,108,
  101,99,116,111,110,102,105,114,115,116,99,108,105,99,107,0,13,100,97,116,
  97,108,105,115,116,46,100,97,116,97,1,6,0,6,0,6,0,6,0,6,
  0,0,0,1,5,119,105,100,116,104,2,20,9,116,101,120,116,102,108,97,
  103,115,11,12,116,102,95,120,99,101,110,116,101,114,101,100,12,116,102,95,
  121,99,101,110,116,101,114,101,100,11,116,102,95,110,111,115,101,108,101,99,
  116,0,11,111,112,116,105,111,110,115,101,100,105,116,11,14,115,99,111,101,
  95,117,110,100,111,111,110,101,115,99,26,115,99,111,101,95,102,111,114,99,
  101,114,101,116,117,114,110,99,104,101,99,107,118,97,108,117,101,14,115,99,
  111,101,95,101,97,116,114,101,116,117,114,110,15,115,99,111,101,95,97,117,
  116,111,115,101,108,101,99,116,27,115,99,111,101,95,97,117,116,111,115,101,
  108,101,99,116,111,110,102,105,114,115,116,99,108,105,99,107,0,13,100,97,
  116,97,108,105,115,116,46,100,97,116,97,1,6,0,6,0,6,0,6,0,
  6,0,0,0,1,5,119,105,100,116,104,2,20,9,116,101,120,116,102,108,
  97,103,115,11,12,116,102,95,120,99,101,110,116,101,114,101,100,12,116,102,
  95,121,99,101,110,116,101,114,101,100,11,116,102,95,110,111,115,101,108,101,
  99,116,0,11,111,112,116,105,111,110,115,101,100,105,116,11,14,115,99,111,
  101,95,117,110,100,111,111,110,101,115,99,26,115,99,111,101,95,102,111,114,
  99,101,114,101,116,117,114,110,99,104,101,99,107,118,97,108,117,101,14,115,
  99,111,101,95,101,97,116,114,101,116,117,114,110,15,115,99,111,101,95,97,
  117,116,111,115,101,108,101,99,116,27,115,99,111,101,95,97,117,116,111,115,
  101,108,101,99,116,111,110,102,105,114,115,116,99,108,105,99,107,0,13,100,
  97,116,97,108,105,115,116,46,100,97,116,97,1,6,0,6,0,6,0,6,
  0,6,0,0,0,1,5,119,105,100,116,104,2,20,9,116,101,120,116,102,
  108,97,103,115,11,12,116,102,95,120,99,101,110,116,101,114,101,100,12,116,
  102,95,121,99,101,110,116,101,114,101,100,11,116,102,95,110,111,115,101,108,
  101,99,116,0,11,111,112,116,105,111,110,115,101,100,105,116,11,14,115,99,
  111,101,95,117,110,100,111,111,110,101,115,99,26,115,99,111,101,95,102,111,
  114,99,101,114,101,116,117,114,110,99,104,101,99,107,118,97,108,117,101,14,
  115,99,111,101,95,101,97,116,114,101,116,117,114,110,15,115,99,111,101,95,
  97,117,116,111,115,101,108,101,99,116,27,115,99,111,101,95,97,117,116,111,
  115,101,108,101,99,116,111,110,102,105,114,115,116,99,108,105,99,107,0,13,
  100,97,116,97,108,105,115,116,46,100,97,116,97,1,6,0,6,0,6,0,
  6,0,6,0,0,0,1,5,119,105,100,116,104,2,20,9,116,101,120,116,
  102,108,97,103,115,11,12,116,102,95,120,99,101,110,116,101,114,101,100,12,
  116,102,95,121,99,101,110,116,101,114,101,100,11,116,102,95,110,111,115,101,
  108,101,99,116,0,11,111,112,116,105,111,110,115,101,100,105,116,11,14,115,
  99,111,101,95,117,110,100,111,111,110,101,115,99,26,115,99,111,101,95,102,
  111,114,99,101,114,101,116,117,114,110,99,104,101,99,107,118,97,108,117,101,
  14,115,99,111,101,95,101,97,116,114,101,116,117,114,110,15,115,99,111,101,
  95,97,117,116,111,115,101,108,101,99,116,27,115,99,111,101,95,97,117,116,
  111,115,101,108,101,99,116,111,110,102,105,114,115,116,99,108,105,99,107,0,
  13,100,97,116,97,108,105,115,116,46,100,97,116,97,1,6,0,6,0,6,
  0,6,0,6,0,0,0,1,5,119,105,100,116,104,2,20,9,116,101,120,
  116,102,108,97,103,115,11,12,116,102,95,120,99,101,110,116,101,114,101,100,
  12,116,102,95,121,99,101,110,116,101,114,101,100,11,116,102,95,110,111,115,
  101,108,101,99,116,0,11,111,112,116,105,111,110,115,101,100,105,116,11,14,
  115,99,111,101,95,117,110,100,111,111,110,101,115,99,26,115,99,111,101,95,
  102,111,114,99,101,114,101,116,117,114,110,99,104,101,99,107,118,97,108,117,
  101,14,115,99,111,101,95,101,97,116,114,101,116,117,114,110,15,115,99,111,
  101,95,97,117,116,111,115,101,108,101,99,116,27,115,99,111,101,95,97,117,
  116,111,115,101,108,101,99,116,111,110,102,105,114,115,116,99,108,105,99,107,
  0,13,100,97,116,97,108,105,115,116,46,100,97,116,97,1,6,0,6,0,
  6,0,6,0,6,0,0,0,1,5,119,105,100,116,104,2,20,9,116,101,
  120,116,102,108,97,103,115,11,12,116,102,95,120,99,101,110,116,101,114,101,
  100,12,116,102,95,121,99,101,110,116,101,114,101,100,11,116,102,95,110,111,
  115,101,108,101,99,116,0,11,111,112,116,105,111,110,115,101,100,105,116,11,
  14,115,99,111,101,95,117,110,100,111,111,110,101,115,99,26,115,99,111,101,
  95,102,111,114,99,101,114,101,116,117,114,110,99,104,101,99,107,118,97,108,
  117,101,14,115,99,111,101,95,101,97,116,114,101,116,117,114,110,15,115,99,
  111,101,95,97,117,116,111,115,101,108,101,99,116,27,115,99,111,101,95,97,
  117,116,111,115,101,108,101,99,116,111,110,102,105,114,115,116,99,108,105,99,
  107,0,13,100,97,116,97,108,105,115,116,46,100,97,116,97,1,6,0,6,
  0,6,0,6,0,6,0,0,0,1,5,119,105,100,116,104,2,20,9,116,
  101,120,116,102,108,97,103,115,11,12,116,102,95,120,99,101,110,116,101,114,
  101,100,12,116,102,95,121,99,101,110,116,101,114,101,100,11,116,102,95,110,
  111,115,101,108,101,99,116,0,11,111,112,116,105,111,110,115,101,100,105,116,
  11,14,115,99,111,101,95,117,110,100,111,111,110,101,115,99,26,115,99,111,
  101,95,102,111,114,99,101,114,101,116,117,114,110,99,104,101,99,107,118,97,
  108,117,101,14,115,99,111,101,95,101,97,116,114,101,116,117,114,110,15,115,
  99,111,101,95,97,117,116,111,115,101,108,101,99,116,27,115,99,111,101,95,
  97,117,116,111,115,101,108,101,99,116,111,110,102,105,114,115,116,99,108,105,
  99,107,0,13,100,97,116,97,108,105,115,116,46,100,97,116,97,1,6,0,
  6,0,6,0,6,0,6,0,0,0,1,5,119,105,100,116,104,2,20,9,
  116,101,120,116,102,108,97,103,115,11,12,116,102,95,120,99,101,110,116,101,
  114,101,100,12,116,102,95,121,99,101,110,116,101,114,101,100,11,116,102,95,
  110,111,115,101,108,101,99,116,0,11,111,112,116,105,111,110,115,101,100,105,
  116,11,14,115,99,111,101,95,117,110,100,111,111,110,101,115,99,26,115,99,
  111,101,95,102,111,114,99,101,114,101,116,117,114,110,99,104,101,99,107,118,
  97,108,117,101,14,115,99,111,101,95,101,97,116,114,101,116,117,114,110,15,
  115,99,111,101,95,97,117,116,111,115,101,108,101,99,116,27,115,99,111,101,
  95,97,117,116,111,115,101,108,101,99,116,111,110,102,105,114,115,116,99,108,
  105,99,107,0,13,100,97,116,97,108,105,115,116,46,100,97,116,97,1,6,
  0,6,0,6,0,6,0,6,0,0,0,1,5,119,105,100,116,104,2,20,
  9,116,101,120,116,102,108,97,103,115,11,12,116,102,95,120,99,101,110,116,
  101,114,101,100,12,116,102,95,121,99,101,110,116,101,114,101,100,11,116,102,
  95,110,111,115,101,108,101,99,116,0,11,111,112,116,105,111,110,115,101,100,
  105,116,11,14,115,99,111,101,95,117,110,100,111,111,110,101,115,99,26,115,
  99,111,101,95,102,111,114,99,101,114,101,116,117,114,110,99,104,101,99,107,
  118,97,108,117,101,14,115,99,111,101,95,101,97,116,114,101,116,117,114,110,
  15,115,99,111,101,95,97,117,116,111,115,101,108,101,99,116,27,115,99,111,
  101,95,97,117,116,111,115,101,108,101,99,116,111,110,102,105,114,115,116,99,
  108,105,99,107,0,13,100,97,116,97,108,105,115,116,46,100,97,116,97,1,
  6,0,6,0,6,0,6,0,6,0,0,0,1,5,119,105,100,116,104,2,
  20,9,116,101,120,116,102,108,97,103,115,11,12,116,102,95,120,99,101,110,
  116,101,114,101,100,12,116,102,95,121,99,101,110,116,101,114,101,100,11,116,
  102,95,110,111,115,101,108,101,99,116,0,11,111,112,116,105,111,110,115,101,
  100,105,116,11,14,115,99,111,101,95,117,110,100,111,111,110,101,115,99,26,
  115,99,111,101,95,102,111,114,99,101,114,101,116,117,114,110,99,104,101,99,
  107,118,97,108,117,101,14,115,99,111,101,95,101,97,116,114,101,116,117,114,
  110,15,115,99,111,101,95,97,117,116,111,115,101,108,101,99,116,27,115,99,
  111,101,95,97,117,116,111,115,101,108,101,99,116,111,110,102,105,114,115,116,
  99,108,105,99,107,0,13,100,97,116,97,108,105,115,116,46,100,97,116,97,
  1,6,0,6,0,6,0,6,0,6,0,0,0,1,5,119,105,100,116,104,
  2,20,9,116,101,120,116,102,108,97,103,115,11,12,116,102,95,120,99,101,
  110,116,101,114,101,100,12,116,102,95,121,99,101,110,116,101,114,101,100,11,
  116,102,95,110,111,115,101,108,101,99,116,0,11,111,112,116,105,111,110,115,
  101,100,105,116,11,14,115,99,111,101,95,117,110,100,111,111,110,101,115,99,
  26,115,99,111,101,95,102,111,114,99,101,114,101,116,117,114,110,99,104,101,
  99,107,118,97,108,117,101,14,115,99,111,101,95,101,97,116,114,101,116,117,
  114,110,15,115,99,111,101,95,97,117,116,111,115,101,108,101,99,116,27,115,
  99,111,101,95,97,117,116,111,115,101,108,101,99,116,111,110,102,105,114,115,
  116,99,108,105,99,107,0,13,100,97,116,97,108,105,115,116,46,100,97,116,
  97,1,6,0,6,0,6,0,6,0,6,0,0,0,1,5,119,105,100,116,
  104,2,20,9,116,101,120,116,102,108,97,103,115,11,12,116,102,95,120,99,
  101,110,116,101,114,101,100,12,116,102,95,121,99,101,110,116,101,114,101,100,
  11,116,102,95,110,111,115,101,108,101,99,116,0,11,111,112,116,105,111,110,
  115,101,100,105,116,11,14,115,99,111,101,95,117,110,100,111,111,110,101,115,
  99,26,115,99,111,101,95,102,111,114,99,101,114,101,116,117,114,110,99,104,
  101,99,107,118,97,108,117,101,14,115,99,111,101,95,101,97,116,114,101,116,
  117,114,110,15,115,99,111,101,95,97,117,116,111,115,101,108,101,99,116,27,
  115,99,111,101,95,97,117,116,111,115,101,108,101,99,116,111,110,102,105,114,
  115,116,99,108,105,99,107,0,13,100,97,116,97,108,105,115,116,46,100,97,
  116,97,1,6,0,6,0,6,0,6,0,6,0,0,0,0,13,102,105,120,
  99,111,108,115,46,99,111,117,110,116,2,1,13,102,105,120,99,111,108,115,
  46,105,116,101,109,115,14,1,5,119,105,100,116,104,2,71,15,111,110,97,
  102,116,101,114,100,114,97,119,99,101,108,108,7,10,100,114,97,119,102,105,
  120,99,111,108,0,0,13,102,105,120,114,111,119,115,46,99,111,117,110,116,
  2,1,13,102,105,120,114,111,119,115,46,105,116,101,109,115,14,1,6,104,
  101,105,103,104,116,2,17,14,99,97,112,116,105,111,110,115,46,99,111,117,
  110,116,2,16,14,99,97,112,116,105,111,110,115,46,105,116,101,109,115,14,
  1,7,99,97,112,116,105,111,110,6,1,48,0,1,7,99,97,112,116,105,
  111,110,6,1,49,0,1,7,99,97,112,116,105,111,110,6,1,50,0,1,
  7,99,97,112,116,105,111,110,6,1,51,0,1,7,99,97,112,116,105,111,
  110,6,1,52,0,1,7,99,97,112,116,105,111,110,6,1,53,0,1,7,
  99,97,112,116,105,111,110,6,1,54,0,1,7,99,97,112,116,105,111,110,
  6,1,55,0,1,7,99,97,112,116,105,111,110,6,1,56,0,1,7,99,
  97,112,116,105,111,110,6,1,57,0,1,7,99,97,112,116,105,111,110,6,
  1,65,0,1,7,99,97,112,116,105,111,110,6,1,66,0,1,7,99,97,
  112,116,105,111,110,6,1,67,0,1,7,99,97,112,116,105,111,110,6,1,
  68,0,1,7,99,97,112,116,105,111,110,6,1,69,0,1,7,99,97,112,
  116,105,111,110,6,1,70,0,0,0,0,8,114,111,119,99,111,117,110,116,
  2,5,13,100,97,116,97,114,111,119,104,101,105,103,104,116,2,17,13,114,
  101,102,102,111,110,116,104,101,105,103,104,116,2,15,0,0,12,116,105,110,
  116,101,103,101,114,101,100,105,116,3,97,100,100,8,98,111,117,110,100,115,
  95,120,2,8,8,98,111,117,110,100,115,95,121,2,8,9,98,111,117,110,
  100,115,95,99,120,2,111,9,98,111,117,110,100,115,95,99,121,2,21,13,
  102,114,97,109,101,46,99,97,112,116,105,111,110,6,3,65,100,100,16,102,
  114,97,109,101,46,99,97,112,116,105,111,110,112,111,115,7,8,99,112,95,
  114,105,103,104,116,11,102,114,97,109,101,46,100,117,109,109,121,2,0,16,
  102,114,97,109,101,46,111,117,116,101,114,102,114,97,109,101,1,2,0,2,
  0,2,27,2,0,0,13,111,110,100,97,116,97,101,110,116,101,114,101,100,
  7,5,97,100,101,110,116,4,98,97,115,101,7,6,110,98,95,104,101,120,
  3,109,97,120,2,255,13,114,101,102,102,111,110,116,104,101,105,103,104,116,
  2,15,0,0,12,116,105,110,116,101,103,101,114,101,100,105,116,3,99,110,
  116,8,98,111,117,110,100,115,95,120,3,128,0,8,98,111,117,110,100,115,
  95,121,2,8,9,98,111,117,110,100,115,95,99,120,2,108,9,98,111,117,
  110,100,115,95,99,121,2,21,13,102,114,97,109,101,46,99,97,112,116,105,
  111,110,6,3,67,110,116,16,102,114,97,109,101,46,99,97,112,116,105,111,
  110,112,111,115,7,8,99,112,95,114,105,103,104,116,11,102,114,97,109,101,
  46,100,117,109,109,121,2,0,16,102,114,97,109,101,46,111,117,116,101,114,
  102,114,97,109,101,1,2,0,2,0,2,24,2,0,0,8,116,97,98,111,
  114,100,101,114,2,1,13,111,110,100,97,116,97,101,110,116,101,114,101,100,
  7,5,97,100,101,110,116,4,98,97,115,101,7,6,110,98,95,104,101,120,
  13,114,101,102,102,111,110,116,104,101,105,103,104,116,2,15,0,0,12,116,
  98,111,111,108,101,97,110,101,100,105,116,5,109,101,109,111,110,8,98,111,
  117,110,100,115,95,120,3,96,1,8,98,111,117,110,100,115,95,121,2,10,
  9,98,111,117,110,100,115,95,99,120,2,84,9,98,111,117,110,100,115,95,
  99,121,2,17,13,102,114,97,109,101,46,99,97,112,116,105,111,110,6,9,
  77,101,109,111,114,121,32,111,110,11,102,114,97,109,101,46,100,117,109,109,
  121,2,0,16,102,114,97,109,101,46,111,117,116,101,114,102,114,97,109,101,
  1,2,0,2,2,2,71,2,2,0,8,116,97,98,111,114,100,101,114,2,
  3,13,111,110,100,97,116,97,101,110,116,101,114,101,100,7,5,97,100,101,
  110,116,0,0,9,116,101,110,117,109,101,100,105,116,8,98,105,116,119,105,
  100,116,104,8,98,111,117,110,100,115,95,120,3,248,0,8,98,111,117,110,
  100,115,95,121,2,8,9,98,111,117,110,100,115,95,99,120,2,90,9,98,
  111,117,110,100,115,95,99,121,2,21,13,102,114,97,109,101,46,99,97,112,
  116,105,111,110,6,5,87,105,100,116,104,16,102,114,97,109,101,46,99,97,
  112,116,105,111,110,112,111,115,7,8,99,112,95,114,105,103,104,116,11,102,
  114,97,109,101,46,100,117,109,109,121,2,0,16,102,114,97,109,101,46,111,
  117,116,101,114,102,114,97,109,101,1,2,0,2,0,2,38,2,0,0,8,
  116,97,98,111,114,100,101,114,2,2,9,116,101,120,116,102,108,97,103,115,
  11,12,116,102,95,120,99,101,110,116,101,114,101,100,12,116,102,95,121,99,
  101,110,116,101,114,101,100,11,116,102,95,110,111,115,101,108,101,99,116,0,
  13,111,110,100,97,116,97,101,110,116,101,114,101,100,7,12,117,112,100,97,
  116,101,108,97,121,111,117,116,5,118,97,108,117,101,2,0,19,100,114,111,
  112,100,111,119,110,46,99,111,108,115,46,99,111,117,110,116,2,1,19,100,
  114,111,112,100,111,119,110,46,99,111,108,115,46,105,116,101,109,115,14,1,
  4,100,97,116,97,1,6,1,56,6,2,49,54,6,2,51,50,0,0,0,
  18,100,114,111,112,100,111,119,110,46,105,116,101,109,105,110,100,101,120,2,
  0,13,114,101,102,102,111,110,116,104,101,105,103,104,116,2,15,0,0,0)
 );

initialization
 registerobjectdata(@objdata,tmemoryfo,'');
end.
