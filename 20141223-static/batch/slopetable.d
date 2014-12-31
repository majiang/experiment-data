import table;
import std.path : buildPath;

real getValue(size_t s, size_t m)
{
	import std.file : readText;
	import std.string : strip, format;
	import std.array : split;
	import std.conv : to;
	import std.exception : enforce;
	import std.math : isNaN;
	enforce(getScore(s, m) < -1);
	auto buf = buildPath("..", "tscore", "s%02d-%02dm.csv".format(s, m)).readText().strip().split(",")[0].to!real();
	enforce(!buf.isNaN());
	return buf;
}

real getScore(size_t s, size_t m)
{
	import std.file : readText;
	import std.string : strip, format;
	import std.array : split;
	import std.conv : to;
	import std.exception : enforce;
	import std.math : isNaN;
	auto buf = buildPath("..", "tscore", "s%02d-%02dm.csv".format(s, m)).readText().strip().split(",")[2].to!real();
	enforce(!buf.isNaN());
	return buf;
}

void main()
{
	auto tex = new TeXWriter(buildPath("..", "slope", "slope.tex"));
	auto csv = new CSVWriter(buildPath("..", "slope", "slope.csv"));
	foreach (m; 8..31)
	{
		import std.string : format;
		tex.rawWrite("$%d$".format(m)).rawWriteSep();
		foreach (s; 4..17)
		{
			tex.write(getValue(s, m));
			csv.write(getValue(s, m));
		}
		tex.writeln();
		csv.writeln();
	}
}
