import std.stdio;

import data;
import restriction;
import projection;

void main()
{
    writeln("LINQ - Restriction Operators");

    writeln("\nNumbers < 5:");
    foreach (n; linq1())
        writeln(n);

    writeln("\nSold out products: ");
    foreach (p; linq2())
        writefln("%s is sold out!", p.productName);

    writeln("\nIn-stock products that cost more than 3.00:");
    foreach (s; linq3())
        writefln("%s is in stock and costs more than %.2f.", s.productName, s.unitPrice);

    writeln("\nCustomers from Washington and their orders:");
    foreach (c; linq4())
    {
        writefln("Customer %s: %s", c.customerID, c.companyName);
        foreach (order; c.orders)
        {
            writefln("Order %s: %s", order.orderID, order.orderDate);
        }
    }

    writeln("\nShort digits:");
    foreach (d; linq5())
        writefln("The word %s is shorter than it's value", d);

    writeln("\nNumbers + 1:");
    foreach (n; linq6())
        writeln(n);

    writeln("\nProduct Names:");
    foreach (p; linq7())
        writeln(p);

    writeln("\nNumber strings:");
    foreach (ns; linq8())
        writeln(ns);

    writeln("\nAnonymous Types 1");
    foreach (tup; linq9())
        writefln("Uppercase: %s, Lowercase: %s", tup[0], tup[1]);

    writeln("\nAnonymous Types 2");
    foreach (tup; linq10())
        writefln("The digit %s is %s", tup[0], tup[1] ? "even" : "odd");

    writeln("\nAnonymous Types 3");
    foreach (p; linq11())
        writefln("%s is in the category %s and costs %s per unit.",
                p.productName, p.category, p.unitPrice);
}
