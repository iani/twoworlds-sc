//:
OSCFunc trace: true;
//:
OSCFunc trace: false;
//:
~sensorMapper = ControlSpec (200.0, 900.0, \linear, 0);
//:
OSCdef (\rp1, { | msg |
	var gfl, gbr;
	#gbr, gfl = msg [1..];
	// "This is from RPI 1".postln;
	// msg.postln;
	[gfl, gbr].postln;
	#gfl, gbr = [gfl, gbr] + 500;
	// [gfl, gbr].postln;
	gfl = ~sensorMapper.unmap (gfl) / 10;
	gbr = ~sensorMapper.unmap (gbr) / 10;
	// [gfl, gbr].postln;

	gfl * 5 +>.v1 \sinesensors;
	gfl / 10 +>.v4 \sinesensors;
	
}, '/sensors', NetAddr ("192.168.8.111", 7000),
	recvPort: 57120).permanent_ (true);
//:
OSCdef (\rp1, { | ... args |
	"This is from RPI 2".postln;
	args.postln;
}, '/sensors', NetAddr ("192.168.8.112", 7000), recvPort: 57120);
//:
OSCdef (\rp1, { | ... args |
	"This is from RPI 3".postln;
	args.postln;
}, '/sensors', NetAddr ("192.168.8.113", 7000), recvPort: 57120);
//:
OSCdef (\rp1, { | ... args |
	"This is from RPI 4".postln;
	args.postln;
}, '/sensors', NetAddr ("192.168.8.114", 7000), recvPort: 57120);
//:
/*
OSCFunc ({ | ... args |
	"This is from RPI".postln;
	args.postln;
}, '/sensors', recvPort: 57120);
*/
//:
