//
//  main.swift
//  first-course-local
//
//  Created by Natalya Murygina on 07.02.2022.
//

import Foundation

// MARK: - перечисления
enum BrandCar: String {
    case bmw = "Спорткар BMW"
    case astonMartin = "Спорткар Aston Martin"
    case bugatti = "Спорткар Bugatti"
    case scania = "Грузовой автомобиль Scania"
    case volvo = "Грузовой автомобиль Volvo"
    case daf = "Грузовой автомобиль DAF"
}


enum Transmission: String {
    case manual = "Механическая КП"
    case auto = "Автматическая КП"
}

/// Выбор статуса двери
enum DoorState {
    case open
    case close
}

/// Выбор статуса двигателя
enum EngineState: String {
    case turnOff = "Заглушить двигатель"
    case start = "Запустить двигатель"
}

/// Выбор статуса люка
enum SunroofState {
    case open
    case close
}

/// Кузов грузовика загрузить или выгрузить
enum BodyState: String {
    case loadBody = "Загрузить"
    case uploadBody = "Выгрузить"
}

// выбор грущовика или тягача седельного
enum TruckState {
    case truck
    case tractor
}


// MARK: CAR
protocol CarProtocol {
    /// марка
    var brand: BrandCar { get }
    /// год выпуска
    var year: Int { get set }
    /// цвет кузова
    var color: String { get }
    /// трансмиссия
    var transmission: Transmission { get }
    // подсчет выпущенных авто
    static var count: Int { get set }

    func countCar ()
}

extension CarProtocol {
    func doorState(value: DoorState) {
        switch value {
        case .open:
            print("Окно открыто")
        case .close:
            print("Окно закрыто")
        }
    }
}

extension CarProtocol {
    func engineState(value: EngineState) {
        if value == .start {
            print("Двигатель заведен")
        } else {
            print("Двигатель заглушен")
        }
    }
}


// MARK: - TruckCar
final class TruckCar: CarProtocol, CustomStringConvertible {
    var description: String {
        return "Данные об авто:\n - автомобиль - \(brand.rawValue),\n - год выпуска - \(year),\n - цвет - \(color),\n - трансмиссия - \(transmission.rawValue),\n - грузоподъемность - \(loadCapacity) кубов,\n - пробег - \(mileage) км.\n"
    }

    // бренд
    var brand: BrandCar
    // год выпуска
    var year: Int
    // цвет
    var color: String
    // трансмиссия
    var transmission: Transmission
    /// тягач или грузовик
    let truckState: TruckState
    /// грузоподъемность
    let loadCapacity: Double
    /// количество колес
    var wheelsCount: Double
    /// полуприцеп есть или нет
    var istrailer:Bool
    var distance: Int {
        didSet {
            let km = distance - oldValue
            mileage = mileage + distance
            print("Пройден новый участок пути расстоянием \(km) км\n")
        }
    }
    /// пробег
    var mileage: Int {
        willSet {
            if newValue / 7500 > mileage / 7500 {
                print("Необходимо сменить масло\n")
            }
        }
    }

    static var count: Int = 0

    init(brand: BrandCar,
         year: Int,
         color: String,
         transmission: Transmission,
         truckState: TruckState,
         loadCapacity: Double,
         wheelsCount: Double,
         istrailer: Bool,
         distance: Int,
         mileage: Int) {
        self.brand = brand
        self.year = year
        self.color = color
        self.transmission = transmission
        self.truckState = truckState
        self.loadCapacity = loadCapacity
        self.wheelsCount = wheelsCount
        self.istrailer = istrailer
        self.distance = distance
        self.mileage = mileage

        print("\(brand.rawValue) инициализирован и создан в памяти\n")

        /// Счетчик выпущенных грузовиков
        TruckCar.count += 1
        print("Всего выпущено \(TruckCar.count) машина(-ы)\n")
    }

    deinit {
        print("\(brand.rawValue) удален из памяти\n")

        TruckCar.count -= 1
        print("\(TruckCar.count) грузовых(-ая) машин(-а) отправлено(-а) на утилизацию\n")
    }

    func countCar() {
        print("Всего выпущено \(TruckCar.count) машина(-ы)\n")
    }

}


// MARK: - SportCar
final class SportCar: CarProtocol, CustomStringConvertible {

    var description: String {
        return "Данные об авто:\n - автомобиль - \(brand),\n - год выпуска - \(year),\n - цвет - \(color),\n - трансмиссия - \(transmission),\n - максимальная скорость - \(speedMax) км,\n - количество секунд до максимального разгона - \(timeToMaxSpeed) сек\n - количество дверей - \(doorCount)."
    }

    // бренд
    var brand: BrandCar
    // год выпуска
    var year: Int
    // цвет
    var color: String
    // трансмиссия
    var transmission: Transmission
    /// Максимальная скорость
    let speedMax: Double
    /// Время разгона
    let timeToMaxSpeed: Double
    /// Кол-во дверей
    let doorCount: Double

