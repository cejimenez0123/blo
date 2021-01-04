//
//  ContentView.swift
//  blo
//
//  Created by /fam on 12/30/20.
//

import SwiftUI

struct ContentView: View {
    @State var numberOfPeople: Int=0;
    @State var checkAmount: String="";
    @State var tipPercentage: Int=0;
    @State var tipPercentages=[10,15,20,30];
    
    var totalPerPerson: Double {
        let orderAmount = Double(checkAmount) ?? 0
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        // calculate the total per person here
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
      
    }
    var body: some View {
        
        
            NavigationView {
                Form{
                    TextField("Amount", text: $checkAmount)
                    .keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                    }
                }
                    Section(header: Text("How much tip do you want to leave?")){
                         

                         Picker("Tip percentage", selection: $tipPercentage) {
                             ForEach(0 ..< tipPercentages.count) {
                                 Text("\(self.tipPercentages[$0])%")
                             }
                         }
                         .pickerStyle(SegmentedPickerStyle())
                     }
                    Section(header: Text("Check Amount:")){
                        Text("\(checkAmount)")}
                    Section(header: Text("Total per person:")){
                        Text("\(totalPerPerson)")}
                    Image(systemName: "pencil")
            }
               
                    
                    
                
               
                    
                

                
                   .navigationBarTitle("WeSplit")
               }
        
    }
    
}
            
      
        


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
