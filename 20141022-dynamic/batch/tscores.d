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
		auto output = File(buildPath("..", "result", "slope-pvalue-%d.tex".format(genz_class)), "w");
		foreach (dimR; 4..17)
		{
			output.write(dimR);
			string sep = " & ";
			string buf;
			foreach (genz_coeff; [1, 2, 4])
			{
				immutable record = File(
					buildPath("..",
						"proc-out",
						"%dgenz%d-s%02d.csv".format(
							genz_coeff * [1, 10][genz_class == 4], genz_class, dimR))
					).readln().csvReader!Record().front;
				output.writef("%s$%.4f$", sep, record.slope);
				buf ~= "%s%.4f".format(sep, record.tscore.t_to_p(record.degree_of_freedom));
			}
			output.writefln("%s \\\\", buf);
		}
		//output.writeln("\\hline");
	}
}
