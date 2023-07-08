//
//  TableView.swift
//  WeightAndBalance
//
//  Created by Jib Ray on 6/12/23.
//

import SwiftUI

// Table of weight and balance values.
struct TableView: View {
    @State private var frontSeatWeightText: String = "0"
    @State private var rearSeatWeightText: String = "0"
    @State private var baggageWeightText: String = "0"
    @State private var fuelWeightText: String = "0"
    
    let components: Components?
    let width: CGFloat?
    let titleFontSize = 18.0
    let valueFontSize = 18.0
    
    // Relative column widths.
    let column1 = 0.31
    let column2 = 0.23
    let column3 = 0.23
    let column4 = 0.23
    
    let readOnlyColor = Color(red: 0.85, green: 0.85, blue: 0.9)
    
    init(width: CGFloat, components: Components) {
        self.width = width
        self.components = components
    }

    var body: some View {
        VStack {
            HStack { // Column titles.
                Text(" ")
                    .frame(width: width! * column1)
                    .background(Color.black)
                    .font(.system(size: titleFontSize))
                    .padding(.trailing, -8)
                Text("Weight")
                    .frame(width: width! * column2)
                    .background(readOnlyColor)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text("Arm")
                    .frame(width: width! * column3)
                    .background(readOnlyColor)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text("Moment")
                    .frame(width: width! * column4)
                    .background(readOnlyColor)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
            }
            HStack { // Main gear left
                Text("Main Gear L")
                    .frame(width: width! * column1, alignment: .leading)
                    .background(readOnlyColor)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.leftMainGear.weightText)
                    .frame(width: width! * column2, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.leftMainGear.armText)
                    .frame(width: width! * column3, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.leftMainGear.momentText)
                    .frame(width: width! * column4, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
            }
            HStack { // Main gear right
                Text("Main Gear R")
                    .frame(width: width! * column1, alignment: .leading)
                    .background(readOnlyColor)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.rightMainGear.weightText)
                    .frame(width: width! * column2, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.rightMainGear.armText)
                    .frame(width: width! * column3, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.rightMainGear.momentText)
                    .frame(width: width! * column4, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
            }
            HStack { // Tailwheel
                Text("Tailwheel")
                    .frame(width: width! * column1, alignment: .leading)
                    .background(readOnlyColor)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.tailWheel.weightText)
                    .frame(width: width! * column2, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.tailWheel.armText)
                    .frame(width: width! * column3, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.tailWheel.momentText)
                    .frame(width: width! * column4, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
            }
            HStack { // Front seat
                Text("Front seat")
                    .frame(width: width! * column1, alignment: .leading)
                    .background(readOnlyColor)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                TextField("", text: $frontSeatWeightText,
                          onEditingChanged: {
                            (changed)
                    in components!.update(frontSeat: frontSeatWeightText, rearSeat: rearSeatWeightText, baggage: baggageWeightText, fuel: fuelWeightText) })
                .onTapGesture { frontSeatWeightText = ""}
                    .frame(width: width! * column2)
                    .multilineTextAlignment(.trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.frontSeat.armText)
                    .frame(width: width! * column3, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.frontSeat.momentText)
                    .frame(width: width! * column4, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
            }.padding(.top, -15.0)
            HStack { // Rear seat
                Text("Rear seat")
                    .frame(width: width! * column1, alignment: .leading)
                    .background(readOnlyColor)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                TextField("", text: $rearSeatWeightText,
                          onEditingChanged: {
                            (changed)
                            in components!.update(frontSeat: frontSeatWeightText, rearSeat: rearSeatWeightText, baggage: baggageWeightText, fuel: fuelWeightText) })
                    .onTapGesture { rearSeatWeightText = "" }
                    .frame(width: width! * column2)
                    .multilineTextAlignment(.trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.rearSeat.armText)
                    .frame(width: width! * column3, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.rearSeat.momentText)
                    .frame(width: width! * column4, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
            }.padding(.top, -15.0)
            HStack { // Baggage
                Text("Baggage")
                    .frame(width: width! * column1, alignment: .leading)
                    .background(readOnlyColor)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                TextField("", text: $baggageWeightText,
                          onEditingChanged: {
                            (changed)
                            in components!.update(frontSeat: frontSeatWeightText, rearSeat: rearSeatWeightText, baggage: baggageWeightText, fuel: fuelWeightText) })
                    .onTapGesture { baggageWeightText = "" }
                    .frame(width: width! * column2)
                    .multilineTextAlignment(.trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.baggage.armText)
                    .frame(width: width! * column3, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.baggage.momentText)
                    .frame(width: width! * column4, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
            }.padding(.top, -15.0)
            HStack { // Fuel
                Text("Fuel")
                    .frame(width: width! * column1, alignment: .leading)
                    .background(readOnlyColor)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                TextField("", text: $fuelWeightText,
                          onEditingChanged: {
                            (changed)
                            in components!.update(frontSeat: frontSeatWeightText, rearSeat: rearSeatWeightText, baggage: baggageWeightText, fuel: fuelWeightText) })
                    .onTapGesture { fuelWeightText = "" }
                    .frame(width: width! * column2)
                    .multilineTextAlignment(.trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.fuel.armText)
                    .frame(width: width! * column3, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.fuel.momentText)
                    .frame(width: width! * column4, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
            }.padding(.top, -15.0)
            HStack { // Totals
                Text("Totals")
                    .frame(width: width! * column1, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.totalWeightText)
                    .frame(width: width! * column2, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(" ")
                    .frame(width: width! * column3, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
                    .padding(.trailing, -8)
                Text(components!.totalMomentText)
                    .frame(width: width! * column4, alignment: .trailing)
                    .background(readOnlyColor)
                    .font(.system(size: valueFontSize))
                    .border(.blue)
            }.padding(.top, -15.0)
            Text(components!.summaryText)
                .frame(width: width!, alignment: .center)
                .background(readOnlyColor)
                .font(.system(size: valueFontSize))
                .border(.blue)
        }
    }
}

