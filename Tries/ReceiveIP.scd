OSCdef (\ip, { | ... args |
	"This is THE IP - received locally".postln;
	args.postln;
}, '/ip', recvPort: 57120);
//:

//:
~larigot = NetAddr ("195.130.125.238", 57120);

~larigot.sendMsg ('/ip', "82.102.92.244");

//:
OSCdef ("/fromLarigot", { | ... args |
	"FROM LARIGOT".postln;
	args.postln;
}, '/ip_changed');
//:
OSCdef ("/fromLarigot57120", { | ... args |
	"FROM LARIGOT - 57120".postln;
	args.postln;
}, '/ip_changed', recvPort: 57120);
//:

~nac = NetAddr ("82.102.92.28", 57120);
~nac.sendMsg ('/ip', "82.102.92.244");

//:

~local = NetAddr ("127.0.0.1", 57120);
~local.sendMsg ('/ip_changed', "82.102.92.244");

//:

~loukas = NetAddr ("176.92.120.170", 57120);
~loukas.sendMsg ('/test', "Mysticism", *Array.rand (10, 1, 100));

//:
OSCFunc trace: true;

//:
NetAddr.localAddr;

//: 78.158.149.96
~macmini = NetAddr ("192.168.8.103", 57120);


~macmini.sendMsg ("test", 1, 2, 3);
//:
~argyris = NetAddr ("78.158.149.96", 57120);
~argyris.sendMsg ("test", 1, 2, 3);
//:
~argyrislan = NetAddr ("192.168.2.10", 57120);
~argyrislan.sendMsg ("test", 1, 2, 3);