    static var count: Int = 0

    init(brand: BrandCar,
         year: Int,
         color: String,
         transmission: Transmission,
         speedMax: Double,
         timeToMaxSpeed: Double,
         doorCount: Double) {
        self.brand = brand
        self.year = year
        self.color = color
        self.transmission = transmission
        self.speedMax = speedMax
        self.timeToMaxSpeed = timeToMaxSpeed
        self.doorCount = doorCount

        print("\(brand.rawValue) инициализирован и создан в памяти\n")

        /// Счетчик выпущенных грузовиков
        SportCar.count += 1
        print("Всего выпущено \(SportCar.count) машина(-ы)\n")
    }

    deinit {
        print("\(brand.rawValue) удален из памяти\n")

        SportCar.count -= 1
        print("\(SportCar.count) спортивных(-ая) машин(-а) отправлено(-а) на утилизацию\n")
    }

    func countCar() {
        print("Всего выпущено \(SportCar.count) машина(-ы)\n")
    }

}


var truckCarOne = TruckCar(brand: .scania, year: 2022, color: "wite", transmission: .auto, truckState: .truck, loadCapacity: 60, wheelsCount: 8, istrailer: true, distance: 0, mileage: 0)

var truckCarTwo = TruckCar(brand: .volvo, year: 2021, color: "blue", transmission: .auto, truckState: .tractor, loadCapacity: 100, wheelsCount: 16, istrailer: true, distance: 25, mileage: 120_000)

var sportCarOne = SportCar(brand: .astonMartin, year: 2020, color: "black", transmission: .manual, speedMax: 280, timeToMaxSpeed: 3, doorCount: 2)

var sportCarTwo = SportCar(brand: .bugatti, year: 2021, color: "red", transmission: .auto, speedMax: 260, timeToMaxSpeed: 2.5, doorCount: 3)

print("\n-----------------------\n")
print(truckCarOne)
print("\n-----------------------\n")
print(truckCarTwo)
print("\n-----------------------\n")
print(sportCarOne)
print("\n-----------------------\n")
print(sportCarTwo)
print("\n-----------------------\n")

sportCarOne.countCar()
sportCarTwo.doorState(value: .close)
truckCarOne.engineState(value: .start)

truckCarOne.distance = 25
truckCarOne.distance = 158
print(truckCarOne.mileage)
truckCarOne.distance = 7400
print(truckCarOne.mileage)

print("\n-----------------------\n")
let carList: [CarProtocol] = [sportCarOne, sportCarTwo, truckCarOne, truckCarTwo]

for value in carList {
    print(value.brand, value.year, value.color, value.transmission)
}


// MARK: - вывод в консоль
//Грузовой автомобиль Scania инициализирован и создан в памяти
//
//Всего выпущено 1 машина(-ы)
//
//Грузовой автомобиль Volvo инициализирован и создан в памяти
//
//Всего выпущено 2 машина(-ы)
//
//Спорткар Aston Martin инициализирован и создан в памяти
//
//Всего выпущено 1 машина(-ы)
//
//Спорткар Bugatti инициализирован и создан в памяти
//
//Всего выпущено 2 машина(-ы)
//
//
//-----------------------
//
//Данные об авто:
// - автомобиль - Грузовой автомобиль Scania,
// - год выпуска - 2022,
// - цвет - wite,
// - трансмиссия - Автматическая КП,
// - грузоподъемность - 60.0 кубов,
// - пробег - 0 км.
//
//
//-----------------------
//
//Данные об авто:
// - автомобиль - Грузовой автомобиль Volvo,
// - год выпуска - 2021,
// - цвет - blue,
// - трансмиссия - Автматическая КП,
// - грузоподъемность - 100.0 кубов,
// - пробег - 120000 км.
//
//
//-----------------------
//
//Данные об авто:
// - автомобиль - astonMartin,
// - год выпуска - 2020,
// - цвет - black,
// - трансмиссия - manual,
// - максимальная скорость - 280.0 км,
// - количество секунд до максимального разгона - 3.0 сек
// - количество дверей - 2.0.
//
//-----------------------
//
//Данные об авто:
// - автомобиль - bugatti,
// - год выпуска - 2021,
// - цвет - red,
// - трансмиссия - auto,
// - максимальная скорость - 260.0 км,
// - количество секунд до максимального разгона - 2.5 сек
// - количество дверей - 3.0.
//
//-----------------------
//
//Всего выпущено 2 машина(-ы)
//
//Окно закрыто
//Двигатель заведен
//Пройден новый участок пути расстоянием 25 км
//
//Пройден новый участок пути расстоянием 133 км
//
//183
//Необходимо сменить масло
//
//Пройден новый участок пути расстоянием 7242 км
//
//7583
//
//-----------------------
//
//astonMartin 2020 black manual
//bugatti 2021 red auto
//scania 2022 wite auto
//volvo 2021 blue auto
