//
//  BottomSheetViewModel.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 4/2/2022.
//

import Foundation

enum SheetStyle
{
    
    case Hidden
    case Half
    case Quarter
    case Full
    
}

enum SheetMode
{
    
    case AUTHOR_DETAIL
    case LANGUAGE_LIST
    
}

class SheetManager
{
         
    
    var bottomSheetStyle:SheetStyle?
    var bottomSheetMode:SheetMode?
       
    init(bottomSheetStyle:SheetStyle = .Quarter,bottomSheetMode:SheetMode)
    {
        self.bottomSheetMode = bottomSheetMode
        self.bottomSheetStyle = bottomSheetStyle
    }
    
}

class BottomSheetManager
{
                
    @Published var sheetManager:SheetManager?
    public static let sharedInstance = BottomSheetManager()
    
}
