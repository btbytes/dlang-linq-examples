/* Partitioning Operators */

import std.algorithm;
import std.array;
import std.datetime;
import std.format;
import std.range;
import std.typecons;
import std.uni;
import data;

/** Take - Simple
* This sample uses Take to get only the first 3 elements of the array.
*/

auto linq20()
{
    auto numbers = [5, 4, 1, 3, 9, 8, 6, 7, 2, 0];
    return numbers.take(3);
}
