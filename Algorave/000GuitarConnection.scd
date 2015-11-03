
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
{ | vol = 1 | In.ar (8) * vol ! 1 } ++> \guitar;
//:
{ | vol = 1 | In.ar (8) * vol * 2 ! 8 } ++> \guitar;
//:
{ | vol = 1 | In.ar (8) * vol * 2 ! 8 } ++> \guitar;

//:
{ | vol = 0.2 | Resonz.ar (In.ar (8), 3000, 0.01) * vol * 2 ! 8 } ++> \guitar;
//:
{ | vol = 2 | In.ar (8) * {LFNoise1.kr (1).range (0.1, 1.5)} ! 8 } ++> \guitar;
//:
{ | vol = 1 | In.ar (10) * LFNoise1.kr (10).range (0.1, 1.5) ! 8 } ++> \guitar;
//:
{ | vol = 1 | In.ar (10) *
	{LFNoise1.kr (0.5).range (0.5, 2.5)} ! 8

} ++> \guitar;
//:
{ | vol = 1, q = 0.1 |
	var src;
	src = In.ar (10) * vol * 4;
	{Resonz.ar (src, 400, q)} ! 8;
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