TwoWorlds {
	*initClass {
		StartUp add: {
			this.init;
		}
	}
	*init {
		//		Server.default.options.outputStreamsEnabled = "0100";
		Server.default.options.numOutputBusChannels = 10;
		Server.default.boot;
		Server.default.meter;
		BufferList.loadFolder;
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