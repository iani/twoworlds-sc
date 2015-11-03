/*
1. Intro: Thalassa : (Noise)
2. Enter Reza poiima letter to beloved
-  Fadeout Thalassa
2. Pinelo: Hasan: Ftiachno skinika - mila gia tin douleia tou : 
-  HasanSong: Ekei pou ftiachnei grammes dromou na mpei to nanourisma
-  Fadeout Hasan Song: Hasan sings solo on mike
-  Aydim: Milaei gia tin taxi pou echei mathei ta ellinika tou kai pos pige parisi kai gyrise.
-  Techno disco: tickly
4. Lefteris: Mama, poreia, choros (tickly synecheia)
5. Finale: Tragoudi reza. + 
	+ multi voice Blip (from tiny-sc)
*/

Scenes.init;
Server.default.meter;
//:
Scenes.start;
//:
2 +>.fadeTime \thalassa;
2 +>.fadeTime \thalassa2;
//:
{ WhiteNoise.ar ([0.01, 0.01]) } ++> \thalassa;
{ WhiteNoise.ar ([0.05, 0.05]) } ++> \thalassa;
{ WhiteNoise.ar ([0.1, 0.1]) } ++> \thalassa;
{ PinkNoise.ar ([0.09, 0.09]) } ++> \thalassa;
{ BrownNoise.ar ([0.09, 0.09]) } ++> \thalassa;
{ GrayNoise.ar ([0.09, 0.09]) } ++> \thalassa;
{ GrayNoise.ar (LFNoise0.kr (1).range (0.01, 0.1).dup) } ++> \thalassa;
{ GrayNoise.ar (LFNoise0.kr (1).range (0.01, 0.1).dup) } ++> \thalassa;
{ PinkNoise.ar (LFNoise1.kr (0.5).range (0.01, 0.2).dup) } ++> \thalassa;
{ BrownNoise.ar (LFNoise1.kr (1.5).range (0.01, 0.04).dup) } ++> \thalassa2;
//:
{ BrownNoise.ar (LFNoise1.kr (5.5).range (0.01, 0.04).dup) } ++> \thalassa2;

//:
{ Resonz.ar (
	BrownNoise.ar (Decay2.kr (Dust.kr (4), 0.3, 1)),
	LFNoise0.kr ([15, 15]).range (1500, 5000),
	2
) } ++> \thalassa2;

//:
{ Resonz.ar (
	0.15 *
	PinkNoise.ar (Decay2.kr (Dust.kr (10), 0.3, 1)),
	LFNoise2.kr ([15, 15]).range (1000, 14000),
    4
) } ++> \thalassa;

//:
\thalassa release: 10;
\thalassa2 release: 5;
//:
'pinelo'.bufnum +>.buf \hasanpinelo;
1 +>.loop 'hasanpinelo';
1 +>.vol \hasanpinelo;
SF.playbufpan ++> \hasanpinelo;
//:
0.8 +>.vol \hasanpinelo;
0.5 +>.vol \hasanpinelo;
0.3 +>.vol \hasanpinelo;
0.1 +>.vol \hasanpinelo;
5 +>.vol \hasanpinelo;
2 +>.vol \hasanpinelo;
//:
HasanSong.plain;
//:
\hasansong release: 7;
//:
\hasanpinelo release: 8;

//:  AYDIM ////////////////////////////////////////////////////////////////

//:
"tickly".arlink;
//:
{ | vol = 0.1 |
	b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([2, 1]),
		PinkNoise.ar)*437),0.1,0.01)
	* vol;
} ++> \tickly;
//:
0.4 +>.vol \tickly;
//:
0.2 +>.vol \tickly;
//:
0.1 +>.vol \tickly;
//:
0.05 +>.vol \tickly;
//:
// "tickly".arlink;
{ | vol = 0.1 |
	b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([3, 2]),
		PinkNoise.ar)*437),0.1,0.01)
	* vol;
} ++> \tickly;

//:
// "tickly".arlink;
{ | vol = 0.1 |
	b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([3, 2]),
		PinkNoise.ar)*437 / 3), 0.2, LFNoise1.kr ())
	* vol;
} ++> \tickly;

