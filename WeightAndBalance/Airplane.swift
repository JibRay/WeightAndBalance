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
    
    init() {
        leftMainGear = Mass(weight: 500, arm: -2.0)
        rightMainGear = Mass(weight: 500, arm: -2.0)
        tailWheel = Mass(weight: 75, arm: 205)
        frontSeat = Mass(weight: 0, arm: 9.5)
        rearSeat = Mass(weight: 0, arm: 41.5)
        baggage = Mass(weight: 0, arm: 65)
        fuel = Mass(weight: 0, arm: 22)
    }

    init(leftMainGear: Mass, rightMainGear: Mass, tailWheel: Mass) {
        self.leftMainGear = leftMainGear
        self.rightMainGear = rightMainGear
        self.tailWheel = tailWheel
        frontSeat = Mass(weight: 0, arm: 9.5)
        rearSeat = Mass(weight: 0, arm: 41.5)
        baggage = Mass(weight: 0, arm: 65)
        fuel = Mass(weight: 0, arm: 22)
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
    var weight: Double = 0.0  // In pounds.
    var weightText: String {
        get {
            return "\(weight)"
        }
    }
    var arm: Double = 0.0  // In inches.
    var armText: String {
        get {
            return "\(arm)"
        }
    }
    var moment: Double {
        get {
            return weight * arm
        }
    }
    var momentText: String {
        get {
            return "\(weight * arm)"
        }
    }
}
