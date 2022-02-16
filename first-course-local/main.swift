//
//  main.swift
//  first-course-local
//
//  Created by Natalya Murygina on 07.02.2022.
//

import Foundation


// MARK: - Перечисления

/// Марки спорткаров
enum BrandSportCar {
    case bmw
    case mercedes
    case astonMartin
    case audiR8
    case bugatti
    case corvette
}

/// Марки грузовиков
enum BrandTruсkCar {
    case scania
    case volvo
    case daf
    case man
    case iveco
    case isuzu
}

/// Выбор цвета
enum ColorCollection: String {
    case red = "Красный"
    case blue = "Синий"
    case green = "Зеленый"
    case yellow = "Желтый"
    case black = "Черный"
    case wite = "Белый"
    case silver = "Серебряный"
}

/// Выбор трансмиссии
enum Transmission: String {
    case manual = "Механическая КП"
    case auto = "Автматическая КП"
}

/// Выбор статуса двери
enum DoorState: String {
    case open = "Открыть дверь"
    case close = "Закрыть дверь"
}

/// Выбор статуса багажника спорткара
enum TrunkState: String {
    case load = "Загрузить в багажник"
    case upload = "Достать из багажника"
}

/// Выбор статуса кузова грузовика
enum BodyState: String {
    case loadBody = "Загрузить"
    case uploadBody = "Выгрузить"
}

/// Выбор статуса двигателя
enum EngineState: String {
    case turnOff = "Заглушить двигатель"
    case start = "Запустить двигатель"
}

// MARK: - СпортКар

/// Структура спорткара
struct SportCar {

    /// марка
    let brand: BrandSportCar

    /// цвет
    let color: ColorCollection

    /// максимальная скорость
    let speedMax: Double

    /// трансмиссия
    let transmission: Transmission

    /// объем двигателя в кубах
    let engineCapacity: Double

    /// мощьность двигателя в л.с.
    let enginePower: Double

    /// имеется ли mp3
    var mp3: Bool

    /// пробег в км
    var carMileage: Double {
        didSet {
            let carMileage = carMileage + km
            print("Пробег \(brand) увеличился на \(carMileage) км")
        }
    }

    /// дистанция за сегодня
    var km: Double {
        didSet {
            let distance = km - oldValue
            print("Пройден новый участок пути расстоянием \(distance)")
        }
    }

    /// статус двери
    var doorStateCar: DoorState {
        willSet {
            if newValue == .open {
                print("Двери сейчас откроются")
            } else {
                print("Двери сейчас закроются")
            }
        }
    }

    /// статус двигателя
    var engineStateCar: EngineState {
        willSet {
            if newValue == .start {
            print("Двигатель сейчас заведется")
            } else {
                print("Двигатель сейчас заглохнет")
            }
        }
    }

    /// статус багажника спорткара
    var trunkStateCar: TrunkState {
    willSet {
        if newValue == .load {
            print("Вещи в багажник будут погружены")
        } else {
            print("Вещи из багажника будут выгружены")
        }
    }
}

    /// объем багажника в литрах
    let trunkVolume: Double

    init (brand: BrandSportCar,
          color: ColorCollection,
          speedMax: Double,
          transmission: Transmission,
          engineCapacity: Double,
          enginePower: Double,
          mp3: Bool,
          carMileage: Double,
          km: Double,
          doorStateCar: DoorState,
          engineStateCar: EngineState,
          trunkStateCar: TrunkState,
          trunkVolume: Double) {

        self.brand = brand
        self.color = color
        self.speedMax = speedMax
        self.transmission = transmission
        self.engineCapacity = enginePower
        self.enginePower = enginePower
        self.mp3 = mp3
        self.carMileage = carMileage
        self.km = km
        self.doorStateCar = doorStateCar
        self.engineStateCar = engineStateCar
        self.trunkStateCar = trunkStateCar
        self.trunkVolume = trunkVolume

    }
}

// MARK: - Грузовик

