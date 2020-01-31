import UIKit

//Тип коробки передач
enum GearBoxType {
    case manual
    case auto
}

//Виды спортивной машины
enum SportCarType {
    case drift
    case circle
    case onlyRespect
    case dragRace
}

//Виды багажа
enum Freight {
    case bag
    case woods
    case cows
    case bricks
    case matiz
}

class Car {
    let color: String
    let engine: String
    let gearBox: GearBoxType
    let payloadCapacity: Int
    let doorCount: Int
    private(set) var freight: Freight? = nil
    
    init(color: String, engine: String, gearBox: GearBoxType, payloadCapacity: Int, doorCount: Int) {
        self.color = color
        self.engine = engine
        self.gearBox = gearBox
        self.payloadCapacity = payloadCapacity
        self.doorCount = doorCount
    }
    
    func startEngine() {
        fatalError("Необходимо создать класс наследник")
    }
    
    func loadFreight(freight: Freight){
        fatalError("Необходимо создать класс наследник")
    }
    
}

// Trunk car - багажник автомобиля, видимо имелось ввиду грузовой автомобиль - Lorry
class Lorry: Car {
    
    override init(color: String, engine: String, gearBox: GearBoxType, payloadCapacity: Int, doorCount: Int) {
        super.init(color: color, engine: engine, gearBox: gearBox, payloadCapacity: payloadCapacity, doorCount: doorCount)
        print("Создан грузовик с цветом \(color)\nКоробка передач: \(gearBox)\nКоличество Дверей: \(doorCount)")
    }
    
    override func loadFreight(freight: Freight) {
        print("Можно погрузить что хочешь, брат (погружен груз: \(freight))")
    }
    
    override func startEngine() {
        print("Трутутутутутуту (Звук двигателя грузовика)")
    }
    
    deinit {
        print("минус грузовик")
    }
}

class SportCar: Car {
    let sportCarType: SportCarType
    
    init(color: String, engine: String, gearBox: GearBoxType, payloadCapacity: Int, doorCount: Int, sportCarType: SportCarType) {
        self.sportCarType = sportCarType
        super.init(color: color, engine: engine, gearBox: gearBox, payloadCapacity: payloadCapacity, doorCount: doorCount)
        print("Создан спорткар с цветом \(color)\nКоробка передач: \(gearBox)\nКоличество Дверей: \(doorCount)\nДля: \(sportCarType)")
    }
    
    override func loadFreight(freight: Freight) {
        if  freight == .bag {
            print("Сумка влезла еле еле")
        } else {
            print("Пихай \(freight) в фуру, тут нету места")
        }
    }
    
    override func startEngine() {
        print("вжурррррррр (Звук двигателя спорткара)")
    }
    
    deinit {
        print("минус спорткар")
    }
}

//завернул в метод, что бы сработал deinit()
func buildCars() {
    let man = Lorry(color: "White", engine: "V8", gearBox: .manual, payloadCapacity: 4000, doorCount: 2)
    man.loadFreight(freight: .cows)
    man.loadFreight(freight: .matiz)
    man.startEngine()
    print() //для переноса строки
    
    let volvo = Lorry(color: "Black", engine: "V12", gearBox: .auto, payloadCapacity: 5000, doorCount: 2)
    volvo.loadFreight(freight: .woods)
    volvo.loadFreight(freight: .bag)
    volvo.startEngine()
    print()
    
    let bmw = SportCar(color: "Blue", engine: "V6", gearBox: .manual, payloadCapacity: 300, doorCount: 4, sportCarType: .drift)
    bmw.loadFreight(freight: .bag)
    bmw.startEngine()
    print()
    
    let dodge = SportCar(color: "Yellow" , engine: "V8", gearBox: .auto, payloadCapacity: 400, doorCount: 2, sportCarType: .onlyRespect)
    dodge.loadFreight(freight: .woods)
    dodge.startEngine()
    print()
    
}

buildCars()
