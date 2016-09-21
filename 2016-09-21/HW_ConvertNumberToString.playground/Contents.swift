//1.  Convert a number to English representation.
//Ex: Input : 100
//Output : One Hundred.
//
//https://www.careercup.com/question?id=5765581773996032

func stringFromNumber(inputNumber: Int) -> String {
    
    var number = inputNumber
    let numbers = ["", "one", "two", "three", "four", "five", "six", "sever", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    let tenNumbers = ["twenty", "thrity", "forty", "fifty", "sixty", "seventy", "eighty", "ninty", "hundred"]
    let thousandNubmers = ["thousand", "million", "billion", "trillion"]
    
    var numberString = ""
    var thousandCounter = 0
    
    while number > 0 {
        
        var div = number % 1000
        
        if div > 0 {
            
            if thousandCounter > 0 {
                numberString = thousandNubmers[thousandCounter - 1] + " " + numberString
            }
            
            var tempNumberString = ""
            
            if div >= 100 {
                let hundredNumber = div / 100
                tempNumberString = numbers[hundredNumber] + " " + tenNumbers.last!
                div %= 100
            }
            
            if div < 20 {
                tempNumberString = tempNumberString + " " + numbers[div]
            } else {
                let tenNumber = div / 10
                tempNumberString = tempNumberString + " " + tenNumbers[tenNumber -
                    2]
                let numberDiv = div % 10
                if numberDiv > 0 {
                    tempNumberString = tempNumberString + "-" + numbers[numberDiv]
                }
            }
            
            if numberString.characters.count > 0 {
                numberString = tempNumberString + " " + numberString
            } else {
                numberString = tempNumberString
            }
        }
        thousandCounter += 1
        number /= 1000
    }
    
    return numberString
}

print(stringFromNumber(100))
