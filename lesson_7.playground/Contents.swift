import Foundation



class Car {
    private var currenTrunkLoad = 0
    
    
    enum Exceptions: Error {
        case NoKeyError
        case NoAvailableSpace
        //        case
    }
    
    func startEngine(isKeyInserted: Bool) throws {
        if isKeyInserted {
            print("Engine started")
        } else {
            throw Exceptions.NoKeyError
        }
    }
    
    func loadFreight(weight: Int) throws {
        if self.currenTrunkLoad + weight <= 500  {
            currenTrunkLoad += weight
            print("Груз погружен в машину")
        } else
        {
            throw Exceptions.NoAvailableSpace
        }
    }
    
    
}

// Совершенно не правильно так делать, но задание выполняется.
// Хотя стоило бы ращнести логику в разные do..catch
var bmw = Car()
do {
    try bmw.startEngine(isKeyInserted: false)
} catch Car.Exceptions.NoKeyError {
    print("Нету ключа в замке зажигания")
    print("Вставим ключ")
    try bmw.startEngine(isKeyInserted: true)
}

do {
    try bmw.loadFreight(weight: 300)
    try bmw.loadFreight(weight: 250)
} catch Car.Exceptions.NoAvailableSpace {
    print("Не хватает места для груза")
}