//:
0.5 +>.vol \tickly;
//:
{ | vol = 0.1 |
	b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([8, 4]),
		PinkNoise.ar)*437),0.1,0.01)
	* vol;
} ++> \tickly;
//:
{ | vol = 0.1 |
	b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([8, 4]),
		PinkNoise.ar)* 437 * 2),0.1,0.01)
	* vol;
} ++> \tickly;
//:
{ | vol = 0.1 |
	b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([8, 4]),
		PinkNoise.ar)* 437 * 0.2),0.1,0.01)
	* vol;
} ++> \tickly;
//:
{ | vol = 0.1 |
	b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([8, 4]),
		PinkNoise.ar)*
		[500, 1000] ),
		0.1,
		LFNoise1.kr(0.5).range(0.01, 0.5))
	* vol;
} ++> \tickly;
//:
{ | vol = 0.1 |
	b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([8, 6]),
		PinkNoise.ar)*
		[500, 1000] ),
		0.1,
		LFNoise1.kr(0.5).range(0.01, 0.5))
	* vol
} ++> \tickly;
//:
{ | vol = 0.1 |
	b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([4, 2]),
		PinkNoise.ar)*
		[500, 1000] ),
		0.1,
		LFNoise1.kr(0.5).range(0.01, 0.5))
	* vol
} ++> \tickly;
//:
{ | vol = 0.1 |
	b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([3, 2]),
		PinkNoise.ar)*
		[500, 1000] ),
		0.1,
		LFNoise1.kr(0.5).range(0.01, 0.5))
	* vol
} ++> \tickly;
//:
{ | vol = 0.1 |
	b=SinOsc;
	AllpassC.ar(a=b.ar(PulseCount.ar(
		Impulse.ar([1, 2]),
		PinkNoise.ar)*
		[500, 1000] ),
		0.1,
		LFNoise1.kr(0.5).range(0.01, 0.5))
	* vol
} ++> \tickly;
//:
{ | vol = 0.1 |
	b=SinOsc;
	AllpassC.ar(a=b.ar(
		PulseCount.ar(
			Impulse.ar([10, 20]),
			PinkNoise.ar)*
		[500, 1000] ),
		0.1,
		LFNoise1.kr(0.5).range(0.001, 0.005))
	* vol
} ++> \tickly;
//:
\tickly release: 5;

0.4 +>.vol \tickly;
0.2 +>.vol \tickly;
0.1 +>.vol \tickly;
0.05 +>.vol \tickly;

//:
"(tickly.lpf)".arlink;
{ | vol = 0.7 | Resonz.ar(Inp.ar, [500, 1000], 0.1) * 10 * vol
} ++> \lpf;
{ var b;
	b=SinOsc;Pan2.ar(AllpassC.ar(a=b.ar(
		PulseCount.ar(Impulse.ar(3),PinkNoise.ar)*437
	),0.1,0.01),b.ar(79*b.ar(1/1).abs/a))
} ++> \tickly;

//:

{ | vol = 1 |
	Resonz.ar(Inp.ar, [500, 1000] *
		LFNoise0.kr (5).range (1, 2), 0.1) * 10 * vol
} ++> \lpf;

//: LEFTERIS ////////////////////////////////////////////////////////////////

// version 1
Levteris.start;

Levteris.dance;

Levteris.noiseresonz;

1.5 +>.vol \lpf;
0.5 +>.vol \lpf;

3 +>.vol \lpf;
\levteris release: 5;
\lpf release: 5;
\tickly release: 3;


\m1 release: 5;
// version 2

//:
"([m1.m2.m3.m4][rm1.rm2.rm3]pm1)".arlink;
{ | vol = 0.5 pos = 0 width = 0.8 |
	var src;
	src = Mix (Resonz.ar (Inp.ar, 100 * [1, 1.2, 1.25, 1.8, 2, 3],
		XLine.kr (1, 0.0005, 30)))
	* XLine.kr (1, 15, 60);
	//	PanAz.ar (43, src * vol, pos, 1, width * 43 + 2);
	src;
} ++> \rm1;
{ | vol = 0.5 pos = 0 width = 0.8 |
	var src;
	src = Inp.ar;
	Pan2.ar (src * vol, Lag.kr (pos, 0.5));
} ++> \pm1;
\levteris_speaks.bufnum +>.buf \m1;
273.8 +>.startPos \m1;
1 +>.rate \m1;
1 +>.loop \m1;
SF.playbuf ++> \m1;
//:
2 +>.vol \m1;

//:
2 +>.vol \pm1;
//:

