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
                
      NavigationView
        {
            
            TabView
            {
                 
                HomeTabView().tabItem{
                    
                }.navigationTitle("eeeeeee")
                    
                FavoriteTabView().tabItem{
                    
                }.navigationTitle("dddddd")
                    
            }.task {
                    
                    DispatchQueue.main.async {
                        
                        Task{
                            
                            await viewModel.fetchQuoteItem()
                            
                        }
                        
                    }
            
                }
            
        }
        
        
         
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
