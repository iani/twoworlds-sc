// Library.at(Server.default).keys.asArray.sort[1..].collect({ | b | b.buf.bufnum });
(
{
	var bufnums = Library.at(Server.default).keys.asArray.sort[1..].collect({ | b | b.buf.bufnum });
	loop {
		30.wait;
		bufnums.scramble[..7] do: { | bufnum, i |
			bufnum +>.buf [\s1, \s2, \s3, \s4, \s5, \s6, \s7, \s8][i];
		}
	}
}.fork
)