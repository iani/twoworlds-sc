


//:
{ SinOsc.ar ((1..10) + 2 * 100,
	0,
	Decay.kr (Impulse.kr (0.1, (1..10) / 10 / pi * 4, 0.09))
)
} ++> \test;
//:
{ SinOsc.ar ((1..10).reverse + 2 * 100,
	0,
	Decay.kr (Impulse.kr (0.1, (1..10) / 10 / pi * 2, 0.02))
)
} ++> \test2;
//:
{ SinOsc.ar ((1..10) + 3 * 100,
	0,
	Decay.kr (Impulse.kr (0.1, (1..10) / 10 / pi * 1, 0.02))
)
} ++> \test3;
//:
{ SinOsc.ar ((1..10) ++ (10..1)+ 4 * 100,
	0,
	Decay.kr (Impulse.kr (0.1, (1..10) / 10 / pi * 0.5, 0.1))
).flop collect: { | a | Mix (a) }
} ++> \test4;
//: ================================================================

{ SinOsc.ar ((1..10) + LFNoise0.kr (5).range (1.5, 2) * 100,
	0,
	Decay.kr (Impulse.kr (0.1, (1..10) / 10 / pi * 4,
		LFNoise1.kr (0.2).range (0.005, 0.02)
	))
)
} ++> \test;
//:
{ SinOsc.ar ((1..10).reverse + LFNoise0.kr (0.2).range (1.5, 2) * 100,
	0,
	Decay.kr (Impulse.kr (0.1, (1..10) / 10 / pi * 2,
		LFNoise1.kr (0.2).range (0.005, 0.02)
	))
)
} ++> \test2;
//:
{ SinOsc.ar ((1..10) + LFNoise0.kr (0.2).range (2.5, 3) * 100,
	0,
	Decay.kr (Impulse.kr (0.1, (1..10) / 10 / pi * 1,
		LFNoise1.kr (0.2).range (0.005, 0.02)
	))
)
} ++> \test3;
//:
{ SinOsc.ar ((1..10) ++ (10..1)+ LFNoise0.kr (0.2).range (3, 4)  * 100,
	0,
	Decay.kr (Impulse.kr (0.1, (1..10) / 10 / pi * 0.5,
		LFNoise1.kr (0.2).range (0.005, 0.02)
	))
).flop collect: { | a | Mix (a) }
} ++> \test4;