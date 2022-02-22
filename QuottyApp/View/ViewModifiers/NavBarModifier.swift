//
//  NavBarModifier.swift
//  QuottyApp
//
//  Created by ODC on 17/2/2022.
//

import Foundation
import SwiftUI


struct NavBarModifier:ViewModifier
{
    
    init(backgroundColor:Color = Color.lightBlueColor)
    {
    
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.titleTextAttributes = [.foregroundColor:UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor:UIColor.white]
        navBarAppearance.backgroundColor = UIColor(backgroundColor)
        
        navBarAppearance.shadowColor = .clear
        
         
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance

        
    }

    func body(content: Content) -> some View {
        
        content.background(.red)
        
    }
        
}

extension View
{
    
    func applyNavBarStyle(backroundColor:Color = Color.lightBlueColor) -> Self
    {
        self.modifier(NavBarModifier(backgroundColor:backroundColor ))
        return self
    }
    
}


