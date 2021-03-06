import std.stdio, std.csv, std.string, std.path;

struct Record
{
	real slope;
	real intercept;
	real tscore;
	size_t degree_of_freedom;
}

real t_to_p(real t, size_t nu)
in
{
	assert (2 < nu);
}
body
{
	import std.math : sgn;
	auto b = (nu / (nu + t * t)).betaDist(nu, 1);
	return 0.5 + sgn(t) * (1 - b) * 0.5;
}

private real betaDist(real x, real a, real b)
{
	import std.mathspecial : betaIncomplete;
	return betaIncomplete(a/2, b/2, x);
}

void main()
{
	foreach (genz_class; 0..6)
	{
		version (tex)
			auto output = File(buildPath("..", "result", "slope-pvalue-%d.tex".format(genz_class)), "w");
		else
			auto output = File(buildPath("..", "result", "slope-pvalue-%d.csv".format(genz_class)), "w");
		foreach (dimR; 4..17)
		{
			output.write(dimR);
			version (tex)
				string sep = " & ";
			else
				string sep = ",";
			string buf;
			foreach (genz_coeff; [1, 2, 4])
			{
				immutable record = File(
					buildPath("..",
						"tscore",
						"s%02d-m08m23-%dgenz%d.csv".format(
							dimR, genz_coeff, genz_class))
					).readln().csvReader!Record().front;
				version (tex)
				{
					output.writef("%s$%.4f$", sep, record.slope);
					buf ~= "%s%.4f".format(sep, record.tscore.t_to_p(record.degree_of_freedom));
				}
				else
				{
					output.writef("%s%.8e", sep, record.slope);
					buf ~= "%s%.8e".format(sep, record.tscore.t_to_p(record.degree_of_freedom));
				}
			}
			version (tex)
				output.writefln("%s \\\\", buf);
			else
				output.writefln("%s", buf);
		}
		//output.writeln("\\hline");
	}
}
