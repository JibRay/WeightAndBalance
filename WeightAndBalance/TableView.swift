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
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: titleFontSize))
                    .border(Color(.boarder))
                    .padding(.trailing, -8)
                Text("Arm")
                    .frame(width: width! * column3)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: titleFontSize))
                    .border(Color(.boarder))
                    .padding(.trailing, -8)
                Text("Moment")
                    .frame(width: width! * column4)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: titleFontSize))
                    .border(Color(.boarder))
            }
            FixedRowView(title: "Main Gear L", width: width!,
                         values: [components!.leftMainGear.weightText,
                                  components!.leftMainGear.armText,
                                  components!.leftMainGear.momentText])
            FixedRowView(title: "Main Gear R", width: width!,
                         values: [components!.rightMainGear.weightText,
                                  components!.rightMainGear.armText,
                                  components!.rightMainGear.momentText])
            FixedRowView(title: "Tailwheel", width: width!,
                         values: [components!.tailWheel.weightText,
                                  components!.tailWheel.armText,
                                  components!.tailWheel.momentText])
            
            // User input section:
            
            HStack { // Front seat
                Text("Front seat")
                    .frame(width: width! * column1, alignment: .leading)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: titleFontSize))
                    .border(Color(.boarder))
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
                    .border(Color(.boarder))
                    .padding(.trailing, -8)
                Text(components!.frontSeat.armText)
                    .frame(width: width! * column3, alignment: .trailing)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: valueFontSize))
                    .border(Color(.boarder))
                    .padding(.trailing, -8)
                Text(components!.frontSeat.momentText)
                    .frame(width: width! * column4, alignment: .trailing)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: valueFontSize))
                    .border(Color(.boarder))
            }.padding(.top, -15.0)
            HStack { // Rear seat
                Text("Rear seat")
                    .frame(width: width! * column1, alignment: .leading)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: titleFontSize))
                    .border(Color(.boarder))
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
                    .border(Color(.boarder))
                    .padding(.trailing, -8)
                Text(components!.rearSeat.armText)
                    .frame(width: width! * column3, alignment: .trailing)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: valueFontSize))
                    .border(Color(.boarder))
                    .padding(.trailing, -8)
                Text(components!.rearSeat.momentText)
                    .frame(width: width! * column4, alignment: .trailing)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: valueFontSize))
                    .border(Color(.boarder))
            }.padding(.top, -15.0)
            HStack { // Baggage
                Text("Baggage")
                    .frame(width: width! * column1, alignment: .leading)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: titleFontSize))
                    .border(Color(.boarder))
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
                    .border(Color(.boarder))
                    .padding(.trailing, -8)
                Text(components!.baggage.armText)
                    .frame(width: width! * column3, alignment: .trailing)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: valueFontSize))
                    .border(Color(.boarder))
                    .padding(.trailing, -8)
                Text(components!.baggage.momentText)
                    .frame(width: width! * column4, alignment: .trailing)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: valueFontSize))
                    .border(Color(.boarder))
            }.padding(.top, -15.0)
            HStack { // Fuel
                Text("Fuel")
                    .frame(width: width! * column1, alignment: .leading)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: titleFontSize))
                    .border(Color(.boarder))
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
                    .border(Color(.boarder))
                    .padding(.trailing, -8)
                Text(components!.fuel.armText)
                    .frame(width: width! * column3, alignment: .trailing)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: valueFontSize))
                    .border(Color(.boarder))
                    .padding(.trailing, -8)
                Text(components!.fuel.momentText)
                    .frame(width: width! * column4, alignment: .trailing)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: valueFontSize))
                    .border(Color(.boarder))
            }.padding(.top, -15.0)
            
            HStack { // Totals
                Text("Totals")
                    .frame(width: width! * column1, alignment: .trailing)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: titleFontSize))
                    .border(Color(.boarder))
                    .padding(.trailing, -8)
                Text(components!.totalWeightText)
                    .frame(width: width! * column2, alignment: .trailing)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: valueFontSize))
                    .border(Color(.boarder))
                    .padding(.trailing, -8)
                Text(" ")
                    .frame(width: width! * column3, alignment: .trailing)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: valueFontSize))
                    .border(Color(.boarder))
                    .padding(.trailing, -8)
                Text(components!.totalMomentText)
                    .frame(width: width! * column4, alignment: .trailing)
                    .background(Color(.readOnlyBackground))
                    .font(.system(size: valueFontSize))
                    .border(Color(.boarder))
            }.padding(.top, -15.0)
            Text(components!.summaryText)
                .frame(width: width!, alignment: .center)
                .background(Color(.readOnlyBackground))
                .font(.system(size: valueFontSize))
                .border(Color(.boarder))
            
            Button("Update") {
                components!.update(frontSeat: frontSeatWeightText, rearSeat: rearSeatWeightText, baggage: baggageWeightText, fuel: fuelWeightText)
            } .foregroundColor(.white)
        }
    }
}

struct FixedRowView: View {
    let title: String?
    let values: [String]?
    let width: CGFloat?
    let titleFontSize = 18.0
    let valueFontSize = 18.0
    
    // Relative column widths.
    let column1 = 0.31
    let column2 = 0.23
    let column3 = 0.23
    let column4 = 0.23

    init(title: String, width: CGFloat, values: [String]) {
        self.title = title
        self.width = width
        self.values = values
    }

    var body: some View {
        HStack {
            Text(title!)
                .frame(width: width! * column1, alignment: .leading)
                .background(Color(.readOnlyBackground))
                .font(.system(size: titleFontSize))
                .border(Color(.boarder))
                .padding(.trailing, -8)
            Text(values![0])
                .frame(width: width! * column2, alignment: .trailing)
                .background(Color(.readOnlyBackground))
                .font(.system(size: valueFontSize))
                .border(Color(.boarder))
                .padding(.trailing, -8)
            Text(values![1])
                .frame(width: width! * column3, alignment: .trailing)
                .background(Color(.readOnlyBackground))
                .font(.system(size: valueFontSize))
                .border(Color(.boarder))
                .padding(.trailing, -8)
            Text(values![2])
                .frame(width: width! * column4, alignment: .trailing)
                .background(Color(.readOnlyBackground))
                .font(.system(size: valueFontSize))
                .border(Color(.boarder))
        }
    }
}

