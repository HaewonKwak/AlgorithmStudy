//There are N children standing in a line. Each child is assigned a rating value. You are giving candies to these children subjected to the following requirements:
//
//1. Each child must have at least one candy.
//2. Children with a higher rating get more candies than their neighbors.
//
//What is the minimum candies you must give?

//http://www.programcreek.com/2014/03/leetcode-candy-java/


func minimumCandyInRating(ratings: [Int]) -> Int
{
    if ratings.count == 0 {
        return 0
    }
    var sortedRating = ratings.sort()
    var index = 1, candy = 1, sumCandy = 1
    while index < sortedRating.count {
        if sortedRating[index] == sortedRating[index-1] {
            sumCandy += candy
        } else {
            candy += 1
            sumCandy += candy
        }
        index += 1
    }
    return sumCandy
}

print(minimumCandyInRating([1, 3, 3, 7, 2]))
