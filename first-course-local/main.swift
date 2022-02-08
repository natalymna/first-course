//
//  main.swift
//  first-course-local
//
//  Created by Natalya Murygina on 07.02.2022.
//

import Foundation

print("Первая задача.\nРешение квадратного уравнения 'ax^2 + bx + c = 0'")

let a: Double = 2
let b: Double = 8
let c: Double = 1

let discriminant: Double = pow(b, 2) - 4 * a * c

print("Дискриминант 'b^2 - 4 * a * c' равен \(discriminant)")

if(discriminant > 0){
    let firstAnswer: Double = (-b + sqrt(discriminant)) / (2 * a)
    let secondAnswer: Double = (-b - sqrt(discriminant)) / (2 * a)
    print(String(format: "Уравнение имеет 2 корня: x1 = %.2f; x2 = %.2f", firstAnswer, secondAnswer))

} else if(discriminant == 0) {
    let answer: Double = -b / (2 * a)
    print(String(format: "Уравнение имеет один корень x = %.2f", answer))
}
else{
    print("Корней нет")
}


print("\nВторая задача.\nДаны катеты прямоугольного треугольника.\nПервый катет = 12 см,\nВторой катет = 8 см.\nНайти площадь, периметр и гипотенузу треугольника.")

let cathetFirst: Double = 12
let cathetSecond: Double = 8
let hypotenuse: Double = sqrt(pow(cathetFirst, 2) + pow(cathetSecond, 2))

print(String(format:"Гипотенуза прямоугольного треугольника = %.2f", hypotenuse))
let square: Double = cathetFirst * cathetSecond * 0.5
print(String(format:"Площадь прямоугольного треугольника = %.2f", square))

let perimeter: Double = cathetFirst + cathetSecond + hypotenuse
print(String(format:"Периметр прямоугольного треугольника = %.2f", perimeter))

print("\nТретья задача.\nПользователь вводит сумму вклада (100 000 руб.) в банк и годовой процент (8% годовых).\nНеобходимо найти сумму вклада через 5 лет.")

var depositSumm: Double = 100_000
let percent: Double = 8

for _ in 1...5 {
    depositSumm = depositSumm * percent/100 + depositSumm
}
print(String(format: "\nСумма депозита за 5 лет с процентами составит - %.2f", depositSumm))


