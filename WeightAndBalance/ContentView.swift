//
//  ContentView.swift
//  WeightAndBalance
//
//  Created by Jib Ray on 6/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea(.all)
            VStack {
                Text("Weight & Balance N46JR")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                TableView()
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
