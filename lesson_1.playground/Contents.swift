import UIKit

print("Начинаем решение квадратного уравнения")

let a = 3.0
let b = -14.0
let c = -5.0

let d = b * b - 4 * a * c



if (d < 0){
    print("Корней нет")
} else {
    if (d == 0){
        print((0.0 - b) / 2.0 * a)
    } else {
        print("x1=", ((0.0-b) + sqrt(d))/(2.0 * a))
        print("x2=", ((0.0-b) - sqrt(d))/(2.0 * a))
    }
}


print("Начинаем искать площадь, периметр и гипотенузу треугольника")

let katet1 = 13.0
let katet2 = 5.0

print("Площадь: ", (katet1 * katet2) / 2.0)
let gip = sqrt(pow(katet1,2) + pow(katet2,2))
print("Гипотенуза: ", gip)
print("Периметр: ", katet1 + katet2 + gip)



print("Банк")

var sum = 100000.0
let year_percent = 0.06

for _ in 1...5 {
    sum += sum * year_percent
}

print("Сумма после 5 лет:", sum)
