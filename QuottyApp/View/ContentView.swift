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
    @State var selectedIndex : Int = 0
    
    var body: some View {
            
        
        TabView(selection:$selectedIndex)
        {
            
            HomeTabView().tabItem{
                
            }.tag(0)
            
            
            FavoriteTabView().tabItem{
                
            }.tag(1)
            
        }.tabViewStyle(.page(indexDisplayMode: .never)).task {
            
            DispatchQueue.main.async {
                
                Task{
                    
                    await viewModel.fetchQuoteItem()
                    
                }
                
            }
            
        }.edgesIgnoringSafeArea(.all).navigationTitle("Quotes App").overlay(alignment:.bottom)
        {
            
            Button
            {
                
                selectedIndex = 1
                
            }label:
            {
                
                Text("sssssssss")
                
            }
            
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
