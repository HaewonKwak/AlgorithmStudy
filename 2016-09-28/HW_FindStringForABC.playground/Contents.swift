//Given a length n, return the number of strings of length n that can be made up of the letters 'a', 'b', and 'c', where there can only be a maximum of 1 'b's and can only have up to two consecutive 'c's
//
//Example:
//findStrings(3) returns 19
//since the possible combinations are: aaa,aab,aac,aba,abc,aca,acb,baa,bac,bca,caa,cab,cac,cba,cbc,acc,bcc,cca,ccb
//and the invalid combinations are:
//abb,bab,bba,bbb,bbc,bcb,cbb,ccc
//https://www.careercup.com/question?id=5717453712654336

func countToMakeUpABC(string: String, maxLengh: Int, useB: Int, useC: Int) -> Int {
    if (string.characters.count == maxLengh) {
        return 1
    }
    let count1 = countToMakeUpABC(string + "a", maxLengh: maxLengh, useB: useB, useC: useC)
    var count2 = 0, count3 = 0
    if (useB > 0) {
        count2 = countToMakeUpABC(string + "b", maxLengh: maxLengh, useB: useB - 1, useC: useC)
    }
    if (useC > 0) {
        count3 = countToMakeUpABC(string + "c", maxLengh: maxLengh, useB: useB, useC: useC - 1)
    }
    
    return count1 + count2 + count3
}


func countToMakeUp(characters: [Character: Int], string: String, length: Int) -> Int {
    if (string.characters.count == length) {
        return 1
    }
    var count = 0
    for character in characters {
        var countChracterInString = 0
        for letter in string.characters {
            if letter == character.0 {
                countChracterInString += 1
            }
        }
        if character.1 > countChracterInString {
            let newString = string + String(character.0)
            count += countToMakeUp(characters, string: newString, length: length)
        }
    }
    return count
}

func findString(length: Int) -> Int {
//    return countToMakeUpABC("", maxLengh: length, useB: 1, useC: 2)
    return countToMakeUp(["a": length, "b":1, "c":2], string: "", length: length)
}

print(findString(2))


