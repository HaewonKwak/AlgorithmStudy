import UIKit

//2. Longest substring with at most K distinct characters (Google)
//
//Given a string, find the longest substring that contains only two unique characters. For example, given "abcbbbbcccbdddadacb", the longest substring that contains 2 unique character is "bcbbbbcccb”.
//
//http://www.programcreek.com/2013/02/longest-substring-which-contains-2-unique-characters/
//
func longestSubString(let text: String, distinctCharacters: Int) -> String
{
    var characters: [Character: Int] = [:]
    var index = 0, letterCounter = 0, letterMaxIndex = 0, letterMax = 0

    while index < text.characters.count {
        let character = text[text.startIndex.advancedBy(index)]
        if characters.count < distinctCharacters || characters[character] != nil {
            characters[character] = index
            letterCounter += 1
            if letterMax < letterCounter {
                letterMax = letterCounter
                letterMaxIndex = index
            }
        } else {
            var smallestIndexCharacter: (Character, Int) = (character, index)

            for char in characters {
                if smallestIndexCharacter.1 > char.1 {
                    smallestIndexCharacter = char
                }
            }
            characters[character] = index
            characters[smallestIndexCharacter.0] = nil
            letterCounter = index - smallestIndexCharacter.1
        }

        index += 1
    }

    let start = text.startIndex.advancedBy(letterMaxIndex - letterMax + 1)
    let end = text.startIndex.advancedBy(letterMaxIndex)
    return text[start...end]
}

print(longestSubString("abcbbbbcccbdddadacb", distinctCharacters: 2))
