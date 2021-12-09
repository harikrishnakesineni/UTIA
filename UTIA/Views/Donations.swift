//
//  Credit.swift
//  test
//
//  Created by Hari krishna on 24/11/21.
//

import SwiftUI

struct Donations: View {
    @EnvironmentObject var listManager: ListManager
    @State var nextPage = false
    var body: some View {
       
            Form {
                Section(header: Text("Donations")) {
                    Text("We are a nonprofit group who have created this app with a motive to teach people on poverty and the data and statistics behind it. We would like you to donate a small contribution to us so we can continue working on this project. Half of the donation will be directed to a relief fund for a few of these countries so that their communities can be fed.")
                }
                Section(header:Text("Donate by clicking here")) {
                   
                    Button("Donate") {
                        nextPage = true
                    }.sheet(isPresented: $nextPage) {
                        CollectDonateView()
                    }
                    .foregroundColor(.blue)
                   
                }
                
                
                Section {
                List{
                ForEach(listManager.donations) { donation in
                HStack {
                    Text("\(donation.firstName)")
                    Text("$\(donation.amount, specifier: "%.2f")")
                    Text("\(donation.country)")
                }
            }
        }
            
          
//
//            .navigationBarItems(trailing: Button("Donate") {
//            nextPage = true
//        }.sheet(isPresented: $nextPage) {
//            CollectDonateView()
//        }
//        )
    }
       
    }
    }
}

struct Credit_Previews: PreviewProvider {
    static var previews: some View {
        Donations()
    }
}
