//
//  main.swift
//  first-course-local
//
//  Created by Natalya Murygina on 07.02.2022.
//

//import Foundation



// MARK: - Задача 1

print("Урок 2. Синтаксис и основные операторы Swift.\n\nПрактическое задание\nЗадача 1. Функция, которая определяет, четное число или нет.\n")

func determiningNumber(_ evenNumber: Int) -> String {
    if (evenNumber % 2) == 0 {
        let answerOne = "четное число"
        return answerOne
    }
    else {
        let answerTwo = "не четное число"
        return answerTwo
    }
}

var number: Int = 5
var answerNumber = determiningNumber(number)

print("Число \(number) - это \(answerNumber)")

// MARK: - Задача 2

print("\n\nЗадача 2. Функция, которая определяет, делится ли число без остатка на 3.\n")

func determiningNumberThree(_ anyNumber: Int) -> String {
    if anyNumber % 3 == 0 {
        let answer = "делится на 3 без остатка"
        return answer
    } else {
        let answer = "не делится на 3 без остатка"
        return answer
    }
}

let numberThreeAny: Int = 10
let numberThree = determiningNumberThree(numberThreeAny)

print("Число \(numberThreeAny) \(numberThree)")


// MARK: - Задача 3

print("\n\nЗадача 3. Возрастающий массив из 100 чисел.\n")

var numbersHundred = [Int] ()
var firstNumber: Int = 1

for _ in 1...100 {
    numbersHundred.append(firstNumber)
    firstNumber += 1
}

print("\(numbersHundred)")

// MARK: - Задача 4

print("\n\nЗадача 4. Удаление из массива (Задание 3) всех четных чисел и всех чисел, которые не делятся на 3.\n")

var n: Int = 0

for _ in 0...99 {
    if (numbersHundred[n] % 2 == 0) || (numbersHundred[n] % 3 == 0) {
        numbersHundred.remove(at: n)
    } else {
        n += 1
    }
}

print("\(numbersHundred)")

// MARK: - Задача 5*

print("\n\nЗадача 5. Функция, которая добавляет в массив новое число Фибоначчи (добавление 50 элементов).\n")

func addFibonacciNumbers(_ count: Int) -> [Int] {
    var fibonacciNumbers = [0,1]
    for i in 0...count - 3 {
        let addNumber = fibonacciNumbers[i] + fibonacciNumbers[i+1]
        fibonacciNumbers.append(addNumber)
    }
    return fibonacciNumbers
}
var fibonacciNumbers = addFibonacciNumbers(50)
print(fibonacciNumbers)
print("\nЧисло элементов в массиве - \(fibonacciNumbers.count)")

// MARK: - Задача 6*

print("\n\nЗадача 6. Массив из 100 элементов различными простыми числами.\n")

var simpleNumbers = [1,2,3]
let count = 600

for simpleNumber in 4...count {
    var np = 0

    for i in 2...simpleNumber - 1 {
        if (simpleNumber % i) == 0 {
            np = 0
            break
        } else {
            np = simpleNumber
        }
    }
    if np != 0 {
        if simpleNumbers.count < 100 {
        simpleNumbers.append(np)
        } else {
            break
        }
    }
}

print(simpleNumbers)
print("\nЧисло элементов в массиве - \(simpleNumbers.count)\n")
