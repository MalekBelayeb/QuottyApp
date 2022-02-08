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
    case NONE
}


class BottomSheetOptions
{
                
    var bottomSheetStyle:SheetStyle
    var bottomSheetMode:SheetMode
        
    init(bottomSheetStyle:SheetStyle = .Hidden,bottomSheetMode:SheetMode = .NONE)
    {
        self.bottomSheetStyle = bottomSheetStyle
        self.bottomSheetMode = bottomSheetMode
    }
}
