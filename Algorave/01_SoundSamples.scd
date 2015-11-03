//:
var folder, files, file;
folder = Platform.userAppSupportDir.replace ("iani", "twoworlds") +/+ "sounds/";
files = [
'Construction_Mixer_Small'.asString ++ ".wav",
'Customer_Punks'.asString ++ ".wav",
'Employee_BacktoTheirCountries'.asString ++ ".wav",
'Forest'.asString ++ ".wav",
'Forest_leaves'.asString ++ ".wav",
'Fridge'.asString ++ ".wav",
'GC_PlayingCards'.asString ++ ".wav",
'Ghana_problems'.asString ++ ".wav",
'Haircut_Machine'.asString ++ ".wav",
'Kurd_baglama'.asString ++ ".wav",
'Kurdish_makingTea'.asString ++ ".wav",
'Kurdish_win'.asString ++ ".wav",
'Magazi_Speech_Foreigners'.asString ++ ".wav",
'Magazi_Speech_for_Housing'.asString ++ ".wav",
'Muslims_Eating'.asString ++ ".wav",
'Nepal_afraid'.asString ++ ".wav",
'Pakistani_Playing_Cricket'.asString ++ ".wav",
'Papas_Planodioi'.asString ++ ".wav",
'Philippines_Karaoke'.asString ++ ".wav",
'Philippines_Party_Out1'.asString ++ ".wav",
'Philippines_Party_Out2'.asString ++ ".wav",
'Philippines_Talking1'.asString ++ ".wav",
'Polish_kultur'.asString ++ ".wav",
'Pontiacs_Chatting_Noisy'.asString ++ ".wav",
'Syria_soundOftheBomb'.asString ++ ".wav",
'TC_PlayingCards'.asString ++ ".wav",
'TC_nooneleft'.asString ++ ".wav",
'Truck_incar'.asString ++ ".wav",
'construction1'.asString ++ ".wav",
'construction2'.asString ++ ".wav",
'haircut1'.asString ++ ".wav",
'haircut2'.asString ++ ".wav",
'halloumi1_distantVehicle'.asString ++ ".wav",
'halloumi2'.asString ++ ".wav",
'halloumi3_onsalt'.asString ++ ".wav",
'hodjawithnoise'.asString ++ ".wav",
'maronites_hymn'.asString ++ ".wav",
'maronites_hymn2'.asString ++ ".wav",
'muslims_hymn_mobile'.asString ++ ".wav",
'philippines_pray'.asString ++ ".wav",
'romaSing_Kormakiti'.asString ++ ".wav",
'talk1'.asString ++ ".wav",
'talk2_pelop'.asString ++ ".wav",
'tourist_zone'.asString ++ ".wav"
];

// file = files.first;
files do: { | file |
	file = folder ++ file;
	Library.put(Server.default, PathName (file).fileNameWithoutExtension.asSymbol,
		BufferDummy(file);
	);
}
//:
BufferList.initBuffers

//:
Library.at (Server.default);


//:

1 +>.vol \s6;

//:
Library.at (Server.default).keys.asArray.sort [2].buf.bufnum;
//:
88 +>.buf \sound1;
 
{ | buf = 0, rate = 1, trigger = 0, startPos = 0, loop = 0,
			doneAction = 2, vol = 0.2, channel = 0, gate = 1, vollag = 0.01 |
			var src, env, envgen;
			src = PlayBuf.ar(1, buf, rate * BufRateScale.kr(buf),
				trigger, startPos * BufSampleRate.kr (buf),
				loop, doneAction
			);
			env = Env ([0, 1, 0], [0.01, 0.01], releaseNode: 1);
			envgen = EnvGen.kr (env, gate, doneAction: 2);
			Out.ar (channel, src * Lag.kr(vol, vollag) * envgen);
} ++> \sound1;
//:


//:

BufferList.server;
//:
var soundBuffers;
soundBuffers = Library.at (Server.default).keys.asArray.sort;

(1..8) do: { | i |
var buf, bufnum, player;
player = format ("s%", i).asSymbol;
buf = soundBuffers [i + 4].buf;
buf = soundBuffers.choose;
bufnum = buf.bufnum;

i - 1 +>.channel player;
0.02 exprand: 0.06945 +>.vol player;
bufnum +>.buf player;
1 +>.loop player;
SF.playbuf ++> player;
};
2.0 +>.vollag \s6;
2.0 +>.vollag \s7;


//:
\s1 release: 5;

//:
\s2 release: 5;

//:
\s8 release: 5;

//:
\s3 release: 5;

//:
\s4 release: 5;

//:
\s5 release: 5;

//:
\s6 release: 5;


//:
\s7 release: 5;
 

//:
\s6 release: 5;

//:
r = {
	loop {
		
	}
	
}.fork;

//:
Library.at (Server.default).values.asArray.first.inspect;

//:
Buffer
//:
'Construction_Mixer_Small'.buf.bufnum +>.buf +> \s1;
//:
0.004 +>.vol \s1;
//:
'Customer_Punks'
'Employee_BacktoTheirCountries'
'Forest'
'Forest_leaves'
'Fridge'
'GC_PlayingCards'
'Ghana_problems'
'Haircut_Machine'
'Kurd_baglama'
'Kurdish_makingTea'
'Kurdish_win'
'Magazi_Speech_Foreigners'
'Magazi_Speech_for_Housing'
'Muslims_Eating'
'Nepal_afraid'
'Pakistani_Playing_Cricket'
'Papas_Planodioi'
'Philippines_Karaoke'
'Philippines_Party_Out1'
'Philippines_Party_Out2'
'Philippines_Talking1'
'Polish_kultur'
'Pontiacs_Chatting_Noisy'
'Syria_soundOftheBomb'
'TC_PlayingCards'
'TC_nooneleft'
'Truck_incar'
'construction1'
'construction2'
'haircut1'
'haircut2'
'halloumi1_distantVehicle'
'halloumi2'
'halloumi3_onsalt'
'hodjawithnoise'
'maronites_hymn'
'maronites_hymn2'
'muslims_hymn_mobile'
'philippines_pray'
'romaSing_Kormakiti'
'talk1'
'talk2_pelop'
'tourist_zone'
//:
'Catholic_Church'
'Construction_Mixer_Small'
'Customer_Punks'
'Employee_BacktoTheirCountries'
'Forest'
'Forest_leaves'
'Fridge'
'GC_PlayingCards'
'Ghana_problems'
'Haircut_Machine'
'Kurd_baglama'
'Kurdish_makingTea'
'Kurdish_win'
'Magazi_Speech_Foreigners'
'Magazi_Speech_for_Housing'
'Muslims_Eating'
'Nepal_afraid'
'Pakistani_Playing_Cricket'
'Papas_Planodioi'
'Philippines_Karaoke'
'Philippines_Party_Out1'
'Philippines_Party_Out2'
'Philippines_Talking1'
'Polish_kultur'
'Pontiacs_Chatting_Noisy'
'Syria_soundOftheBomb'
'TC_PlayingCards'
'TC_nooneleft'
'Truck_incar'
'construction1'
'construction2'
'haircut1'
'haircut2'
'halloumi1_distantVehicle'
'halloumi2'
'halloumi3_onsalt'
'hodjawithnoise'
'maronites_hymn'
'maronites_hymn2'
'muslims_hymn_mobile'
'philippines_pray'
'romaSing_Kormakiti'
'talk1'
'talk2_pelop'
'tourist_zone'
//:
