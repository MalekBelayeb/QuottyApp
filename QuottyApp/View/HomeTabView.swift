//
//  HomeTabView.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 18/1/2022.
//

import SwiftUI

struct ArcShape:Shape
{
            
    func path(in rect: CGRect) -> Path {
        
        Path { path in
            
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY+150))
            path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY+200), control: CGPoint(x: rect.minX, y: rect.midY+200))
            
        }
    }
    
}

struct HomeTabView: View {
        
    @StateObject var viewModelQuote = QuoteViewModel.sharedInstance
    @StateObject var viewModelLanguage = LanguageViewModel.sharedInstance
    
    var body: some View {
        
        ZStack{
            
            
        }
    
    }
}

struct BackgroundView:View
{
     
    var body: some View
    {
        
        ZStack{
                
                VStack(alignment:.leading){
                    
                    HStack
                    {
                            
                        Spacer()
                        
                    }.frame(maxWidth:.infinity).padding(.top,60)
                    
                    Spacer()

                }.edgesIgnoringSafeArea(.all)
                    
        }.frame(alignment:.top)
        
    }
    
}

struct ChangeLanguageTopButton:View
{
        
    var body: some View
    {
        
        Button{
            
            BottomSheetManager.sharedInstance.sheetManager = SheetManager(bottomSheetStyle: .Quarter, bottomSheetMode: .LANGUAGE_LIST)
            
        }label:{
            
            Image(systemName: "character.book.closed").foregroundColor(.white).font(.system(size: 20)).padding(.all,10)
            
        }.background(Color.buttonColor).clipShape(Circle())
            .shadow(radius: 5).padding(.trailing,30)
        
    }
    
}

struct BottomButton: View {

    @StateObject var viewModel = QuoteViewModel.sharedInstance

    var body: some View {
                
        ZStack
        {
                
            Button {
                
                Task.init(priority: .background, operation: {
                   
                    await viewModel.getQuote()
                    await viewModel.getAuthor()
                    
                })
                
            }label:{
                
                Text("Next Quote").foregroundColor(.white).bold()
                
            }.frame(maxWidth:180,maxHeight:45).background(Color.buttonColor).clipShape(RoundedRectangle(cornerRadius: 7, style: .continuous))
                .padding(.bottom,20).shadow(radius: 5)
            
        }
       
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
