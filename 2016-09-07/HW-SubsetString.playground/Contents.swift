import UIKit

//You will be writing pseudo-code to print all of the subsets of a set of characters. Consider the following set as an example:
//a, b, c
//The following conditions apply for the array above:
//N = 3, Each element contains one alphabetic character, in sequence.
//Out line an algorithm that would email all subsets. For example, the following results would be emitted for the set shown above: a, b, c, ab, ac, bc, abc
//Note that your algorithm must be applicable for a generic number N. Note also that the resulting output list dose not have to be sorted.
let array = ["a", "b", "c"]
let maxSubsetCount = (1 << array.count)
var i = 1
var text = ""

while i < maxSubsetCount
{
    var j = 0
    while j < array.count
    {
        if (i & (1 << j)) != 0
        {
            text = text + array[j]
        }
        j += 1
    }
    i += 1
    
    if i < maxSubsetCount
    {
        text = text + ", "
    }
}

print(text)

//version 2
i = 1
text = ""
while i < maxSubsetCount
{
    var index = i
    var j = 0
    while index != 0
    {
        if index % 2 == 1
        {
            text = text + array[j]
        }
        j += 1
        index /= 2
    }
    i += 1
    if i < maxSubsetCount
    {
        text = text + ", "
    }
}

print(text)



