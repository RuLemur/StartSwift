import Foundation

enum Freight {
    case wood
    case bag
    case knifes
    case cows
}

protocol Car {
    var engineVolume: Double {get}
    
    func startEngine() -> Void
    func loadUpTrunk(freight: Freight) -> Void
}

extension Car {
    var engineVolume: Double {
        return 2.0
    }
    
    func startEngine() {
        print("Двигатель запущен (extension print)")
    }
    
    func loadUpTrunk(freight: Freight) {
        print("Просто загрузили какой-то груз (extension print)")
    }
    
}

class SportCar: Car {
    var maxSpeed: Int
    
    init(maxSpeed: Int) {
        self.maxSpeed = maxSpeed
    }
    func startEngine() {
        print("Запущен спортивный двигатель")
    }
}


class TrunkCar: Car {
    let payloadCapacity: Int
    
    init(payloadCapacity: Int) {
        self.payloadCapacity = payloadCapacity
    }
    
    func loadUpTrunk(freight: Freight) {
        print("Загрузили много: ", freight)
    }
    
    deinit {
        print("Убит класс")
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Это спортивный автомобиль, максимальная скорость: \(maxSpeed)"
    }
    
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Это грузовой автомобиль, максимальная загрузка: \(payloadCapacity)"
    }
    
}

func doSomeThings() {
    let bmw = SportCar(maxSpeed: 200)
    print(bmw.description)
    bmw.loadUpTrunk(freight: .bag)
    bmw.startEngine()
    
    let man = TrunkCar(payloadCapacity: 4000)
    print(man.description)
    man.loadUpTrunk(freight: .wood)
    man.startEngine()
}

doSomeThings()
