unit debuggerform_mfm;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}

interface

implementation
uses
 mseclasses,debuggerform;

const
 objdata: record size: integer; data: array[0..2350] of byte end =
      (size: 2351; data: (
  84,80,70,48,11,116,100,101,98,117,103,103,101,114,102,111,10,100,101,98,
  117,103,103,101,114,102,111,13,111,112,116,105,111,110,115,119,105,100,103,101,
  116,11,13,111,119,95,97,114,114,111,119,102,111,99,117,115,15,111,119,95,
  97,114,114,111,119,102,111,99,117,115,105,110,16,111,119,95,97,114,114,111,
  119,102,111,99,117,115,111,117,116,11,111,119,95,115,117,98,102,111,99,117,
  115,17,111,119,95,100,101,115,116,114,111,121,119,105,100,103,101,116,115,9,
  111,119,95,104,105,110,116,111,110,12,111,119,95,97,117,116,111,115,99,97,
  108,101,0,8,98,111,117,110,100,115,95,120,2,122,8,98,111,117,110,100,
  115,95,121,3,130,0,9,98,111,117,110,100,115,95,99,120,3,185,1,9,
  98,111,117,110,100,115,95,99,121,2,100,15,102,114,97,109,101,46,103,114,
  105,112,95,115,105,122,101,2,10,18,102,114,97,109,101,46,103,114,105,112,
  95,111,112,116,105,111,110,115,11,14,103,111,95,99,108,111,115,101,98,117,
  116,116,111,110,16,103,111,95,102,105,120,115,105,122,101,98,117,116,116,111,
  110,0,11,102,114,97,109,101,46,100,117,109,109,121,2,0,8,116,97,98,
  111,114,100,101,114,2,1,7,118,105,115,105,98,108,101,8,23,99,111,110,
  116,97,105,110,101,114,46,111,112,116,105,111,110,115,119,105,100,103,101,116,
  11,13,111,119,95,109,111,117,115,101,102,111,99,117,115,11,111,119,95,116,
  97,98,102,111,99,117,115,13,111,119,95,97,114,114,111,119,102,111,99,117,
  115,15,111,119,95,97,114,114,111,119,102,111,99,117,115,105,110,16,111,119,
  95,97,114,114,111,119,102,111,99,117,115,111,117,116,11,111,119,95,115,117,
  98,102,111,99,117,115,19,111,119,95,109,111,117,115,101,116,114,97,110,115,
  112,97,114,101,110,116,17,111,119,95,100,101,115,116,114,111,121,119,105,100,
  103,101,116,115,12,111,119,95,97,117,116,111,115,99,97,108,101,0,18,99,
  111,110,116,97,105,110,101,114,46,98,111,117,110,100,115,95,120,2,0,18,
  99,111,110,116,97,105,110,101,114,46,98,111,117,110,100,115,95,121,2,0,
  19,99,111,110,116,97,105,110,101,114,46,98,111,117,110,100,115,95,99,120,
  3,175,1,19,99,111,110,116,97,105,110,101,114,46,98,111,117,110,100,115,
  95,99,121,2,100,21,99,111,110,116,97,105,110,101,114,46,102,114,97,109,
  101,46,100,117,109,109,121,2,0,16,100,114,97,103,100,111,99,107,46,99,
  97,112,116,105,111,110,6,8,68,101,98,117,103,103,101,114,20,100,114,97,
  103,100,111,99,107,46,111,112,116,105,111,110,115,100,111,99,107,11,10,111,
  100,95,115,97,118,101,112,111,115,13,111,100,95,115,97,118,101,122,111,114,
  100,101,114,10,111,100,95,99,97,110,109,111,118,101,11,111,100,95,99,97,
  110,102,108,111,97,116,10,111,100,95,99,97,110,100,111,99,107,15,111,100,
  95,112,114,111,112,111,114,116,105,111,110,97,108,11,111,100,95,112,114,111,
  112,115,105,122,101,0,7,111,112,116,105,111,110,115,11,10,102,111,95,115,
  97,118,101,112,111,115,13,102,111,95,115,97,118,101,122,111,114,100,101,114,
  12,102,111,95,115,97,118,101,115,116,97,116,101,0,8,115,116,97,116,102,
  105,108,101,7,22,109,97,105,110,102,111,46,112,114,111,106,101,99,116,115,
  116,97,116,102,105,108,101,10,105,99,111,110,46,105,109,97,103,101,10,120,
  2,0,0,0,0,0,0,0,0,0,0,24,0,0,0,24,0,0,0,68,
  2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,208,208,208,53,143,
  200,139,1,206,208,206,1,208,208,208,22,61,188,51,1,66,188,57,1,193,
  203,192,1,208,208,208,21,61,188,51,1,13,182,0,1,31,176,20,1,169,
  196,167,1,208,208,208,20,61,188,51,1,13,182,0,2,18,179,6,1,137,
  188,133,1,207,207,207,1,208,208,208,18,61,188,51,1,13,182,0,3,13,
  181,0,1,97,180,91,1,205,205,205,1,208,208,208,17,61,188,51,1,13,
  182,0,5,62,175,53,1,196,203,195,1,208,208,208,16,61,188,51,1,13,
  182,0,6,37,174,26,1,178,199,176,1,208,208,208,15,61,188,51,1,13,
  182,0,7,22,178,10,1,148,191,145,1,207,207,207,1,208,208,208,13,61,
  188,51,1,13,182,0,8,15,181,2,1,111,182,105,1,206,206,206,1,208,
  208,208,12,61,188,51,1,13,182,0,10,74,177,66,1,199,203,199,1,208,
  208,208,11,61,188,51,1,13,182,0,10,47,150,39,1,145,149,145,1,204,
  204,204,1,208,208,208,10,61,188,51,1,13,182,0,8,14,180,1,1,60,
  131,54,1,94,94,94,1,100,100,100,1,161,161,161,1,206,206,206,1,208,
  208,208,9,61,188,51,1,13,182,0,7,19,175,7,1,73,116,70,1,94,
  94,94,1,99,99,99,1,149,149,149,1,204,204,204,1,208,208,208,10,61,
  188,51,1,13,182,0,6,28,165,17,1,84,105,82,1,94,94,94,1,104,
  104,104,1,168,168,168,1,204,204,204,1,208,208,208,11,61,188,51,1,13,
  182,0,5,40,153,31,1,91,98,90,1,95,95,95,1,113,113,113,1,182,
  182,182,1,206,206,206,1,208,208,208,12,61,188,51,1,13,182,0,3,13,
  181,0,1,54,137,48,1,94,94,94,1,96,96,96,1,126,126,126,1,194,
  194,194,1,207,207,207,1,208,208,208,13,61,188,51,1,13,182,0,2,17,
  178,5,1,70,121,66,1,94,94,94,1,98,98,98,1,143,143,143,1,201,
  201,201,1,208,208,208,15,61,188,51,1,13,182,0,1,25,170,14,1,81,
  108,79,1,94,94,94,1,101,101,101,1,161,161,161,1,204,204,204,1,208,
  208,208,16,61,188,51,1,58,180,49,1,92,102,91,1,95,95,95,1,109,
  109,109,1,178,178,178,1,205,205,205,1,208,208,208,17,142,199,138,1,175,
  177,175,1,99,99,99,1,122,122,122,1,191,191,191,1,207,207,207,1,208,
  208,208,18,207,207,207,1,180,180,180,1,140,140,140,1,199,199,199,1,208,
  208,208,21,204,204,204,1,205,205,205,1,208,208,208,16,15,109,111,100,117,
  108,101,99,108,97,115,115,110,97,109,101,6,9,116,100,111,99,107,102,111,
  114,109,0,8,116,116,111,111,108,98,97,114,10,103,100,98,116,111,111,108,
  98,97,114,13,111,112,116,105,111,110,115,119,105,100,103,101,116,11,15,111,
  119,95,97,114,114,111,119,102,111,99,117,115,105,110,16,111,119,95,97,114,
  114,111,119,102,111,99,117,115,111,117,116,17,111,119,95,100,101,115,116,114,
  111,121,119,105,100,103,101,116,115,12,111,119,95,116,105,109,101,100,104,105,
  110,116,0,8,98,111,117,110,100,115,95,120,2,0,8,98,111,117,110,100,
  115,95,121,2,0,9,98,111,117,110,100,115,95,99,120,3,175,1,9,98,
  111,117,110,100,115,95,99,121,2,100,5,99,111,108,111,114,4,3,0,0,
  128,11,102,114,97,109,101,46,100,117,109,109,121,2,0,7,97,110,99,104,
  111,114,115,11,0,13,98,117,116,116,111,110,115,46,99,111,117,110,116,2,
  13,13,98,117,116,116,111,110,115,46,119,105,100,116,104,2,24,14,98,117,
  116,116,111,110,115,46,104,101,105,103,104,116,2,24,13,98,117,116,116,111,
  110,115,46,105,116,101,109,115,14,1,6,97,99,116,105,111,110,7,15,97,
  99,116,105,111,110,115,109,111,46,114,101,115,101,116,0,1,6,97,99,116,
  105,111,110,7,19,97,99,116,105,111,110,115,109,111,46,105,110,116,101,114,
  114,117,112,116,0,1,6,97,99,116,105,111,110,7,18,97,99,116,105,111,
  110,115,109,111,46,99,111,110,116,105,110,117,101,0,1,6,97,99,116,105,
  111,110,7,14,97,99,116,105,111,110,115,109,111,46,110,101,120,116,0,1,
  6,97,99,116,105,111,110,7,14,97,99,116,105,111,110,115,109,111,46,115,
  116,101,112,0,1,6,97,99,116,105,111,110,7,16,97,99,116,105,111,110,
  115,109,111,46,102,105,110,105,115,104,0,1,7,111,112,116,105,111,110,115,
  11,13,109,97,111,95,115,101,112,97,114,97,116,111,114,0,0,1,4,104,
  105,110,116,6,16,78,101,120,116,32,105,110,115,116,114,117,99,116,105,111,
  110,6,97,99,116,105,111,110,7,15,97,99,116,105,111,110,115,109,111,46,
  110,101,120,116,105,5,115,116,97,116,101,11,12,97,115,95,108,111,99,97,
  108,104,105,110,116,0,0,1,4,104,105,110,116,6,16,83,116,101,112,32,
  105,110,115,116,114,117,99,116,105,111,110,6,97,99,116,105,111,110,7,15,
  97,99,116,105,111,110,115,109,111,46,115,116,101,112,105,5,115,116,97,116,
  101,11,12,97,115,95,108,111,99,97,108,104,105,110,116,0,0,1,7,111,
  112,116,105,111,110,115,11,13,109,97,111,95,115,101,112,97,114,97,116,111,
  114,0,0,1,6,97,99,116,105,111,110,7,20,97,99,116,105,111,110,115,
  109,111,46,98,107,112,116,115,111,110,97,99,116,5,115,116,97,116,101,11,
  10,97,115,95,99,104,101,99,107,101,100,0,7,111,112,116,105,111,110,115,
  11,12,109,97,111,95,99,104,101,99,107,98,111,120,0,0,1,6,97,99,
  116,105,111,110,7,22,97,99,116,105,111,110,115,109,111,46,119,97,116,99,
  104,101,115,111,110,97,99,116,5,115,116,97,116,101,11,10,97,115,95,99,
  104,101,99,107,101,100,0,7,111,112,116,105,111,110,115,11,12,109,97,111,
  95,99,104,101,99,107,98,111,120,0,0,1,6,97,99,116,105,111,110,7,
  23,97,99,116,105,111,110,115,109,111,46,98,108,117,101,100,111,116,115,111,
  110,97,99,116,5,115,116,97,116,101,11,10,97,115,95,99,104,101,99,107,
  101,100,0,7,111,112,116,105,111,110,115,11,12,109,97,111,95,99,104,101,
  99,107,98,111,120,0,0,0,7,111,112,116,105,111,110,115,11,25,116,98,
  111,95,100,114,97,103,115,111,117,114,99,101,101,110,97,98,108,101,100,111,
  110,108,121,23,116,98,111,95,100,114,97,103,100,101,115,116,101,110,97,98,
  108,101,100,111,110,108,121,0,0,0,0)
 );

initialization
 registerobjectdata(@objdata,tdebuggerfo,'');
end.
