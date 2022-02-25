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
    
    @State var bottomSheetOptions : BottomSheetOptions = BottomSheetOptions()

    
    
    var body: some View {
        
        NavigationView
        {
            ZStack(alignment:.center)
            {
                
                BackgroundView().background(Color.lightBlueColor)
                ArcShape().foregroundColor(Color.pinkColor)
                BlurView(style: .light)
                
                VStack(spacing:60)
                {
                    
                    VStack
                    {
                        
                        HStack
                        {
                            
                            Spacer()
                            ChangeLanguageTopButton(bottomSheetOptions: $bottomSheetOptions)
                            
                        }
                        
                            CardWidget(author:viewModelQuote.quoteItem?.userResponse,quote:viewModelQuote.quoteItem?.quoteResponse,bottomSheetOptions:  $bottomSheetOptions)
                        
                    }
                    
                    BottomButton()
                    
                }.frame(maxHeight:.infinity).padding(.top,60)
                
            }.navigationBarHidden(true).overlay(alignment: .bottom, content: {
               
                BottomSheet(withExitOption:false,withDraggingEnabled:true,topBarBlurStyle: .systemThinMaterial,bottomSheetOptions: $bottomSheetOptions){
                    
                    if self.bottomSheetOptions.bottomSheetMode == .LANGUAGE_LIST
                    {
                        
                        LanguageListContent()
                        
                    }else if self.bottomSheetOptions.bottomSheetMode == .AUTHOR_DETAIL
                    {
                        
                        AuthorDetailView(author: viewModelQuote.quoteItem?.userResponse?.userInfo?.first)
                        
                    }
                    
                }
                
            }).overlay(alignment: .top, content: {
                
                
                NavBarView(text:"Quotes App")
                
            
            }).edgesIgnoringSafeArea(.all)
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
        
                }
                    
        }.frame(alignment:.top)
        
    }
}

struct ChangeLanguageTopButton:View
{
        
    @Binding var bottomSheetOptions:BottomSheetOptions
    
    var body: some View
    {
        
        Button{
            
            bottomSheetOptions = BottomSheetOptions(bottomSheetStyle: .Half, bottomSheetMode: .LANGUAGE_LIST)
            
        }label:{
            
            Image(systemName: "character.book.closed").foregroundColor(.white).font(.system(size: 20)).padding(.all,10)
            
        }.background(Color.cardQuoteColor).clipShape(Circle())
            .shadow(radius: 5).padding(.trailing,30)
            
    }
    
}

struct BottomButton: View {

    @StateObject var viewModel = QuoteViewModel.sharedInstance
    
    var body: some View {
                
        ZStack
        {
                
            Button {
                
                DispatchQueue.main.async {
                    
                    Task{
                        
                        await viewModel.fetchQuoteItem()
                       
                    }
                   
                }
                
            }label:{
                
                Text("Next Quote").foregroundColor(.white).bold()
                
            }.frame(maxWidth:180,maxHeight:45).background(Color.cardQuoteColor).clipShape(RoundedRectangle(cornerRadius: 7, style: .continuous))
                .padding(.bottom,20).shadow(radius: 5)
            
        }
       
    }
}

