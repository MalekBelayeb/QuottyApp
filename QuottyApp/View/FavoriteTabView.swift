//
//  FavoriteTabView.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 18/1/2022.
//

import SwiftUI


struct FavoriteTabView: View {
    
    @StateObject var viewModelQuote = QuoteViewModel.sharedInstance
    
    var body: some View {
        
        NavigationView
        {
            ZStack(alignment:.leading){
                
                Color.lightBlueColor
                BlurView(style: .light)
                
                ScrollView
                {
                    Spacer(minLength: 140)
                    ForEach(viewModelQuote.quoteItems ?? [],id:\.self)
                    {
                        item in
                        
                        FavoriteItem(item: item)
                        
                        Spacer(minLength: 20)
                        
                    }

                }
             
            }.overlay(alignment: .top, content: {
                
                NavBarView(text:"My Favorite")
                
            }).navigationBarHidden(true).edgesIgnoringSafeArea(.all).frame(maxWidth:.infinity,maxHeight: .infinity).background(Color.pinkColor).task {
                
                self.viewModelQuote.getFavoriteItem()
                
            }
            
        }
        
    }
}

struct FavoriteTabView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteTabView()
    }
}
