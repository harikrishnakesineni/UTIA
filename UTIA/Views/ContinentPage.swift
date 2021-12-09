//
//  NewPage.swift
//  test
//
//  Created by Hari krishna on 24/11/21.
//

import SwiftUI

struct ContinentPage: View {
//    let countries = ["India", "China", "Japan", "Korea"]
    @State var selectedCountry = 0 //India
    @State var amount = ""
    @EnvironmentObject var listManager: ListManager
    @State var firstName = ""
    @State var lastName = ""
    @State var doICare = false
     var isDisabled:Bool {
     return firstName.isEmpty || lastName.isEmpty || amount.isEmpty
        
    }
    @State var region:String = "Asia"
    @State var selectedCountryName = ""
    @State private var countries: [Country] = [Country]()
    var body: some View {
            
                Form {
                Section(header: Text("Select a country from the list")) {
//                    Picker("Select a country", selection: $selectedCountry) {
//                        ForEach(listManager.listOfCountries, id: \.self) { country in
//                            Text(country.countryName ?? "Asia")
//                        }
//                    }
                    Picker("Select a country", selection: $selectedCountry) {
                        ForEach(0..<self.listManager.listOfCountries.count) { index in
                            Text(self.listManager.listOfCountries[index].countryName ?? "India")
                            
                                         }
                                     }
                .pickerStyle(.automatic)
//                    Text("you selected: \(self.listManager.listOfCountries[selectedCountry])")
        }
                    Section(header: Text("About")) {
                        VStack {
                       
                              
                            if listManager.listOfCountries.count > 0 {
                            Text(" \(self.listManager.listOfCountries[selectedCountry].countryDescription ?? "Empty description")")
                                    .font(.body)
                                
                            } else {
                                Text("Description is not available for this country")
                            }
                           
                            
                        }
                       
                    }
                    
                    Section {
                        VStack {
                            
                            if listManager.listOfCountries.count > 0 {
                                
                                Image(listManager.listOfCountries[selectedCountry].countryImage ?? "NA")
                                    .resizable()
                                    .frame(width: 360, height: 250, alignment: .center)
                                    .scaledToFit()
                                   
                                
//                                Image("\(listManager.listOfCountries[selectedCountry].countryName ?? "Chile")statistics")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 200, height: 250, alignment: .center)
                            } else {
                                Text("Image is not available for this country")
                            }
                            
                          
                        }
                    }
                    
//                    Section {
//                        VStack {
//                            if listManager.listOfCountries.count > 0 {
//                            Image("\(listManager.listOfCountries[selectedCountry].countryName ?? "Chile")statistics")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 200, height: 250, alignment: .center)
//                            }
//
//                            else {
//                                Text("Image is not available for this country")
//                            }
//
//
//
//                        }
//                    }
                    
//                    Section(header: Text("Donation Form")) {
//                        VStack(spacing: 20) {
//
//                            TextField("First Name",text: $firstName)
//
//                            TextField("Last Name", text: $lastName)
//
//                        TextField("Enter amount",text: $amount).keyboardType(.numberPad)
//                                .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                            Button("Donate") {
//
//                                let donationForm = Donate(firstName: firstName, lastName: lastName, country: self.listManager.listOfCountries[selectedCountry].countryName ?? "India", amount: Double(amount) ?? 10)
//                                listManager.addDonations(donation: donationForm)
//
////                                if firstName || lastName || amount == .isEmpty {
////                                    doICare = false
////                                } else {
////                                    doICare = true
////                                }
//                                doICare = true
//                            }.disabled(isDisabled)
//                            .frame(width: 100, height: 35)
//                            .foregroundColor(.white)
//                            .background(isDisabled ? Color.gray : Color.blue)
//                                .cornerRadius(5)
//                                .alert(isPresented: $doICare) {
//                                    Alert(title: Text("Thank You"), message: Text("Thank you for making a donation  of \(amount)"),dismissButton: .default(Text("OK")))
//                                }
//
//                        }
//
//                }
                    
            }
            .onAppear(perform: loadCountries)
            
        
    }
    func loadCountries() {
     listManager.getListOfCountries(region)
        
    }
    
    
}


struct NewPage_Previews: PreviewProvider {
    static var previews: some View {
        ContinentPage(region: "asia")
    }
}




