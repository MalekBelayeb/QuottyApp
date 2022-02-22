//
//  NavBarView.swift
//  QuottyApp
//
//  Created by ODC on 22/2/2022.
//

import SwiftUI

struct NavBarView: View {
    
    var text:String
    
    var body: some View {

        ZStack
        {
            
            LinearGradient(gradient: Gradient(colors: [Color.lightBlueColor.opacity(0.1), .clear]), startPoint: .top, endPoint: .bottom).background(.ultraThinMaterial).blur(radius: 4)
                        
            VStack
            {
                
                Spacer()
                
                Text(self.text).foregroundColor(Color.white).font(.largeTitle.weight(.bold)).frame(maxWidth:.infinity,alignment:.leading).padding(.leading,20).padding(.bottom,10)
            
            }
      
        }.frame(maxHeight:120)

    }
}
