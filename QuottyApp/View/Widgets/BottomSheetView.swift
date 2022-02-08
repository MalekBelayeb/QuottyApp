//
//  BottomSheetView.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 21/1/2022.
//

import SwiftUI

struct BottomSheet<Content: View>:View
{
    
    let content:() -> Content
    var sheetStyle:Binding<SheetStyle>
    
    var withExitOption:Bool
    var withDraggingEnabled:Bool
    
    var topBarBlurStyle: UIBlurEffect.Style
    var bodyBlurStyle: UIBlurEffect.Style
    
    @State var draggingLocation:CGPoint?
    @State var bottomSheetHeight:CGFloat?
    

    init(withExitOption:Bool = false,withDraggingEnabled:Bool = false,topBarBlurStyle:UIBlurEffect.Style = .light,bodyBlurStyle:UIBlurEffect.Style = .light,sheetStyle:Binding<SheetStyle>,@ViewBuilder content: @escaping () -> Content)
    {
        self.content = content
        self.sheetStyle = sheetStyle
        self.topBarBlurStyle = topBarBlurStyle
        self.bodyBlurStyle = bodyBlurStyle
        self.withExitOption = withExitOption
        self.withDraggingEnabled = withDraggingEnabled
    }
    
    
    private func getInitialHeight() -> CGFloat
    {
        
        switch sheetStyle.wrappedValue
        {
        case .Hidden:
                
            return self.bottomSheetHeight ?? 0

        case .Quarter:
            
            return UIScreen.main.bounds.height/3
            
        case .Half:
            
            return UIScreen.main.bounds.height/2
            
        case .Full:
        
            return UIScreen.main.bounds.height
            
        }
                
    }
    
    func updateHeightOnDragging()
    {
        
        if let currentDraggingLoc = draggingLocation
        {
        
            let draggingYValue:CGFloat = currentDraggingLoc.y
                
            if draggingYValue > 0
            {
           
                self.bottomSheetHeight = draggingYValue
                
            }
           
        }
        
    }
    
    func updateHeightOnEndDragging()
    {
     
        let initialHeight = getInitialHeight()

        if let currentDraggingLoc = draggingLocation
        {
            let draggingYValue:CGFloat = currentDraggingLoc.y

            if draggingYValue > 0 && draggingYValue < initialHeight
            {
                
                if draggingYValue >= (initialHeight / 2)
                {
                    
                    // make it close
                    self.sheetStyle.wrappedValue = .Hidden
                    
                }
                
                self.bottomSheetHeight = nil
                self.draggingLocation = nil
                
            }
            
        }
        
    }
    
    func getAnimation() -> Animation
    {
        
        if self.sheetStyle.wrappedValue == .Hidden
        {

            return .easeOut
        
        }else{
            
            return .easeIn
        
        }
        
    }
    
    var body: some View
    {
        
        ZStack
        {
            

            VStack(spacing:0)
            {

                ZStack
                {
                    BlurView(style: self.topBarBlurStyle)
                    HStack
                    {
                        
                        Capsule().foregroundColor(.black).frame(maxWidth:200,maxHeight:10).padding(.horizontal)
                        
                    }.frame(maxWidth:.infinity).overlay(alignment: .trailing, content: {

                        if self.withExitOption
                        {

                            Button{
                                    
                                self.sheetStyle.wrappedValue = .Hidden

                            }label: {
                                
                                Image(systemName: "xmark")

                            }.padding(20)
                            
                        }else{
                            EmptyView()
                        }
                     
                    })
                    
                }
                .frame(maxWidth:.infinity,maxHeight:30).gesture(DragGesture().onChanged{
                    gesture in
                    
                    if self.withDraggingEnabled == true
                    {
                        self.draggingLocation = gesture.location
                            
                        updateHeightOnDragging()
                    }
                    
                }.onEnded{
                    gesture in
                    
                    if self.withDraggingEnabled == true
                    {
                        updateHeightOnEndDragging()
                    }
                    
                })
                
                ZStack
                {
                    
                    BlurView(style: self.bodyBlurStyle)
                    content()
                    
                }
                
            }.frame(maxWidth:.infinity,maxHeight:.infinity)
            
        }.cornerRadius(20, corners: [.topRight,.topLeft]).frame(maxHeight:getInitialHeight()).offset(y: self.bottomSheetHeight ?? 0).animation(getAnimation())
        
    }
    
}

