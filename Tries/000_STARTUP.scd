
TwoWorlds.startserver;
TwoWorlds.startsounds;
TwoWorlds.startsensors;

//:


0.9 +>.vol \s1;



TwoWorlds.auditsounds(0.1);

TwoWorlds.changeSoundsAlgorithmically;

//:
/*
TwoWorlds.reordered_players = [\s1, \s4, \s3, \s2, \s8, \s5, \s6, \s7];
*/

TwoWorlds.verbosepis = [false, false, false, true];


\s6.synthPlayer.inspect

2.0 +>.vollag \s6;
2.0 +>.vollag \s7;

