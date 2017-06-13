//: Playground - noun: a place where people can play

import UIKit

protocol Spaceship: CustomStringConvertible{
    var isFlying: Bool {get set}
    var make: String {get set}
    var model: String {get set}
    
    mutating func launch()
    mutating func land()
}

extension Spaceship{
    
    var makeModel: String{
        return "\(make) \(model)"
    }
    
    mutating func launch(){
        if isFlying{
            print("already launched!")
        }
        else{
            isFlying = true
            print("\(self.description)blast off!")
        }
    }
    mutating func land(){
        if isFlying{
            isFlying = false
            print("\(self.description) landed")
        }
        else{
            print("already landed!")
        }
    }
}

struct TIEFighter: Spaceship{
    var isFlying: Bool = false
    var make: String
    var model: String
    
    var description: String {
        return self.makeModel
    }
}

class MilleniumFalcon: Spaceship {
    var isFlying: Bool = false
    var make: String
    var model: String
    
    var description: String {
        return self.makeModel
    }
    
    init(isFlying: Bool, make: String, model: String){
        self.isFlying = isFlying
        self.make = make
        self.model = model
    }
    
    func fireLasers(){
        print("PEW PEW PEW")
    }
    
}


var tieFighter = TIEFighter(isFlying: false, make: "Tie", model: "Fighter")
var mFalcon = MilleniumFalcon(isFlying: false, make: "MileniumFalcon", model: "XX3")

tieFighter.launch()
mFalcon.launch()
mFalcon.fireLasers()

var spaceShips: Array<Spaceship> = [tieFighter, mFalcon]

for spaceship in spaceShips{
    print("\(spaceship)")
}















