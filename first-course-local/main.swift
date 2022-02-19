//
//  main.swift
//  first-course-local
//
//  Created by Natalya Murygina on 07.02.2022.
//

import Foundation


// MARK: - Перечисления

enum BrandCar: String {
    case bmw = "Спорткар BMW"
    case mercedes = "Спорткар Mercedes"
    case astonMartin = "Спорткар Aston Martin"
    case audiR8 = "Спорткар Audi R8"
    case bugatti = "Спорткар Bugatti"
    case corvette = "Спорткар Corvette"
    case scania = "Грузовой автомобиль Scania"
    case volvo = "Грузовой автомобиль Volvo"
    case daf = "Грузовой автомобиль DAF"
    case man = "Грузовой автомобиль MAN"
    case iveco = "Грузовой автомобиль Iveco"
    case isuzu = "Грузовой автомобиль Isuzu"
}


enum Transmission: String {
    case manual = "Механическая КП"
    case auto = "Автматическая КП"
}


enum Actions {
    /// Выбор статуса двери
    case doorState
        enum DoorState {
            case open
            case close
        }

    /// Выбор статуса двигателя
    case engineState
        enum EngineState: String {
            case turnOff = "Заглушить двигатель"
            case start = "Запустить двигатель"
        }


    /// Выбор статуса люка
    case sunroofState
        enum SunroofState {
            case open
            case close
        }

    /// Кузов грузовика загрузить или выгрузить
    case bodyState
        enum BodyState: String {
            case loadBody = "Загрузить"
            case uploadBody = "Выгрузить"
        }
}


enum TruckState {
    case truck
    case tractor
}


// MARK: - супер класс CAR (родительский)

class Car {
    /// марка
    let brand: BrandCar
    /// год выпуска
    let year: Int
    /// цвет кузова
    let color: String
    /// трансмиссия
    let transmission: Transmission

    init(brand: BrandCar,
         year: Int,
         color: String,
         transmission: Transmission) {

        self.brand = brand
        self.year = year
        self.color = color
        self.transmission = transmission

    }

    func any () {

    }
}


// MARK:- класс грузовиков

final class TruckCar: Car {
    /// тягач или грузовик
    let truckState: TruckState
    /// грузоподъемность
    let loadCapacity: Double
    /// количество колес
    var wheelsCount: Double
    /// полуприцеп есть или нет
    var istrailer:Bool
    /// Кузов грузовика загрузить или выгрузить
    var bodyState: Actions.BodyState
    /// дистанция за какое-то время
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


        static var countCar = 0

        init(brand: BrandCar,
        year: Int,
        color: String,
        transmission: Transmission,
        truckState: TruckState,
        loadCapacity: Double,
        wheelsCount: Double,
        istrailer:Bool,
        bodyState: Actions.BodyState,
        distance: Int,
        mileage: Int) {

        self.truckState = truckState
        self.loadCapacity = loadCapacity
        self.wheelsCount = wheelsCount
        self.istrailer = istrailer
        self.bodyState = bodyState
        self.distance = distance
        self.mileage = mileage

        super.init(brand: brand,
                   year: year,
                   color: color,
                   transmission: transmission)

        print("\(brand.rawValue) инициализирован и создан в памяти\n")

        /// Счетчик выпущенных грузовиков
        TruckCar.countCar += 1
        print("Всего выпущено \(TruckCar.countCar) машина(-ы)\n")
    }

    deinit {
        print("\(brand.rawValue) удален из памяти\n")

        TruckCar.countCar -= 1
        print("\(TruckCar.countCar) грузовых(-ая) машин(-а) отправлено(-а) на утилизацию\n")
    }

    override func any() {

            bodyState = .loadBody
            print("Производится погрузка\n")
    }

    func bodyUpload() {
            bodyState = .uploadBody
            print("Производится разгрузка\n")

    }

    func printCar() {
        print("Данные об авто:\n - автомобиль - \(brand.rawValue),\n - год выпуска - \(year),\n - цвет - \(color),\n - трансмиссия - \(transmission.rawValue),\n - грузоподъемность - \(loadCapacity) кубов,\n - пробег - \(mileage) км.\n")
    }
}



// MARK: - класс спорткаров

