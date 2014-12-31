class TableWriter(string format, string separator, string lineSeparator, string defaultValue, T)
{
	import std.stdio;

	this (string fileName)
	{
		this.sink = File(fileName, "w");
	}
	void write(lazy T value)
	{
		if (!firstLine)
			sink.write(separator);
		try
			sink.writef(format, value);
		catch
			sink.write(defaultValue);
		firstLine = false;
	}
	void writeln()
	{
		sink.writeln(lineSeparator);
		firstLine = true;
	}
private:
	File sink;
	bool firstLine = true;
}

alias CSVWriter = TableWriter!("%.15e", ",", "", "", real);
alias TeXWriter = TableWriter!("$%.2f$", " & ", "\\", "", real);
