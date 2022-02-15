//
//  ContentView.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 18/1/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @StateObject var viewModel = QuoteViewModel.sharedInstance
    
    var body: some View {
                
        NavigationView
        {
            
            TabView
            {
                    
                HomeTabView().tabItem{
                    
                }
                    
                FavoriteTabView().tabItem{
                    
                }
                    
            }.navigationBarTitleDisplayMode(.inline).edgesIgnoringSafeArea(.all).tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic)).task {
                    
                    await viewModel.getQuote()
                    await viewModel.getAuthor()
                   
            }
        }
         
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
