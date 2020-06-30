import UIKit

var jr : [Int] = [2,3,1,5,4]

func bubblesort() -> Int {
    var j = 0
    var temp = 0
 
    for i in 0..<4
    {
        j = i
        while ((j >= 0 )&&( jr[j] > jr[j+1]))
        {
            temp = jr[j]
            jr[j] = jr[j+1]
            jr[j+1] = temp
            j -= 1
        }
    }
    return 0
}

bubblesort()
print(jr)