3 +>.fadeTime \rm1;
3 +>.fadeTime \rm2;
3 +>.fadeTime \rm3;
1 +>.fadeTime \pm1;		

//:
{ | vol = 1 |
	 Mix (Resonz.ar (Inp.ar, 150 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		 0.001))
	 * vol * 10
} ++> \rm1;
//:

{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 200 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.001))
	* vol * 10
} ++> \rm1;
//:
{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 250 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0001))
	* vol * 10
} ++> \rm1;
//:

{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 300 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0001))
	* vol * 10
} ++> \rm1;

//:
{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 1000 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0001))
	* vol * 10
} ++> \rm1;
//:

{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 90 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0005))
	* vol * 10

} ++> \rm1

//:
{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 50 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0005))
	* vol * 10

} ++> \rm1
//: *r1_25 
{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 25 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0005))
	* vol * 10
	
} ++> \rm1

//: *r1_25cluster

{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 25 * (1, 1.1 .. 3),
		0.0005))
	* vol * 20
	
} ++> \rm1
//:

{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 250 * (1, 1.1 .. 3),
		0.0005))
	* vol * 2
	
} ++> \rm1
//: *r1_1000cluster
{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 1000 * (1, 1.1 .. 3),
		0.0005))
	* vol * 2
	
} ++> \rm1
//: *r1_2500cluster

{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 2500 * (1, 1.1 .. 3),
		0.0005))
	* vol * 2
	
} ++> \rm1
//: *r1_2500gliss 

{| vol = 1, dur = 5 |
	Mix (Resonz.ar (Inp.ar,

		XLine.kr (50, 2500, dur)

		* (1, 1.1 .. 3),
		0.0005))
	* vol * 2
} ++> \rm1

//: *r1_rgliss | dur = 5 |
{| vol = 1 dur = 5 |
	Mix (Resonz.ar (Inp.ar,
		XLine.kr (50 rrand: 2500, 50 rrand: 2500, dur)
		* [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0005))
	* vol * 5
} ++> \rm1

//:
\eisitirio.bufnum +>.buf \m1;

//: *r1_noise0
{| vol = 1, lo = 100, hi = 120, rate = 20 |
	Mix (Resonz.ar (Inp.ar,
		LFNoise0.kr (rate).range (lo, hi)
		* [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0005))
	* vol * 10
} ++> \rm1

//: *r1_noise1
{| vol = 1 lo = 100 hi = 120 rate = 20 |
	Mix (Resonz.ar (Inp.ar,
		LFNoise1.kr (rate).range (lo, hi)
		* [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0005))
	* vol * 10
} ++> \rm1
//: *r1_0
{ | vol = 1 |
	Mix (Resonz.ar (Inp.ar, 150 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
    0.1

	)) * 1
	
} ++> \rm1;

//: *r2_150
{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 150 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0001))
	* vol * 10
} ++> \rm2;

//: r2_200
{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 200 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0001))
	* vol * 10
} ++> \rm2;
//: *r2_250
{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 250 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0001))
	* vol * 10
} ++> \rm2;
//: *r2_300
{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 300 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0001))
	* vol * 10
} ++> \rm2;


*r2_1000 {
	{| vol = 1 |
		Mix (Resonz.ar (Inp.ar, 1000 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0001))
		* vol * 10
	} ++> \rm2;
}

*r2_90 {{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 90 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0005))
	* vol * 10

} ++> \rm2
}
//:
*r2_50 {{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 50 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		0.0005))
	* vol * 10

} ++> \rm2
}
*r2_25 {
	//:
	{| vol = 1 |
		Mix (Resonz.ar (Inp.ar, 25 * [0.25, 0.5, 0.75, 1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
			0.0005))
		* vol * 10
		
	} ++> \rm2
}

//: *r2_25cluster

{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 25 * (1, 1.1 .. 3),
		0.0005))
	* vol * 10
	
} ++> \rm2

//: *r2_250cluster
{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 250 * (1, 1.1 .. 3),
		0.0005))
	* vol * 10
	
} ++> \rm2
//: *r2_1000cluster

{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 1000 * (1, 1.1 .. 3),
		0.0005))
	* vol * 10
	
} ++> \rm2
//: *r2_2500cluster
{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 2500 * (1, 1.1 .. 3),
		0.0005))
	* vol * 10	
} ++> \rm2
//: *r2_0
{| vol = 1 |
	Mix (Resonz.ar (Inp.ar, 150 * [1, 1.25, 1.3, 1,5, 1.8, 2, 2.5, 3, 3.5, 4, 4.5],
		// LFDNlise1.kr (1).range (0.0001, 1)
		0.1
		
	)) * 1
	
} ++> \rm2;

