//
//  FavoriteTabView.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 18/1/2022.
//

import SwiftUI


struct FavoriteTabView: View {
    
    
    init()
    {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
    }

    
    var body: some View {
        
            VStack(alignment:.leading){
                
                HStack
                {
               
                    Spacer()
                
                }.padding(.top,60)
 
            }.frame(maxWidth:.infinity,maxHeight: .infinity).background(Color.pinkColor)
        
    }
}

struct FavoriteTabView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteTabView()
    }
}
