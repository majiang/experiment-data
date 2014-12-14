const(char)[] median(int s, int m)
{
	import std.string, std.stdio, std.range;
	try
	{
		auto f = File("s%02d-m%02d-n32.csv".format(s, m));
		auto b = f.byLine().dropExactly(50);
		auto median_ps = b.front.strip.split(",");
		return median_ps[2];
		//return File("%s02d-m%02d-n32.csv".format(s, m)).byLine().dropExactly(50).front.strip().split(",")[2];
	}
	catch
		return "";
}

void main()
{
	import std.stdio;
	foreach (m; 8..31)
	{
		string sep;
		foreach (s; 4..17)
		{
			write(sep, median(s, m));
			sep = ",";
		}
		writeln();
	}
}
