//
//  Airplane.swift
//  WeightAndBalance
//
//  Created by Jib Ray on 6/12/23.
//
// All of the airplane components that contribute to the weight and balance
// calculation.

// How to enter new weight and balance data in to this program:
// 1. Measure the weights at the main gear and tailwheel. Using the arm
//    data from the Bearhawk documentation, enter these values in the
//    constants in the init function below.
// 2. Confirm that minCG, maxCG and maxGrossWeight agree with the
//    Bearhawk documentation.

import SwiftUI

@Observable
class Components: ObservableObject {
    let minCG: Double = 10.5    // In inches.
    let maxCG: Double = 21.5
    let maxGrossWeight = 2000.0 // In pounds.
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
            return String(format: "CG = %0.1f inches (limits: \(minCG) to \(maxCG))", centerOfGravity)
        }
    }
    
    // After doing physical weight measurements, edit the values in this
    // function. Make sure the arm values match those specified in the
    // Bearhawk documentation. Weights are in pounds, arms are in inches.
    init() {
        leftMainGear = Mass(weightText: "500", arm: -2.0)
        rightMainGear = Mass(weightText: "500", arm: -2.0)
        tailWheel = Mass(weightText: "65", arm: 205)
        frontSeat = Mass(weightText: "0", arm: 9.5)
        rearSeat = Mass(weightText: "0", arm: 41.5)
        baggage = Mass(weightText: "0", arm: 65)
        fuel = Mass(weightText: "0", arm: 22)
    }
    
    // Update the weight values in this class.
    func update(frontSeat: String, rearSeat: String, baggage: String, fuel: String) {
        self.frontSeat.weightText = frontSeat
        self.rearSeat.weightText = rearSeat
        self.baggage.weightText = baggage
        self.fuel.weightText = fuel
        print("frontSeat: \(frontSeat) rearSeat: \(rearSeat) bagage: \(baggage) fuel: \(fuel)")
    }
}

struct Mass  {
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
