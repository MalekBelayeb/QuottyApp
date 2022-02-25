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
            
        
        TabView
        {
        EmptyView()
             
            
        }.tabViewStyle(.page(indexDisplayMode: .never)).task {
            
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
