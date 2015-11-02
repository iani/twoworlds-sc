
//: ================ STEREO TO MONO ================
~paths = "/Users/iani/Music/sounds/151030TwoWorlds/stereo/*".pathMatch;
//:
~pathsMono = ~paths collect: { | p | p.replace ("stereo", "mono")};
//:
~paths do: { | p, i |
	format ("sox % -c 1 % remix 1", p, ~pathsMono [i]).unixCmd;
};

//: ================ WAV to MP3 ================
~paths = "/Users/iani/Music/sounds/151030TwoWorlds/stereo/*".pathMatch;
//:
~pathsMp3 = ~paths collect: { | p | p.replace ("stereo", "mp3")};
//:
{
	~paths do: { | p, i |
		format ("lame % %", p, ~pathsMp3 [i].replace ("wav", "mp3")).unixCmd;
		5.wait;
	}
}.fork;