import std.stdio : File;
import std.string : format, strip;
void main()
{
	foreach (s; 4..17)
		foreach (i; 0..6)
			foreach (genz_c; [1, 2, 4])
			{
				immutable c = (i == 4 ? 10 : 1) * genz_c;
				auto out_file = File("s%02d-m%02dm%02d-%dgenz%d.csv".format(s, 8, 23, genz_c, i), "w");
				foreach (in_file; [
					File("s%02d-m%02dm%02d-%dgenz%d.csv".format(s,  8, 17, c, i)) // small
				,	File("s%02d-m%02dm%02d-%dgenz%d.csv".format(s, 17, 23, c, i)) // medium
			//	,	File("s%02d-m%02dm%02d-%dgenz%d.csv".format(s, 23, 30, c, i)) // large
				])
				{
					foreach (line; in_file.byLine())
						out_file.writeln(line.strip());
					in_file.close(); // necessary to avoid `too many open files` error.
				}
			}
}
