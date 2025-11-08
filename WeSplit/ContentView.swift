//
//  ContentView.swift
//  WeSplit
//
//  Created by Shanique Beckford on 11/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState private var amountIsFocused: Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0] // an array that allow users to select a different tip amount
    
        var totalPerPerson: Double {
            // calculate the total per person
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    } // this sends back the code to 0 and calculate the total per person
    
    var body: some View {
        NavigationStack {
            // adds a navigation bar
            Form {
                // everything inside your form
                Section { // reates different sections
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")) // $ means two way binding that is used to update the property with changes in the text field
                    // editable text box
                        .keyboardType(.decimalPad) // modifier that changes the keyboard type
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people") // allow the user to select the amount of people and opens on a different screen
                        }
                    }
                }
                Section("How much do you want to tip?") {
                    // adding segmentaded control for tips
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        // allows the user to select their tip amount
                        ForEach(tipPercentages, id: \.self) {
                            // loop that shows the tip percent 
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented) // shows the tip horizantal and formitted
                }
                    .pickerStyle(.navigationLink) // moves the user to a new screen to make their selection
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } // shows below the text field also calculate and calculate the currency based on the location
            .navigationTitle("WeSplit")
            .toolbar {
                // modifier that specify the toolbar
                if amountIsFocused {
                    // only show the button when the textfield is active
                    Button("Done") {
                        amountIsFocused = false
                        }
                    }
                }
            }
            
    }
}

#Preview {
    ContentView()
}
