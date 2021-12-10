//
//  BrowseView.swift
//  test
//
//  Created by Hari krishna on 24/11/21.
//

import SwiftUI

struct BrowseView: View {
    @State private var searchTerm = ""
//    init() {
//        UITableView.appearance().backgroundColor = .systemTeal
//    }
    
  //  UIScrollView.appearance().backgroundColor = UIColor.systemTeal this is for changing the color of the scroll view

//    init(){
//                let navigationBarAppearance = UINavigationBarAppearance()
//                navigationBarAppearance.backgroundColor = UIColor.systemTeal
//        }
    
    var body: some View {
       
        NavigationView {
            ZStack {
                if #available(iOS 15.0, *) {
                    Color.teal
                        .edgesIgnoringSafeArea(.all)
                } else {
                    // Fallback on earlier versions
                }
//            if #available(iOS 15.0, *) {
                ScrollView {
                    //            ZStack {
                    //                if #available(iOS 15.0, *) {
                    //                    Color.teal
                    //                } else {
                    //                    // Fallback on earlier versions
                    //                }
                    //
                    VStack(alignment:.leading) {
                        
                        //            HStack(spacing: 10) {
                        //                    Image(systemName: "magnifyingglass")
                        //        TextField("Enter text", text: $searchTerm)
                        //                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        //                    .padding()
                        //
                        //                }.padding(.leading, 20)
                        HStack {
                            NavigationLink(destination:ContinentPage(region: "Asia")) {
                                VStack {
                                    Image("asean")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 200, alignment: .leading)
                                        .padding()
                                        .clipShape(Circle())
                                    
                                    Text("Asia")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                            }
                            NavigationLink(destination: ContinentPage(region: "Africa")) {
                                VStack {
                                    Image("AfricanUnion")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 200, alignment: .leading)
                                        .padding()
                                        .clipShape(Circle())
                                    
                                    Text("Africa")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        
                        HStack(alignment:.center) {
                            NavigationLink(destination: ContinentPage(region: "North America")) {
                                VStack {
                                    Image("NaUnion")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 200, alignment: .leading)
                                        .padding()
                                        .clipShape(Circle())
                                    
                                    Text("North America")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                            }
                            NavigationLink(destination: ContinentPage(region: "South America")) {
                                VStack {
                                    Image("SouthAmericaUnion")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 200, alignment: .center)
                                        .padding()
                                        .clipShape(Circle())
                                    
                                    Text("South America")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                            }
                            
                        }
                        
                        HStack(alignment:.center) {
                            NavigationLink(destination: ContinentPage(region: "Europe")) {
                                VStack {
                                    Image("EuropeanUnion")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 200, alignment: .leading)
                                        .padding()
                                        .clipShape(Circle())
                                    
                                    Text("Europe")
//                                        .font(.system(size: 25.0))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        
                                }
                            }
                        }
                        
                        //            NavigationView {
                        //                Form {
                        //                Section(header: Text("Select a country from the list")) {
                        //                Picker("Continent", selection: $selectedContinents) {
                        //                    ForEach(continents, id: \.self) { continent in
                        //                    Text(continent)
                        //
                        //            }
                        //        }.pickerStyle(.automatic)
                        //        }
                        //                }.navigationTitle("Countries")
                        //        }
                        
                        
                        
                        
                    }.padding(.top, 10)
                }
//                .background(Color.green, ignoresSafeAreaEdges: .all)
//            }
//                else {
//                // Fallback on earlier versions
//            }
            }
        }
    }
}


struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
    }
}

