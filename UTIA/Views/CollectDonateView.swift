//
//  CollectDonateView.swift
//  test
//
//  Created by Hari krishna on 04/12/21.
//

import SwiftUI



struct CollectDonateView: View {
//    let countries = ["Vietnam","India","China","Malaysia","Lebanon"]
    @EnvironmentObject var listManager: ListManager
    
    @State var firstName = ""
    @State var lastName = ""
    @State var donationAmount = ""
    @State var selectedCountry = ""
    var isButtonDisabled: Bool {
        return firstName.isEmpty || lastName.isEmpty || donationAmount.isEmpty || selectedCountry.isEmpty
        
    }
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            if #available(iOS 15.0, *) {
                LinearGradient(colors: [.teal, .white], startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            } else {
                // Fallback on earlier versions
            }
//            NavigationView {
            
            VStack(spacing: 10) {
            
            TextField("First Name", text: $firstName)
                    .textFieldStyle(.automatic)
                .padding()
            TextField("Last Name", text: $lastName)
                    .textFieldStyle(.automatic)
                .padding()
            TextField("Amount", text: $donationAmount).keyboardType(.decimalPad)
                    .textFieldStyle(.automatic)
                .padding()
            
                TextField("Country",text: $selectedCountry)
                    .keyboardType(.alphabet)
                    .textFieldStyle(.automatic)
                    .padding()
              
                
//            Picker("Select a country", selection: $selectedCountry) {
//                ForEach(countries, id: \.self) { country in
//                    Text("\(country)")
//
//                }
//            }.pickerStyle(.wheel)
            
            Button("Donate") {
                listManager.addDonations(donation: Donate(firstName: firstName, lastName: lastName, country: selectedCountry, amount: Double(donationAmount)!))
                presentationMode.wrappedValue.dismiss()
            }.disabled(isButtonDisabled)
                .foregroundColor(.white)
                .background(isButtonDisabled ? Color.gray : Color.blue)
            
            
            }
//            .navigationBarItems( leading: Button("Back") {
//                presentationMode.wrappedValue.dismiss()
//            })
//            }
        }
    }
}

struct CollectDonateView_Previews: PreviewProvider {
    static var previews: some View {
        CollectDonateView()
    }
}
