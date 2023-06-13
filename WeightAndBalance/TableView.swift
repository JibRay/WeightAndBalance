//
//  TableView.swift
//  WeightAndBalance
//
//  Created by Jib Ray on 6/12/23.
//

import SwiftUI

struct TableView: View {
    @State var components = Components()
    @State var value = 0.0

    let screenWidth = 0.9 * UIScreen.main.bounds.size.width
    let titleFontSize = 18.0
    let valueFontSize = 18.0
    let column1 = 0.31
    let column2 = 0.23
    let column3 = 0.23
    let column4 = 0.23

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        VStack {
            HStack { // Column titles.
                Text(" ")
                    .frame(width: screenWidth * column1)
                    .background(Color.black)
                    .font(.system(size: titleFontSize))
                Text("Weight")
                    .frame(width: screenWidth * column2)
                    .background(Color.white)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                Text("Arm")
                    .frame(width: screenWidth * column3)
                    .background(Color.white)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                Text("Moment")
                    .frame(width: screenWidth * column4)
                    .background(Color.white)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
            }
            HStack { // Main gear left
                Text("Main Gear L")
                    .frame(width: screenWidth * column1, alignment: .leading)
                    .background(Color.white)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                Text(components.leftMainGear.weightText)
                    .frame(width: screenWidth * column2, alignment: .trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
                Text(components.leftMainGear.armText)
                    .frame(width: screenWidth * column3, alignment: .trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
                Text(components.leftMainGear.momentText)
                    .frame(width: screenWidth * column4, alignment: .trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
            }
            HStack { // Main gear right
                Text("Main Gear R")
                    .frame(width: screenWidth * column1, alignment: .leading)
                    .background(Color.white)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                Text(components.rightMainGear.weightText)
                    .frame(width: screenWidth * column2, alignment: .trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
                Text(components.rightMainGear.armText)
                    .frame(width: screenWidth * column3, alignment: .trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
                Text(components.rightMainGear.momentText)
                    .frame(width: screenWidth * column4, alignment: .trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
            }
            HStack { // Tailwheel
                Text("Tailwheel")
                    .frame(width: screenWidth * column1, alignment: .leading)
                    .background(Color.white)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                Text(components.tailWheel.weightText)
                    .frame(width: screenWidth * column2, alignment: .trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
                Text(components.tailWheel.armText)
                    .frame(width: screenWidth * column3, alignment: .trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
                Text(components.tailWheel.momentText)
                    .frame(width: screenWidth * column4, alignment: .trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
            }
            HStack { // Front seat
                Text("Front seat")
                    .frame(width: screenWidth * column1, alignment: .leading)
                    .background(Color.white)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                TextField("", value: $components.frontSeat.weight, formatter: formatter, onEditingChanged: { (changed)
                    in components.update() })
                    .frame(width: screenWidth * column2)
                    .multilineTextAlignment(.trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)

                Text(components.frontSeat.armText)
                    .frame(width: screenWidth * column3, alignment: .trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
                Text(components.frontSeat.momentText)
                    .frame(width: screenWidth * column4, alignment: .trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
            }
            HStack { // Rear seat
                Text("Rear seat")
                    .frame(width: screenWidth * column1, alignment: .leading)
                    .background(Color.white)
                    .font(.system(size: titleFontSize))
                    .border(.blue)
                TextField("", value: $components.rearSeat.weight, formatter: formatter, onEditingChanged: { (changed)
                    in components.update() })
                    .frame(width: screenWidth * column2)
                    .multilineTextAlignment(.trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
                Text(components.rearSeat.armText)
                    .frame(width: screenWidth * column3, alignment: .trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
                Text(components.rearSeat.momentText)
                    .frame(width: screenWidth * column4, alignment: .trailing)
                    .background(Color.white)
                    .font(.system(size: valueFontSize))
                    .keyboardType(.decimalPad)
                    .border(.blue)
            }
        }
    }
}

