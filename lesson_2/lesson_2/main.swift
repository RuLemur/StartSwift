//
//  main.swift
//  lesson_2
//
//  Created by Александр Павлов on 22.01.2020.
//  Copyright © 2020 Александр Павлов. All rights reserved.
//

import Foundation

// 1 Задание


func isNumberEven(number: Int) -> Bool{
    return number % 2 == 0
}

// 2 Задание
// функция проверяет делится ли 1 число без остатка на второе (по умолчанию 3, что бы соотвествовало заданию)
func isNumberMultiple(number: Int, divider: Int = 3) -> Bool{
    return number % divider == 0;
}


// 3 Задание
var array3 = [0]
for i in 1..<100 {
    let random_num = Int.random(in: 0...100)
    array3.append(array3[i-1] + random_num)
}


// 4 Задание

for var i in (0..<array3.count).reversed() {
    if isNumberEven(number: array3[i]) || isNumberMultiple(number: array3[i]) {
        array3.remove(at: i)
        i -= 1
    }
}

// 5 задание

func addNewFibbonchiNum(array5: [Decimal]) -> Decimal{
    switch array5.count {
    case 0:
        return 1
    case 1:
        return 1
    default:
        return array5[array5.count-1] + array5[array5.count-2]
    }
}

var fibbArray = [Decimal]()
for _ in 0..<100 {
    fibbArray.append(addNewFibbonchiNum(array5: fibbArray))
}

// 6 задание
// Далеко не идеальное решение получилось
// Хотел сделать возможность получать значения начиная с любого числа, но данный алгоритм не позволил
// Так же не получилось быстро нагуглить split массива
// Костыли и велосипеды далее
var simpleNumsArray = [2]
func getNextSimpleNumber(count: Int) -> [Int]{
    let allNums = Array(2...545) // вот в этот рендж влезает ровно 100 элементов))
    var workedAllNums = allNums
    let maxNum = allNums.max()
    for i in 0..<allNums.count {
        for j in 0..<allNums.count {
            let notSimple = allNums[i]*allNums[j]
            if notSimple > maxNum!{
                break
            }
            if let toDelete = workedAllNums.firstIndex(of: notSimple) {
                workedAllNums.remove(at: toDelete)
            }
            
        }
    }
    return workedAllNums
}

print(getNextSimpleNumber(count: 100))
