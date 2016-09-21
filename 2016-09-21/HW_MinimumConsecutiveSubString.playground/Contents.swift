//
//2.  Given a random string S and another string T with unique elements, find the minimum consecutive sub-string of S such that it contains all the elements in T.
//example:
//S='adobecodebanc'
//T='abc'
//answer=‘banc'
//
//https://www.careercup.com/question?id=4855286160424960

func findMinimumConsecutiveSubString(s: String, t: String) -> String {
    if s.characters.count < t.characters.count { return "" }
    
    var minLength = -1
    var minEndIndex = 0
    var characters: [Character: Int] = [ : ]
    var letterCounter = 0
    var uniqueElement: [Character] = []
    for element in t.characters {
        uniqueElement.append(element)
    }

    var index = 0
    while index < s.characters.count {
        let character = s[s.startIndex.advancedBy(index)]
        if let charIndex = uniqueElement.indexOf(character) {
            uniqueElement.removeAtIndex(charIndex)
            characters[character] = index
        } else {
            if t.characters.contains(character) {
                var smallestIndexCharacter: (Character, Int) = (character, index)
                
                for char in characters {
                    if smallestIndexCharacter.1 > char.1 {
                        smallestIndexCharacter = char
                    }
                }
                characters[character] = index

                if smallestIndexCharacter.0 == character {
                    smallestIndexCharacter.1 = index
                    for char in characters {
                        if smallestIndexCharacter.1 > char.1 {
                            smallestIndexCharacter = char
                        }
                    }
                    letterCounter = index - smallestIndexCharacter.1
                }
            }
        }
        letterCounter += 1
        
        if uniqueElement.count == 0 && (minLength > letterCounter || minLength == -1) {
            minLength = letterCounter
            minEndIndex = index
        }
        
        index += 1
    }
    
    if minLength > 0 {
        let start = s.startIndex.advancedBy(minEndIndex - minLength + 1)
        let end = s.startIndex.advancedBy(minEndIndex)
        return s[start...end]
    } else {
        return ""
    }
}

print(findMinimumConsecutiveSubString("adobecodebanc", t: "abc"))


