//
//  main.swift
//  first-course-local
//
//  Created by Natalya Murygina on 07.02.2022.
//

import Foundation

print("Задание 1.\n")
// MARK: - School
final class School {

    // MARK: - private properties
    private let students = ["Абрамова Оля": 5,
                            "Богданов Боря": 4,
                            "Мартынов Петя": 3,
                            "Сидорв Коля": 5,
                            "Торхова Лена": 4,
                            "Храмова Женя": 1]

    // MARK: - public func

    public func mark (name: String) -> Int? {
        return students[name]
    }

    public func averageMarks() -> Double {
        if students.count > 0 {
            var totalMarks = 0
            for student in students {
                totalMarks += student.value
            }
            return Double(totalMarks / students.count)
        } else {
            return 0
        }
    }
}


// MARK: - initialization
let school = School()
if let mark = school.mark(name: "Богданов Боря") {
    print(mark)
} else {
    print("Такого ученика нет")
}

// MARK: - function call
let averageOfMarks = school.averageMarks()
print(averageOfMarks)



print("_______________________________\nЗадание 2.\n")
// MARK: - InternetShopClothesError
enum InternetShopClothesError: Error{
    case errorInventoryName
    case errorCount
    case errorCoinDeposit
}


// MARK: - Color
enum Color {
    case red
    case blue
    case green
    case yellow
    case black
    case wite
    case silver
}


// MARK: - Item
struct Item {
    public let price: Int
    public var count: Int
    public let product: Product
}

// MARK: - Product
struct Product {
    public let name: String
    public let size: Int
    public let color: Color
}


// MARK: - InternetShopClothes
final class InternetShopClothes {

    // MARK: - public properties
    public var inventory = ["Fancy Dress": Item(price: 4500, count: 3, product: Product(name: "Fancy Dress", size: 44, color: .black)),
                            "Sport Dress": Item(price: 2800, count: 1, product: Product(name: "Sport Dress", size: 46, color: .red)),
                            "Dress Mini": Item(price: 2500, count: 2, product: Product(name: "Dress Mini", size: 44, color: .yellow)),
                            "Blouse": Item(price: 1500, count: 1, product: Product(name: "Blouse", size: 48, color: .wite)),
                            "Trousers": Item(price: 2000, count: 5, product: Product(name: "Trousers", size: 46, color: .black))]

    var coinDeposite = 0

    // MARK: - public func with error
    public func sale(itemNamed name: String) throws -> Product {

        guard let item = inventory[name] else { throw InternetShopClothesError.errorInventoryName }
        guard item.count > 0 else { throw InternetShopClothesError.errorCount }
        guard coinDeposite >= item.price else { throw InternetShopClothesError.errorCoinDeposit }

        coinDeposite > item.price ? print("\nYour change was \(coinDeposite - item.price) rubles") : print("\nYou paid without change.")

        print("\(name) has been shipped and sent to you\n")

        var newItem = item
        newItem.count -= 1
        print("\(name) is out of stock.\n")
        inventory[name] = newItem

        return newItem.product

    }
}


// MARK: - initialization
var order = InternetShopClothes()
order.coinDeposite = 5000

// MARK: - function call
do {
    let product = try order.sale(itemNamed: "Blouse")
    print(product.name)
} catch let error {
    print(error)
}

order.coinDeposite = 1500

do {
    let productTwo = try order.sale(itemNamed: "Blouse")
    print(productTwo.name)
} catch let error {
    print(error)
}

order.coinDeposite = 2000

do {
    let productThree = try order.sale(itemNamed: "Trousers")
    print(productThree.name)
} catch let error {
    print(error)
}

