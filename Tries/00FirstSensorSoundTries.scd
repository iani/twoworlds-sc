
{ | v1 = 0.05 v2 = 0.05 v3 = 0.05 v4 = 0.05 v5 = 0.05 v6 = 0.05 v7 = 0.05 v8 = 0.05 |

	SinOsc.ar ((1..8) + 2 * 100, 0, [v1, v2, v3, v4, v5, v6, v7, v8])
	
} ++> \sinesensors;
//:
0.00001 +>.v1 \sinesensors;
//:
0.000001 +>.v2 \sinesensors;
//:
0.0000001 +>.v3 \sinesensors;
//:
0.0001 +>.v4 \sinesensors;
//:
0.01 +>.v5 \sinesensors;
//:
0.01 +>.v6 \sinesensors;
//:
0.01 +>.v7 \sinesensors;
//:
0.01 +>.v8 \sinesensors;
//:

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

	// gfl * 5 +>.v1 \sinesensors;
	0 +>.v1 \sinesensors;
	/// gbr / 10 +>.v4 \sinesensors;
	0 +>.v4 \sinesensors;
}, '/sensors', NetAddr ("192.168.8.111", 7000),
	recvPort: 57120).permanent_ (true);
