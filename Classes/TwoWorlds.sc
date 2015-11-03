TwoWorlds {
	classvar <players, <>reordered_players;
	classvar <>verbosepis;
	classvar <soundChangerRoutine, keywordPollingRoutine;

	*initClass {
		StartUp add: {
			// this.init;
		}
	}
	*init {
		//		Server.default.options.outputStreamsEnabled = "0100";]]

		players = (1..8) collect: format("s%", _);
		reordered_players = [\s1, \s4, \s3, \s2, \s8, \s5, \s6, \s7];
		verbosepis = true ! 4;
		// reordered_players = players;
		Server.default.options.numOutputBusChannels = 10;
		Server.default.meter;
		BufferList.loadFolder;
	}

	*startserver {
		if (Server.default.serverRunning.not) {
				Server.default.boot;
		};
	}

	*startsounds {
		var soundBuffers;
		soundBuffers = Library.at (Server.default).keys.asArray.sort;

		(1..8) do: { | i |
			var buf, bufnum, player;
			player = format ("s%", i).asSymbol;
			buf = soundBuffers [i + 4].buf;
			bufnum = buf.bufnum;

			i - 1 +>.channel player;
			0.02 +>.vol player;
			bufnum +>.buf player;
			1 +>.loop player;
			SF.playbuf ++> player;
		};
		2.0 +>.vollag \s6;
		2.0 +>.vollag \s7;
	}

	*silencesounds {
		players do: { | p | 0 +>.vol p };
	}

	*auditsounds { | vol = 0.1 |
	//		players do: { | p | vol +>.vol p; p.postln; };

		vol +>.vol \s1;
		vol +>.vol \s2;
		vol +>.vol \s3;
		vol +>.vol \s4;
		vol +>.vol \s5;
		vol +>.vol \s6;
		vol +>.vol \s7;
		vol +>.vol \s8;
	}

	*turnoffsounds {
			players do: _.release;
	}

	*changeSoundsAlgorithmically {
		var bufnums = Library.at(Server.default).keys.asArray.sort[1..].collect({ | b | b.buf.bufnum });
		if (soundChangerRoutine.notNil) { soundChangerRoutine.stop };
		soundChangerRoutine = {
			loop {
				10.rrand(60).wait;
				bufnums.scramble[..7] do: { | bufnum, i |
					bufnum +>.buf [\s1, \s2, \s3, \s4, \s5, \s6, \s7, \s8][i];
				}
			}
		}.fork
	}

*startsensors {
		var sensorMapper;
		sensorMapper = ControlSpec (200.0, 900.0, \lin);
		4 do: { | rpi |
			OSCdef (format ("rp%", rpi + 1).asSymbol,
				{ | msg |
					var gfl, gbr, voicepair, voice1, voice2;
					voicepair = rpi * 2;
					/*
					#voice1, voice2 = [voicepair, voicepair + 1]
					collect: { | i | format ("s%", i + 1).asSymbol };
					*/

					voice1 = reordered_players[voicepair];
					voice2 = reordered_players[voicepair + 1];
					#gbr, gfl = msg [1..];
					if (verbosepis[rpi])  {
						"This is from RPI ".post;
						(rpi + 1).postln;
						[gfl, gbr].postln;
					};
					// msg.postln;

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
	}

	*test1 {
//:
		{ SinOsc.ar ((1..10) + 2 * 100,
			0,
			Decay.kr (Impulse.kr (0.1, (1..10) / 10 / pi * 4, 0.1))
		)
		} ++> \test;
//:
	}
}