import UIKit

enum EngineState: String{
    case start = "Двигатель запущен"
    case stop = "Двигатель остановлен"
}

enum WindowsState: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}


struct Car {
    let brand: String
    let model: String
    let year: Int
    let bootVolume: Int
    let bodyVolume: Int
    
    var engineState: EngineState = .stop {
        willSet{
            if newValue == .start{
                print("Подана команда запуска двигателя")
            } else {
                print("Подана команда остановки двигателя")
            }
        }
    }
    var windowsState: WindowsState = .close
    var curentBootLoad: Int = 0
    
    mutating func changeWindowsState(wind: WindowsState) {
        windowsState = wind
    }
    
    mutating func uploadStuff(mass: Int) -> Bool {
        if curentBootLoad + mass > bodyVolume {
            print("столько не влезает")
            return false
        } else {
            curentBootLoad = curentBootLoad + mass
            return true
        }
    }
    
    func getCarInfo() -> String {
        return "Бренд: \(self.brand)\nМодель: \(self.model)\nГод: \(self.year)\n" +
            "Загрузка багажника \(curentBootLoad) из \(bootVolume)\n" +
            "Объем салона \(bodyVolume)\n\(windowsState.rawValue)\n" +
        "\(engineState.rawValue)"
    }
    
}

struct Truck {
    let brand: String
    let model: String
    let year: Int
    let bootVolume: Int
    let bodyVolume: Int
    
    var engineState: EngineState = .stop {
        willSet{
            if newValue == .start{
                print("Подана команда запуска двигателя")
            } else {
                print("Подана команда остановки двигателя")
            }
        }
    }
    var windowsState: WindowsState = .close
    var curentBootLoad: Int = 0
    
    mutating func changeWindowsState(wind: WindowsState) {
        windowsState = wind
    }
    
    mutating func uploadStuff(mass: Int) -> Bool {
        if curentBootLoad + mass > bodyVolume {
            print("столько не влезает")
            return false
        } else {
            curentBootLoad = curentBootLoad + mass
            return true
        }
    }
    
    func getTruckInfo() -> String {
        return "Бренд: \(self.brand)\nМодель: \(self.model)\nГод: \(self.year)\n" +
            "Загрузка багажника \(curentBootLoad) из \(bootVolume)\n" +
            "Объем салона \(bodyVolume)\n\(windowsState.rawValue)\n" +
        "\(engineState.rawValue)"
    }
}


var bmw = Car(brand: "BMW", model: "320i", year: 2016, bootVolume: 320, bodyVolume: 600)
bmw.uploadStuff(mass: 200)
bmw.engineState = EngineState.start
bmw.changeWindowsState(wind: .open)
print(bmw.getCarInfo(), "\n")


var man = Truck(brand: "MAN", model: "HERO", year: 1990, bootVolume: 4000, bodyVolume: 400, curentBootLoad: 3000)
man.uploadStuff(mass: -3000)
man.engineState = .stop
man.changeWindowsState(wind: .close)
print(man.getTruckInfo())


