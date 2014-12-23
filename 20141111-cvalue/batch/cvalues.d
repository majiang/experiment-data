import std.stdio;
import std.path;
import std.string;
import std.range;
import std.conv : to;

enum n = 32;

void main(string[] args)
{
	if (args.length < 3)
		return stderr.writeln("cvalues mmin mmax");
	immutable
		mmin = args[1].to!size_t(),
		mmax = args[2].to!size_t(),
		smin = 4,
		smax = 17;
	auto
		out_csv = File("..".buildPath("cvalues", "cvalues.csv"), "w"),
		out_tex = File("..".buildPath("cvalues", "cvalues.tex"), "w");
	foreach (m; mmin..mmax)
	{
		out_csv.write(m);
		out_tex.writef("$%s$", m);
		foreach (s; smin..smax)
		{
			auto data_file = File("..".buildPath("..",
				m <= 22 ? "20141022-dynamic" : "20141105-larger"
				, "pointsets", "s%02d-m%02d-n%02d.csv".format(s, m, n)));
			auto c = tryReadCvalue!"CSV"(data_file);
			out_csv.writef(",%s", c);
			auto t = tryReadCvalue!"TeX"(data_file);
			out_tex.writef(t.empty ? " &%s" : " & $%s$", t);
		}
		out_csv.writeln();
		out_tex.writeln(" \\\\");
	}
//	out_tex.writeln("\\hline");
}

auto tryReadCvalue(string output_type)(File file)
	if (output_type == "CSV")
{
	try
		return "%.10f".format(file.readln().strip().split(",")[1].to!real());
	catch
		return "";
}

auto tryReadCvalue(string output_type)(File file)
	if (output_type == "TeX")
{
	try
		return "%.2f".format(file.readln().strip().split(",")[1].to!real());
	catch
		return "";
}

