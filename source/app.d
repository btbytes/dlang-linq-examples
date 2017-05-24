import std.stdio;

import data;
import restriction;

void main()
{
    writeln("LINQ - Restriction Operators");

    writeln("Numbers < 5:");
    foreach (n; linq1())
        writeln(n);

    writeln("Sold out products: ");
    foreach (p; linq2())
        writefln("%s is sold out!", p.productName);

    writeln("In-stock products that cost more than 3.00:");
    foreach (s; linq3())
        writefln("%s is in stock and costs more than %.2f.", s.productName, s.unitPrice);
}
