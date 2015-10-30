//:
~soundBuffers = Library.at (Server.default).keys.asArray.sort [1..];

(1..8) do: { | i |
var buf, bufnum;
buf = ~soundBuffers [i].buf;
bufnum = buf.bufnum;
buf.play;
};
//:
~soundBuffers = Library.at (Server.default).keys.asArray.sort [1..];

(1..8) do: { | i |
var buf, bufnum, player;
player = format ("s%", i).asSymbol;
buf = ~soundBuffers [i].buf;
bufnum = buf.bufnum;

i - 1 +>.channel player;
0.2 +>.vol player;
bufnum +>.buf player;

SF.playbuf ++> player;

};
//:
SF.playbuf ++> \s1;
//:

{ WhiteNoise.ar (0.01) } ++> \test1;

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
}, '/sensors',
	NetAddr ("192.168.8.111", 7000),
	recvPort: 57120
).permanent_ (true);
//:
4 do: { | rpi |
OSCdef (\rp1, { | msg |
	var gfl, gbr, voicepair, voice1, voice2;
	voicepair = rpi * 2;
	#voice1, voice2 = [voicepair, voicepair + 1] collect: { | i | format ("s%", i).asSymbol };
	#gbr, gfl = msg [1..];
	"This is from RPI ".post;
	(rpi + 1).postln;
	// msg.postln;
	[gfl, gbr].postln;
	#gfl, gbr = [gfl, gbr] + 500;
	// [gfl, gbr].postln;
	gfl = ~sensorMapper.unmap (gfl) / 10;
	gbr = ~sensorMapper.unmap (gbr) / 10;
	// [gfl, gbr].postln;
	
	gfl +>.vol voice1;
	// 0 +>.vol voice1;
	gbr +>.vol voice2;
	// 0 +>.vol voice2;
}, '/sensors',
	NetAddr (format ("192.168.8.11%", rpi + 1), 7000),
	recvPort: 57120
)}.permanent_ (true);
}
//: