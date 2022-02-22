//
//  ContentView.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 18/1/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    
    @StateObject var viewModel = QuoteViewModel.sharedInstance
    
    var body: some View {
                
        TabView
        {
            
            HomeTabView().tabItem{
            
            }
                
            FavoriteTabView().tabItem{

            }
               
        }.edgesIgnoringSafeArea(.all).tabViewStyle(.page(indexDisplayMode: .never)).task {
                
                DispatchQueue.main.async {
                    
                    Task{
                        
                        await viewModel.fetchQuoteItem()
                        
                    }
                    
                }
        
        }.navigationTitle("Quotes App")
      
         
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
