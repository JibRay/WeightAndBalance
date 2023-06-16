//
//  Airplane.swift
//  WeightAndBalance
//
//  Created by Jib Ray on 6/12/23.
//

import SwiftUI

struct Components {
    var leftMainGear: Mass
    var rightMainGear: Mass
    var tailWheel: Mass
    var frontSeat: Mass
    var rearSeat: Mass
    var baggage: Mass
    var fuel: Mass
    var emptyWeight: Double {
        get {
            return leftMainGear.weight + rightMainGear.weight + tailWheel.weight
        }
    }
    var emptyMoment: Double {
        get {
            return leftMainGear.moment + rightMainGear.moment + tailWheel.moment
        }
    }
    var totalWeight: Double {
        get {
            return emptyWeight + frontSeat.weight + rearSeat.weight
            + baggage.weight + fuel.weight
        }
    }
    var totalWeightText: String {
        get {
            return String(format: "%0.1f", totalWeight)
        }
    }
    var totalMoment: Double {
        get {
            return emptyMoment + frontSeat.moment + rearSeat.moment
            + baggage.moment + fuel.moment
        }
    }
    var totalMomentText: String {
        get {
            return String(format: "%0.1f", totalMoment)
        }
    }
    var centerOfGravity: Double {
        get {
            return totalMoment / totalWeight
        }
    }
    var centerOfGravityText: String {
        get {
            return String(format: "%0.1f", centerOfGravity)
        }
    }
    var summaryText: String {
        get {
            return String(format: "CG = %0.1f inches (limits: 10.5 to 21.5)", centerOfGravity)
        }
    }
    
    init() {
        leftMainGear = Mass(weightText: "500", arm: -2.0)
        rightMainGear = Mass(weightText: "500", arm: -2.0)
        tailWheel = Mass(weightText: "75", arm: 205)
        frontSeat = Mass(weightText: "0", arm: 9.5)
        rearSeat = Mass(weightText: "0", arm: 41.5)
        baggage = Mass(weightText: "0", arm: 65)
        fuel = Mass(weightText: "0", arm: 22)
    }

    init(leftMainGear: Mass, rightMainGear: Mass, tailWheel: Mass) {
        self.leftMainGear = leftMainGear
        self.rightMainGear = rightMainGear
        self.tailWheel = tailWheel
        frontSeat = Mass(weightText: "0", arm: 9.5)
        rearSeat = Mass(weightText: "0", arm: 41.5)
        baggage = Mass(weightText: "0", arm: 65)
        fuel = Mass(weightText: "0", arm: 22)
    }

    init(leftMainGear: Mass, rightMainGear: Mass, tailWheel: Mass, frontSeat: Mass, rearSeat: Mass, baggage: Mass, fuel: Mass) {
        self.leftMainGear = leftMainGear
        self.rightMainGear = rightMainGear
        self.tailWheel = tailWheel
        self.frontSeat = frontSeat
        self.rearSeat = rearSeat
        self.baggage = baggage
        self.fuel = fuel
    }
    
    func update() {
    }
}

struct Mass {
    // Weights are the only values input by the user. Because of the way
    // TextFields behave, weight's point of truth needs to be the text.
    var weightText = "0"  // In pounds.
    var weight: Double {
        get {
            if let w = Double(weightText) {
                return w
            } else {
                return 0.0
            }
        }
    }
    var arm: Double = 0.0  // In inches.
    var armText: String {
        get {
            return String(format: "%0.1f", arm)
        }
    }
    var moment: Double {
        get {
            return weight * arm
        }
    }
    var momentText: String {
        get {
            return String(format: "%0.1f", moment)
        }
    }
}
