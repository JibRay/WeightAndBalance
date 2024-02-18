//
//  ContentView.swift
//  WeightAndBalance
//
//  Created by Jib Ray on 6/12/23.
//
// See notes in Airplane.swift.

import SwiftUI

let screenWidth = 0.95 * UIScreen.main.bounds.size.width

struct ContentView: View {
    @State var components = Components()

    var body: some View {
        ZStack {
            Color(.darkGray).ignoresSafeArea(.all)
            VStack {
                Text("N46JR Weight & Balance")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                TableView(width: screenWidth, components: components)
                GraphView(width: screenWidth, height: 200, components: components)
                Spacer()
            }
            
        }
        /*
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
