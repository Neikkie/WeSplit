//
//  ContentView.swift
//  WeSplit
//
//  Created by Shanique Beckford on 11/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    // without @State (property wrapper and values can be stored and modified) the button is immutable because its is built on a struct that cannot be change values freely
   @State private var name = ""
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0] // allow users to select a fifferent tip amount
    var body: some View {
        
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
        NavigationStack {
            // adds a navigation bar
            Form {
                // everything inside your form
                Section { // reates different sections
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")) // $ means two way binding that is used to update the property with changes in the text field
                    // editable text box
                        .keyboardType(.decimalPad) // modifier that changes the keyboard type
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people") // allow the user to select the amount of people
                        }
                    }
                }
                Section {
                    // adding segmentaded control for tips
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        // allows the user to select their tip amount
                        ForEach(tipPercentages, id: \.self) {
                            // loop that 
                            Text($0, format: .percent)
                        }
                    }
                }
                    .pickerStyle(.navigationLink) // moves the user to a new screen to make their selection
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")) // shows below the text field
                }
            }
            .navigationTitle("")
    }
}

#Preview {
    ContentView()
}
