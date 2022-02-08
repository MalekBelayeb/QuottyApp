//
//  LanguageListView.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 4/2/2022.
//

import Foundation
import SwiftUI


struct BottomSheetContent:View
{
    
    @StateObject var viewModelLanguage = LanguageViewModel.sharedInstance
    
    var body: some View
    {
        
         GeometryReader
         {
             
             geo in
             
             ScrollView
             {
                 VStack(spacing:10)
                 {
                     
                     ForEach(viewModelLanguage.languageArr,id: \.id)
                     {
                         item in
                         
                         HStack
                         {
                             
                             Text(item.language!).foregroundColor(.white).font(.system(size: 18))
                             
                             Spacer()
                             
                             if item.isSelected == true
                             {
                                 Image(systemName: "checkmark").foregroundColor(.white).padding(.trailing,20)
                             }
                             
                         }.frame(maxWidth:.infinity,alignment:.leading).padding(.leading,20).onTapGesture {
                             
                             self.viewModelLanguage.updateSelectedLanguage(id: item.id.description)
                             
                         }
                         
                         Divider().background(.white)
                         
                     }
                 }
                 
             }
             
         }
    }
    
}
