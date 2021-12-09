//
//  AboutView.swift
//  test
//
//  Created by Hari krishna on 24/11/21.
//

import SwiftUI

struct AboutView: View {
    @State var showAlert = false
    
    init() {
        UITableView.appearance().backgroundColor = .systemTeal
    }
    
    var body: some View {
        ZStack {
//            if #available(iOS 15.0, *) {
//                LinearGradient(colors: [.green, .accentColor], startPoint: .topLeading, endPoint: .bottomTrailing)
//            } else {
//                // Fallback on earlier versions
//            }
            
           
                Form {
                    //                if #available(iOS 15.0, *) {
                    //                    LinearGradient(colors: [.green, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                    //                } else {
                    //                    // Fallback on earlier versions
                    //                }
                    
                    Section(header:Text("What this app is about?")) {
                        Text("We are students of DPS Nacharam, and this app is the product of our Global Perspective Project where we teach students about the effects of poverty during COVID-19 of 3rd world countries. It is based on multiple web sources, surveys and videos. Slowly we produced an app that can display our work the most efficient.")
                    }
                    
                    Section(header: Text("Contact Us:")) {
                        Link("Hari - 1130392@dpssecunderabad.in", destination: URL(string: "https://www.gmail.com")!)
//                            .foregroundColor(.blue)
                            
//                        }.alert(isPresented: $showAlert) {
//                            Alert(title: Text("Contact us"), message: Text("Thank you for contacting us"), dismissButton: .default(Text("OK")))
//                        }
                        
                        Link("Akshit - 1161323@dpssecunderabad.in", destination: URL(string: "https://www.gmail.com")!)
//                            .foregroundColor(.blue)
//                        }.alert(isPresented: $showAlert) {
//                            Alert(title: Text("Contact us"), message: Text("Thank you for contacting us"), dismissButton: .default(Text("OK")))
//                        }
//
                        
                        Link("Joshua - 1131189@dpsecunderabad.in", destination: URL(string: "https://www.gmail.com")!)
//                            .foregroundColor(.blue)
                        
                                
//                                .alert(isPresented: $showAlert) {
//                            Alert(title: Text("Contact us"), message: Text("Thank you for contacting us"), dismissButton: .default(Text("OK")))
//                        }
                    }
                    
                        
                    
                }
//                    .overlay( LinearGradient(colors: [.green, .accentColor], startPoint: .topLeading, endPoint: .bottomTrailing))
                .background(
                    LinearGradient(colors: [.green, .accentColor], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            }
                }
        
    
    }
    

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
