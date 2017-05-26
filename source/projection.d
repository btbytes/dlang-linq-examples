/** Projection Operators */

import std.algorithm;
import std.array;
import std.range;
import std.typecons;
import std.uni;
import data;

/** Select - Simple 1
* This sample uses select to produce a sequence of ints one higher than those in an existing array of ints.
*/

auto linq6()
{
    immutable numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0];
    return map!(a => a + 1)(numbers).array;
}

/** Select - Simple 2
* This sample uses select to return a sequence of just the names of a list of products.
*/

auto linq7()
{

    Product[] products = getProducts();
    return map!(a => a.productName)(products).array;
}

/** Select - Transformation
* This sample uses select to produce a sequence of strings representing the text version of a sequence of ints.
*/

auto linq8()
{
    int[] numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0];
    string[] strings = [
        "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"
    ];
    return map!(a => strings[a])(numbers).array;
}

/** Select - Anonymous Types 1
* This sample uses select to produce a sequence of the uppercase and lowercase versions of each word in the original array.
*/

auto linq9()
{
    string[] words = ["aPPLE", "BlUeBeRrY", "cHeRry"];
    return map!(a => tuple(a.toUpper(), a.toLower()))(words);
}

/** Select - Anonymous Types 2
* This sample uses select to produce a sequence containing text representations of digits and whether their length is even or odd.
*/

auto linq10()
{
    int[] numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0];
    string[] strings = [
        "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"
    ];
    return map!(a => tuple(strings[a], a % 2 == 0))(numbers);

}

/** Select - Anonymous Types 3
* This sample uses select to produce a sequence containing some properties of Products, including UnitPrice which is renamed to Price in the resulting type.
*/

auto linq11()
{
    Product[] products = getProducts();
    // this is not exaclty "anonymous type", is it :)
    alias ProductInfo = Tuple!(string, "productName", string, "category", double, "unitPrice");
    return map!(a => ProductInfo(a.productName, a.category, a.unitPrice))(products);
}

/** Select - Indexed
* This sample uses an indexed Select clause to determine if the value of ints in an array match their position in the array.
*/

auto linq12()
{
    int[] numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0];
    return zip(numbers, numbers.enumerate.map!(a => a.value == numbers[a.value]));

}

/** Select - Filtered
* This sample combines select and where to make a simple query that returns the text form of each digit less than 5.
*/

auto linq13()
{
    int[] numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0];
    string[] digits = [
        "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"
    ];
    return map!(a => digits[a])(filter!(a => a < 5)(numbers));
}

/** SelectMany - Compound from 1
* This sample uses a compound from clause to make a query that returns all pairs of numbers from both arrays such
* that the number from numbersA is less than the number from numbersB.
*/

auto linq14()
{
    int[] numbersA = [0, 2, 4, 5, 6, 8, 9];
    int[] numbersB = [1, 3, 5, 7, 8];
    return filter!(a => a[0] < a[1])(zip(numbersA, numbersB));
}

/** SelectMany - Compound from 2
* This sample uses a compound from clause to select all orders where the order total is less than 500.00.
*/

auto linq15()
{
    auto customers = getCustomerList();
    return customers.map!(c => c.orders.filter!(it => it.total < 500.0)
            .map!(x => tuple(c.customerID, x.orderID, x.total))).joiner();
}

unittest
{
    assert(equal(linq6(), [6, 5, 2, 4, 10, 9, 7, 8, 3, 1]));
}

unittest
{
    assert(linq7().length == 77);
}

unittest
{
    assert(equal(linq8(), ["five", "four", "one", "three", "nine", "eight",
            "six", "seven", "two", "zero"]));
}

unittest
{

}
