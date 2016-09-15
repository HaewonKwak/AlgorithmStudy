import UIKit

//1. Count and Say
//
//The count-and-say sequence is the sequence of integers beginning as follows:
//1, 11, 21, 1211, 111221, ...
//
//1 is read off as "one 1" or 11.
//11 is read off as "two 1s" or 21.
//21 is read off as "one 2, then one 1" or 1211.
//Given an integer n, generate the nth sequence.
//
//http://www.programcreek.com/2014/03/leetcode-count-and-say-java/
//

func countAndSay(var count: Int) -> Int {
    var value = 1
    while count > 0 {
        var result = 0
        var prevNumber = -1
        var counter = 10
        while value != 0 {
            let mod = value % 10

            if prevNumber == mod {
                result += counter
            } else {
                if result > 0 {
                    counter *= 100
                }
                result += counter + (mod * counter / 10)
                prevNumber = mod
            }
            value /= 10
        }
        value = result
        count -= 1
    }
    return value
}

print(countAndSay(4))