//: *m2
\levteris_speaks.bufnum +>.buf \m2;
273.8 +>.startPos \m2;
1 +>.rate \m2;
1 +>.loop \m2;
SF.playbuf ++> \m2;

//: *m3
\levteris_speaks.bufnum +>.buf \m3;
273.8 +>.startPos \m3;
1 +>.rate \m3;
1 +>.loop \m3;
SF.playbuf ++> \m3;

//: *m4
\levteris_speaks.bufnum +>.buf \m4;
273.8 +>.startPos \m4;
1 +>.rate \m4;
1 +>.loop \m4;
SF.playbuf ++> \m4;
//:


//: FINAL THALASSA //////////////// REZA SONG ////////////////
// ////////////////////////////////////////////////////////////////
// RezaSong.plain;

'song1'.bufnum +>.buf \rezasong;
1 +>.vol \rezasong;
SF.playbufpan ++> \rezasong;
1 +>.loop \rezasong;
//:
0.5 +>.vol \rezasong;
//:

\song1.buf.play;

\m1.release;
\tickly.release;

Scenes.init;

//:
\tickly.release;

//: Crazy multi mix

  { | n |
      var name;
      name = format("multi%", n).asSymbol;
      n = n % 4;
      {
          Blip.arps(
              1 + n / 2 * Line.kr(Rand(20, 80).midicps, Rand(20, 80).midicps, Rand(0.1, 1)),
              Line.kr(Rand(5, 25), Rand(5, 25), 0.5)
          ).perform([\perc, \sine]@@n)
      } +> name;

      ([0.25.pn(14), 5 ! 3, 1, 2, 0.1 ! 10, 3] / (0.5 + (n / 4))).flat.prand *> name;
  } ! 8;

//:
\multi0 **>.xoooo \multi0; // use **> to prevent re-starting the master Task
\multi1 **>.xoooo \multi1;
\multi2 **>.xoooo \multi2;
\multi3 **>.x \multi3;
\multi4 **>.xoooo \multi4;
\multi5 **>.xoooo \multi5;
\multi6 **>.xoooo \multi6;
\multi7 **>.xoooo \multi7;
//:
\multi0 **>.xoooo \multi0;
\multi1 **>.o \multi1;
\multi2 **>.o \multi2;
\multi3 **>.x \multi3;
\multi4 **>.o \multi4;
\multi5 **>.o \multi5;
\multi6 **>.o \multi6;
\multi7 **>.xo \multi7;
//:

\multi7 **> \multi7;
\multi6 **>.xo \multi7;
\multi5 **>>.xo \_multi7;
\multi4 **>>.xo \__multi7;
\multi3 **>>.xo \___multi7;
\multi2 **>>.xo \____multi7;
\multi1 **>>.xo \_____multi7;
\multi0 **>>.xo \______multi7;
//:
\multi7 *> 0.2;
//:
0.5 +>.vol \rezasong;
//:

([0.25.pn(14), 5 ! 3, 1, 0.4 ! 10, 0.1 ! 20, 3] / 4).flat.prand *> \multi7;
{ | n | Pfunc({ 0.01 exprand: 0.35 }) +>.amp format("multi%", n).asSymbol } ! 8;
//:

([0.25.pn(14), 5 ! 3, 1, 0.4 ! 10, 0.1 ! 20, 3] / 4).flat.prand *> \multi7;
\multi7 **> \multi7;
\multi6 **>.xo \multi7;
\multi5 **>>.xo \_multi7;
\multi4 **>>.xo \__multi7;
([0.25.pn(14), 5 ! 3, 1, 0.4 ! 10, 0.1 ! 20, 3]).flat.prand *> \multi3;
\multi3 **>.xoo \multi3;
\multi2 **>>.xoo \_multi3;
\multi1 **>>.xoo \__multi3;
\multi0 **>>.xoo \___multi3;
//:
TaskPlayer.stopAll;
//:
0.01 *> \multi0;
//:

0.1 *> \multi1;
//:
\multi2 **>>.xo \multi1;
0.5 +>.amp \multi2;
//:
\multi3 **>>.xo \_multi1;



//:
Scenes.end;

//:
\rezasong release: 10;