//
//  Home.swift
//  test
//
//  Created by Hari krishna on 24/11/21.
//

import SwiftUI


struct Watermark: ViewModifier {

    var text:String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content

            if #available(iOS 15.0, *) {
                Text(text)
                    .font(.caption)
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.indigo)
            } else {
                // Fallback on earlier versions
            }

        }
    }

}
extension View{
    
    func watermarked(with text:String) -> some View {


        self.modifier(Watermark(text: text))

    }


}


    
    




struct Home: View {
    @State var selectedContinents = "Asia"
//    var continents = ["South America", "North America", "European", "Asia", "Africa"]
    
//    init(){
//
//            UIScrollView.appearance().backgroundColor = UIColor.systemIndigo
//        }
    
    var body: some View {
        
        ZStack {
            if #available(iOS 15.0, *) {
                LinearGradient(colors: [.green, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            } else {
                // Fallback on earlier versions
            }
            
//            ScrollView {
                VStack() {
                    
                    Text("Welcome to U-TIA")
                        .font(.system(size: 25, weight: .bold))
                        
                    
                    
                    Image("Cambridge")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding()
                    ScrollView {
                    if #available(iOS 15.0, *) {
                        Text("Third-world countries and states constantly stricken with an economic struggle would face even worse hardships during the COVID-19 pandemic. The precautions taken are a huge toll on the countries budgets, also restricting access to many citizens from working, losing their jobs, thus being unable to pay for housing and food which pushes unstable families living on the edge have fallen through, unable to catch up to the erratic poverty line. Poverty roots towards education as students from monetarily troubled families are unable to attend classes regularly, which cuts off a large potential to move out of poverty.")
                            .font(.system(size: 28))
                            .padding()
//                            .background(Color.white, in: RoundedRectangle(cornerRadius: 25.0))
                    } else {
                        // Fallback on earlier versions
                    }
                    }
                    VStack(alignment: .trailing) {
                        
                        Image("UTIA7")
                            .resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .scaledToFit()
                        .frame(width: 300, height: 200)
                        
                        
                    }
                    
                    
                }
            }
//        }
    }
    
        
        
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
