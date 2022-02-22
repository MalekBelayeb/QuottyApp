//
//  FavoriteItem.swift
//  QuottyApp
//
//  Created by ODC on 21/2/2022.
//

import SwiftUI

struct FavoriteItem: View {
    
    var item: QuoteEntity
    
    init(item:QuoteEntity)
    {
        self.item = item
    }
    
    var body: some View {
        
        ZStack
        {
            
            VStack(alignment:.leading)
            {
                
                HStack
                {
                    
                    AsyncImage(url: URL(string: item.author_img!)) { image in
                        image.resizable().clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 60, height: 60)
                    
                    Text(item.author!).foregroundColor(.white).bold().padding(.leading,10)
                    
                }.frame(maxWidth:.infinity,alignment: .topLeading).padding(.top,20).padding(.leading,20)
                
                Text((item.content) ?? "" ).lineLimit(4).foregroundColor(.white).padding(.horizontal,20)
                
            }.padding(.bottom, 20)
            
        }.background(Color.lightBlueColor).cornerRadius(7).shadow(radius: 3).padding(10)
        
    }
}


