//
//2.  Given a random string S and another string T with unique elements, find the minimum consecutive sub-string of S such that it contains all the elements in T.
//example:
//S='adobecodebanc'
//T='abc'
//answer=‘banc'
//
//https://www.careercup.com/question?id=4855286160424960

func findMinimumConsecutiveSubString(s: String, t: String) -> String? {
    if s.characters.count < t.characters.count { return nil }
    
    var minLength = -1, minEndIndex = 0, letterCounter = 0
    var characters: [Character: Int] = [ : ]
    var uniqueElement: [Character] = []
    for element in t.characters {
        uniqueElement.append(element)
    }

    var index = 0
    while index < s.characters.count {
        let character = s[s.startIndex.advancedBy(index)]
        if let charIndex = uniqueElement.indexOf(character) {
            uniqueElement.removeAtIndex(charIndex)
            if uniqueElement.count == 0 && (t.characters.count == letterCounter + 1) {
                let start = s.startIndex.advancedBy(index - t.characters.count + 1)
                let end = s.startIndex.advancedBy(index)
                return s[start...end]
            }
            characters[character] = index
        } else {
            if t.characters.contains(character) {
                var smallestIndexCharacter = (character, index)
                var secondSmallestIndexCharacter = (character, index)
                for char in characters {
                    if smallestIndexCharacter.1 > char.1 {
                        if (secondSmallestIndexCharacter.1 > smallestIndexCharacter.1) {
                            secondSmallestIndexCharacter = smallestIndexCharacter
                        }
                        smallestIndexCharacter = char
                    } else if secondSmallestIndexCharacter.1 > char.1 {
                        secondSmallestIndexCharacter = char
                    }
                }
                characters[character] = index

                if smallestIndexCharacter.0 == character {
                    letterCounter = index - secondSmallestIndexCharacter.1
                }
            } else if (uniqueElement.count == t.characters.count) {
                letterCounter -= 1
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
        return nil
    }
}

print(findMinimumConsecutiveSubString("adobecodebanc", t: "abc"))


