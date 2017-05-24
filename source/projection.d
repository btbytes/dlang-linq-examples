/** Projection Operators */

import std.algorithm;
import std.array;
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
    // assert(equal(linq9(), )
}
