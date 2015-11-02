
//: Guitar connection

{ | vol = 1 | Out.ar (100, (In.ar (10) * vol).dup) } ++> \guitar;

//:

{ | vol = 1 | Out.ar (0, (In.ar (10) * vol).dup) } ++> \guitar;

//:


//:

{ Out.ar (3, In.ar (100) ) } ++> \guitarSrc;

//:
\guitarSrc.synthPlayer.output.moveAfter (\guitar.synthPlayer.output);
//:
"guitar[guitarSrc.guitarFx]".arlink;
//:
{ | vol = 1 | In.ar (10) * vol ! 8 } ++> \guitar;
//:
{ | vol = 1 | In.ar (10) * LFNoise1.kr (10).range (0, vol * 5) ! 8 } ++> \guitar;
//:
{ | vol = 1, q = 0.1 |
	var src;
	src = In.ar (10) * vol;
	Resonz.ar (src, 400, q);
} ++> \guitar;
//:
{ | vol = 1, q = 0.1 |
	var src;
	src = In.ar (10) * vol;
	Resonz.ar (src, { LFNoise0.kr (15).range (400, 4000) } ! 8, q);
} ++> \guitar;
//:
{ | vol = 1, q = 0.1 |
	var src;
	src = In.ar (10) * vol;
	Resonz.ar (src, { LFNoise0.kr (1).range (400, 4000) } ! 8, q);
} ++> \guitar;
//:
{ | vol = 1, q = 0.1 |
	var src;
	src = In.ar (10) * vol;
	Resonz.ar (src, { LFNoise0.kr (1).range (400, 4000) } ! 8,
		LFNoise0.kr (5).range (0.01, 0.001)
	);
} ++> \guitar;
//:
{ | vol = 1, q = 0.1 |
	var src;
	src = In.ar (10) * vol;
	Resonz.ar (src, { LFNoise2.kr (1).range (100, 400) } ! 8,
		LFNoise0.kr (5).range (0.01, 0.001)
	);
} ++> \guitar;
//:

0.005 +>.q \guitar;

//:

20 +>.vol \guitar;

//:

BufferList.loadFolder;

//:
Library.at (Server.default).keys.asArray.asCompileString;

//:

'Catholic_Church'.buf.play;


'Nepal_afraid'.buf.play;

'Magazi_Speech_for_Housing'.buf.play;

 'Pakistani_Playing_Cricket'.buf.play;