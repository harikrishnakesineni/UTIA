//
//  ContentView.swift
//  test
//
//  Created by Hari krishna on 24/11/21.
//
// 1.create tab view with home, about, browse -
// 2.search  bar functional for countries -
// 3.filter into categories : european continent, asia, south america, north america, africa
// fade in welcome text if you can do that dad
// screen pops up
//
//
// if you click on category boxes you will open up the countries in the continent
// five countries in each continent which will be clickable and when clicked while contain information about the country and gives statistics, formatted pictures
// contacts at the bottom with the three names, contacts and information in white and background in black
// donate money for charity feature
// animation on popscreen should be smooth
//
 
import SwiftUI


//struct CapsuleView: View{
//
//    var text:String = "HI"
//
//    var body:some View {
//
//        Text(text)
//            .font(.largeTitle)
//            .padding()
//            .foregroundColor(.white)
//            .background(Color.blue)
//            .clipShape(Capsule())
//
//    }
//}
struct ContentView: View {
    
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color.blue)]
    }
    var body: some View {
        NavigationView {
           
               
              
            TabView {
                
               
                    Home().tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                
               BrowseView().tabItem {
                    Image(systemName: "magnifyingglass")
                   Text("browse")
                }
              Donations().tabItem {
                  Image(systemName: "coloncurrencysign.circle.fill")
                    Text("Donations")
                }
                AboutView().tabItem {
                     Image(systemName: "person.fill")
                    Text("About us")
                     
                 }
                
            }.navigationTitle("U-TIA")
                .accentColor(Color.red)
                .background(Color.blue)
                .edgesIgnoringSafeArea(.all)
               
          
                
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

