import std.algorithm;
import std.array;
import std.stdio;
import std.stdio;
import std.range;
import data;

/** $(BIG Restriction Operators) */

/** Where - Simple 1
* This sample uses where to find all elements of an array less than 5.
*/
auto linq1()
{
    int[] numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0];
    return numbers.filter!(a => a < 5).array;
    // .array converts FilterResult range to array
}

/**Where - Simple 2
* This sample uses where to find all products that are out of stock.
*/

auto linq2()
{
    auto products = getProducts();
    return products.filter!(a => a.unitsInStock == 0).array;

}

/**  Where - Simple 3
* This sample uses where to find all products that are in stock and cost more than 3.00 per unit.
*/

auto linq3()
{
    auto products = getProducts();
    return products.filter!(a => a.unitsInStock > 0 && a.unitPrice > 3.0).array;
}

/** Where - Drilldown
* This sample uses where to find all customers in Washington and then uses the resulting sequence to drill down into their orders.
*/
auto linq4()
{
    auto customers = getCustomerList();
    return customers.filter!(c => c.region == "WA");
}

/** Where - Indexed
* This sample demonstrates an indexed Where clause that returns digits whose name is shorter than their value.
*/

auto linq5()
{
    string[] digits = [
        "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"
    ];
    return digits.enumerate.filter!(e => e.value.length < e.index).map!(e => e.value);
}

unittest
{
    assert(linq1() == [4, 1, 3, 2, 0]);
}

unittest
{
    assert(linq2().length == 5);
}

unittest
{
    assert(linq5().equal(["five", "six", "seven", "eight", "nine"]));
}