final class SportCar: Car {
    /// Максимальная скорость
    let speedMax: Double
    /// Время разгона
    let timeToMaxSpeed: Double
    /// Кол-во дверей
    let doorCount: Double
    /// Статус дверей
    var doorState: Actions.DoorState
    /// Статус двигателя
    var engineState: Actions.EngineState
    /// Статус люка
    var sunroofState: Actions.SunroofState

    var driver: Driver?

    init (brand: BrandCar,
          year: Int,
          color: String,
          transmission: Transmission,
          speedMax: Double,
          timeToMaxSpeed: Double,
          doorCount: Double,
          doorState: Actions.DoorState,
          engineState: Actions.EngineState,
          sunroofState: Actions.SunroofState) {

        self.speedMax = speedMax
        self.timeToMaxSpeed = timeToMaxSpeed
        self.doorCount = doorCount
        self.doorState = doorState
        self.engineState = engineState
        self.sunroofState = sunroofState

        super.init(brand: brand,
                   year: year,
                   color: color,
                   transmission: transmission)

        print("\(brand.rawValue) инициализирован и создан в памяти\n")
    }

    deinit {
        print("\(brand.rawValue) удален из памяти\n")
    }


    func printSportCar() {
        print("Данные об авто:\n - автомобиль - \(brand),\n - год выпуска - \(year),\n - цвет - \(color),\n - трансмиссия - \(transmission),\n - максимальная скорость - \(speedMax) км,\n - количество секунд до максимального разгона - \(timeToMaxSpeed) сек.\n")
    }
}


// MARK: - класс водителей
class Driver {
    var name: String

    weak var sportCar: SportCar?

    init(name: String) {
        self.name = name

        print("Водитель \(name) принят на работу\n")
    }

    deinit {
        print("Водитель \(name) уволен\n")
    }

}



// MARK: - решение
var sportCarOne: SportCar?

    sportCarOne = SportCar(brand: .astonMartin,
                           year: 2021, color: "Красный",
                           transmission: .auto,
                           speedMax: 220,
                           timeToMaxSpeed: 3,
                           doorCount: 2,
                           doorState: .close,
                           engineState: .turnOff,
                           sunroofState: .close)


var driverOne: Driver?
driverOne = Driver(name: "Василий Иванов")

driverOne?.sportCar = sportCarOne
sportCarOne?.driver = driverOne

sportCarOne = nil
driverOne = nil

var truckCarOne = TruckCar(brand: .daf,
                           year: 2019,
                           color: "Белый",
                           transmission: .auto,
                           truckState: .tractor,
                           loadCapacity: 60,
                           wheelsCount: 8,
                           istrailer: true,
                           bodyState: .loadBody,
                           distance: 0,
                           mileage: 10_000)

truckCarOne.bodyUpload()
truckCarOne.any()
truckCarOne.distance = 25
truckCarOne.distance = 320
truckCarOne.distance = 10_500
print("Пробег стал \(truckCarOne.mileage) км\n")
truckCarOne.printCar()


var sportCarTwo = SportCar(brand: .bugatti, year: 2021, color: "Черный", transmission: .manual, speedMax: 260, timeToMaxSpeed: 3.5, doorCount: 3, doorState: .close, engineState: .start, sunroofState: .open)
sportCarTwo.printSportCar()


// MARK: - вывод на консоль
//Спорткар Aston Martin инициализирован и создан в памяти
//
//Водитель Василий Иванов принят на работу
//
//Спорткар Aston Martin удален из памяти
//
//Водитель Василий Иванов уволен
//
//Грузовой автомобиль DAF инициализирован и создан в памяти
//
//Всего выпущено 1 машина(-ы)
//
//Производится разгрузка
//
//Производится погрузка
//
//Пройден новый участок пути расстоянием 25 км
//
//Пройден новый участок пути расстоянием 295 км
//
//Необходимо сменить масло
//
//Пройден новый участок пути расстоянием 10180 км
//
//Пробег стал 20845 км
//
//Данные об авто:
// - автомобиль - Грузовой автомобиль DAF,
// - год выпуска - 2019,
// - цвет - Белый,
// - трансмиссия - Автматическая КП,
// - грузоподъемность - 60.0 кубов,
// - пробег - 20845 км.
//
//Спорткар Bugatti инициализирован и создан в памяти
//
//Данные об авто:
// - автомобиль - bugatti,
// - год выпуска - 2021,
// - цвет - Черный,
// - трансмиссия - manual,
// - максимальная скорость - 260.0 км,
// - количество секунд до максимального разгона - 3.5 сек.
