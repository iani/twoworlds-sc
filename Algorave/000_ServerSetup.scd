
~nac = Server ('nac', NetAddr ("192.168.8.109", 57111));
//:
Server.default = ~nac;
//:
SynthDefLoader.server = ~nac;
//:
CmdPeriod.freeRemote = true;
//:

Synth ("test");

//:
{ WhiteNoise.ar (0.1) }.play;
//:
~nac.serverRunning;
//:
~nac.serverRunning = true;
~nac.serverRunning;
//:
{ WhiteNoise.ar (0.1)}.play;
//:
OSCFunc trace: false;
//:
NetAddr.localAddr;

//:


{ WhiteNoise.ar (0.1) } ++> \test;


//:



stop

//:


