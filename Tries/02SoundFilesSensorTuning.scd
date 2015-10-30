//:
~soundBuffers = Library.at (Server.default).keys.asArray.sort [1..];

(1..8) do: { | i |
var buf, bufnum;
buf = ~soundBuffers [i].buf;
bufnum = buf.bufnum;
buf.play;
};
//:
~soundBuffers = Library.at (Server.default).keys.asArray.sort;

(1..8) do: { | i |
var buf, bufnum, player;
player = format ("s%", i).asSymbol;
buf = ~soundBuffers [i + 12].buf;
bufnum = buf.bufnum;

i - 1 +>.channel player;
0.00002 +>.vol player;
bufnum +>.buf player;
1 +>.loop player;

SF.playbuf ++> player;

};
//:
SF.playbuf ++> \s1;
//:

{ WhiteNoise.ar (0.01) } ++> \test1;

//:
~sensorMapper = ControlSpec (200.0, 900.0, \lin);
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
}, '/sensors',
	NetAddr ("192.168.8.111", 7000),
	recvPort: 57120
)
// .permanent_ (true);
//:
var sensorMapper;
sensorMapper = ControlSpec (200.0, 900.0, \lin);
4 do: { | rpi |
	OSCdef (format ("rp%", rpi + 1).asSymbol,
		{ | msg |
			var gfl, gbr, voicepair, voice1, voice2;
			voicepair = rpi * 2;
			#voice1, voice2 = [voicepair, voicepair + 1]
			collect: { | i | format ("s%", i + 1).asSymbol };
			#gbr, gfl = msg [1..];
			"This is from RPI ".post;
			(rpi + 1).postln;
			// msg.postln;
			[gfl, gbr].postln;
			//	#gfl, gbr = [gfl, gbr] + 500;
			// [gfl, gbr].postln;
			gfl = sensorMapper.unmap (gfl);
			gbr = sensorMapper.unmap (gbr);
			// [gfl, gbr].postln;
			
			gfl +>.vol voice1;
			// 0 +>.vol voice1;
			gbr +>.vol voice2;
			// 0 +>.vol voice2;
		}, '/sensors',
		NetAddr (format ("192.168.8.11%", rpi + 1), 7000),
		recvPort: 57120
	).enable;
	// .permanent_ (true);
}
//:
var sensorMapper, rpi;
rpi = 0;
sensorMapper = ControlSpec (200.0, 900.0, \lin);
OSCdef (format ("rp%", rpi + 1).asSymbol,
	{ | msg |
		var gfl, gbr, voicepair, voice1, voice2;
		voicepair = rpi * 2;
		#voice1, voice2 = [voicepair, voicepair + 1]
		collect: { | i | format ("s%", i).asSymbol };
		#gbr, gfl = msg [1..];
		"This is from RPI ".post;
		(rpi + 1).postln;
		// msg.postln;
		[gfl, gbr].postln;
		//	#gfl, gbr = [gfl, gbr] + 500;
		// [gfl, gbr].postln;
		gfl = sensorMapper.unmap (gfl);
		gbr = sensorMapper.unmap (gbr);
		// [gfl, gbr].postln;
		
		gfl * 10 +>.vol voice1;
		// 0 +>.vol voice1;
		gbr * 10 +>.vol voice2;
		// 0 +>.vol voice2;
		[gfl * 10, voice1, gbr * 10, voice2].postln;
	}, '/sensors',
	NetAddr (format ("192.168.8.11%", rpi + 1), 7000),
	recvPort: 57120
).enable;
// .permanent_ (true);

//:

OSCdef (\rp1).enable;
//:

OSCdef (\rp1).disable;
//:

OSCdef (\rp2).disable;
//:

OSCdef (\rp3).disable;

//:

OSCdef (\rp3).enable;

//:

OSCdef (\rp4).disable;

//:

OSCdef (\rp4).enable;

//:

OSCdef (\rp1).enable;
//:

OSCdef (\rp2).enable;
//:

OSCdef (\rp3).enable;

//:

OSCdef (\rp4).enable;

//:
0.0 +>.vol \s1;
//:
0.0 +>.vol \s2;
//:
0.0 +>.vol \s3;
//:
0.5 +>.vol \s3;
//:
0.0 +>.vol \s4;
//:
0.5 +>.vol \s4;
//:
0 +>.vol \s5;
//:
0.5 +>.vol \s5;
//:
0 +>.vol \s6;
//:
0.5 +>.vol \s6;
//:
0 +>.vol \s7;
//:
0.7 +>.vol \s7;
//:
0.5 +>.vol \s8;

//:
0.0 +>.vol \s8;

//:
0 +>vol \s1;