/// Структура грузовика
struct TruckCar {

    /// марка
    let brand: BrandTruсkCar

    /// цвет
    let color: ColorCollection

    /// максимальная скорость в км
    let speedMax: Double

    /// трансмиссия
    let transmission: Transmission

    /// имеется ли mp3
    var mp3: Bool

    /// пробег в км
    var carMileage: Double {
        didSet {
            let carMileage = carMileage + km
            print("Пробег \(brand) увеличился на \(carMileage) км")
        }
    }

    /// дистанция за сегодня в км
    var km: Double {
        didSet {
            let distance = km - oldValue
            print("Пройден новый участок пути расстоянием \(distance)")
        }
    }

    /// статус двери
    var doorStateCar: DoorState

    /// статус двигателя
    var engineStateCar: EngineState {
        willSet {
            if newValue == .start {
            print("Двигатель сейчас заведется")
            } else {
                print("Двигатель сейчас заглохнет")
            }
        }
    }

    /// статус кузова грузовика
    var bodyStateCar: BodyState {
        willSet {
            if newValue == .loadBody {
                print("Погрузка скоро будет осуществлена")
            } else {
                print("Разгрузка скоро начнется")
            }
        }
    }

    /// объем кузова грузовика в кубах
    let bodyVolume: Double

    /// метод mutating
    mutating func closeDoor() {
        self.doorStateCar = .close
        self.mp3 = false
        print("При закрытии двери, mp3 перестает работать")
    }

    mutating func openDoor() {
        self.doorStateCar = .open
        self.mp3 = true
        print("При открытии двери, mp3 начинает работать")
    }

    /// метод
    func printDistance() {
        print("Автомобиль \(brand) проехал \(km)")
    }

    func stateAuto() {
        print("Автомобиль \(brand), цвет - \(color), максимальная скорость - , трансмиссия - ")
    }
}



// MARK: - Решение

/// Спорткары
var sportCarOne = SportCar(brand: .bmw,
                           color: .black,
                           speedMax: 180,
                           transmission: .manual,
                           engineCapacity: 6,
                           enginePower: 590,
                           mp3: true,
                           carMileage: 2_000,
                           km: 0,
                           doorStateCar: .open,
                           engineStateCar: .turnOff,
                           trunkStateCar: .upload,
                           trunkVolume: 286)


var sportCarTwo = SportCar(brand: .audiR8,
                           color: .blue,
                           speedMax: 220,
                           transmission: .auto,
                           engineCapacity: 5.8,
                           enginePower: 620,
                           mp3: true,
                           carMileage: 15_300,
                           km: 5,
                           doorStateCar: .open,
                           engineStateCar: .start,
                           trunkStateCar: .upload,
                           trunkVolume: 220)


var sportCarThree = SportCar(brand: .bugatti,
                            color: .green,
                            speedMax: 240,
                            transmission: .auto,
                            engineCapacity: 6.2,
                            enginePower: 625,
                            mp3: true,
                            carMileage: 30_240,
                            km: 14,
                            doorStateCar: .close,
                            engineStateCar: .start,
                            trunkStateCar: .load,
                            trunkVolume: 120)


var sportCarFour = SportCar(brand: .corvette,
                            color: .red,
                            speedMax: 210,
                            transmission: .auto,
                            engineCapacity: 6,
                            enginePower: 595,
                            mp3: true,
                            carMileage: 0,
                            km: 0,
                            doorStateCar: .close,
                            engineStateCar: .start,
                            trunkStateCar: .upload,
                            trunkVolume: 100)


var sportCarFive = SportCar(brand: .astonMartin,
                            color: .silver,
                            speedMax: 280,
                            transmission: .auto,
                            engineCapacity: 6.8,
                            enginePower: 670,
                            mp3: true,
                            carMileage: 5_700,
                            km: 60,
                            doorStateCar: .open,
                            engineStateCar: .turnOff,
                            trunkStateCar: .load,
                            trunkVolume: 0)

