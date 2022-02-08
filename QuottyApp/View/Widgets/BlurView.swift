//
//  BlurView.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 4/2/2022.
//

import Foundation
import SwiftUI

struct BlurView:UIViewRepresentable
{
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> some UIVisualEffectView {
        
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
