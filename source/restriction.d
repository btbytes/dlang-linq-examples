import std.array;
import std.algorithm;

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
    assert(linq3().length == 72);
}