var sportCarSix = SportCar(brand: .mercedes,
                           color: .yellow,
                           speedMax: 206,
                           transmission: .manual,
                           engineCapacity: 5.5,
                           enginePower: 570,
                           mp3: true,
                           carMileage: 12_000,
                           km: 25,
                           doorStateCar: .close,
                           engineStateCar: .turnOff,
                           trunkStateCar: .upload,
                           trunkVolume: 300)


/// Траки
var truckOne = TruckCar(brand: .daf,
                        color: .blue,
                        speedMax: 180,
                        transmission: .auto,
                        mp3: false,
                        carMileage: 120_000,
                        km: 30,
                        doorStateCar: .close,
                        engineStateCar: .turnOff,
                        bodyStateCar: .loadBody,
                        bodyVolume: 60)


var truckTwo = TruckCar(brand: .isuzu,
                        color: .black,
                        speedMax: 160,
                        transmission: .manual,
                        mp3: true,
                        carMileage: 250_000,
                        km: 0,
                        doorStateCar: .close,
                        engineStateCar: .start,
                        bodyStateCar: .uploadBody,
                        bodyVolume: 40)


var truckThree = TruckCar(brand: .iveco,
                          color: .green,
                          speedMax: 170,
                          transmission: .auto,
                          mp3: true,
                          carMileage: 5_000,
                          km: 120,
                          doorStateCar: .open,
                          engineStateCar: .start,
                          bodyStateCar: .loadBody,
                          bodyVolume: 50)


var truckFour = TruckCar(brand: .man,
                         color: .silver,
                         speedMax: 180,
                         transmission: .auto,
                         mp3: true,
                         carMileage: 0,
                         km: 0,
                         doorStateCar: .close,
                         engineStateCar: .turnOff,
                         bodyStateCar: .uploadBody,
                         bodyVolume: 60)


var truckFive = TruckCar(brand: .scania,
                         color: .wite,
                         speedMax: 185,
                         transmission: .auto,
                         mp3: true,
                         carMileage: 10_000,
                         km: 45,
                         doorStateCar: .open,
                         engineStateCar: .turnOff,
                         bodyStateCar: .loadBody,
                         bodyVolume: 50)


var truckSix = TruckCar(brand: .volvo,
                        color: .wite,
                        speedMax: 160,
                        transmission: .auto,
                        mp3: true,
                        carMileage: 25_000,
                        km: 200,
                        doorStateCar: .close,
                        engineStateCar: .start,
                        bodyStateCar: .uploadBody,
                        bodyVolume: 60)

// MARK: - Работа с консолью

print(sportCarOne.km)
print(sportCarTwo.enginePower)
print(sportCarThree.engineStateCar.rawValue)
print(sportCarFour.doorStateCar.rawValue)
print(sportCarFive.carMileage)
print(sportCarSix.color.rawValue)
print(truckOne.color.rawValue)
print(truckTwo.bodyStateCar.rawValue)
print(truckThree.carMileage)
sportCarFive.km = 120
sportCarFive.km = 160
sportCarFive.carMileage = sportCarFive.km + 300
sportCarTwo.doorStateCar = .open
truckThree.bodyStateCar = .loadBody
truckTwo.km = 150
truckTwo.printDistance()
print(truckSix.doorStateCar.rawValue, truckSix.mp3)
truckSix.openDoor()


// Выводы на консоль
//0.0
//620.0
//Запустить двигатель
//Закрыть дверь
//5700.0
//Желтый
//Синий
//Выгрузить
//5000.0
//Пройден новый участок пути расстоянием 60.0
//Пройден новый участок пути расстоянием 40.0
//Пробег astonMartin увеличился на 620.0 км
//Двери сейчас откроются
//Погрузка скоро будет осуществлена
//Пройден новый участок пути расстоянием 150.0
//Автомобиль isuzu проехал 150.0
//Закрыть дверь true
//При открытии двери, mp3 начинает работать



