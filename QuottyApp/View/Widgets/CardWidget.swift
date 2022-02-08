//
//  CardWidget.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 19/1/2022.
//

import SwiftUI

struct CardWidget: View {
    
    var author:RandomUserResponse?
    var quote:QuotesResponse?
    
    var body: some View {
    
        VStack(spacing:20)
        {
            
                HStack
                {
                    if let author = author,let authorResult = author.results,let firstAuthResult = authorResult.first
                    {
                        if let picture = firstAuthResult.picture,let imgUrl =  picture.medium {
                                                
                            AsyncImage(url: URL(string: imgUrl)) { image in
                                image.resizable().clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 60, height: 60)
                            
                        }
                        
                        if  let name = firstAuthResult.name, let title = name.title,let first = name.first, let last = name.last {
                            
                            Text(title + " " + first + " " + last).foregroundColor(.white).bold().padding(.leading,10)
                            
                        }
                        
                    }
                    
                }.frame(maxWidth:.infinity,alignment: .topLeading).padding(.top,20).padding(.leading,20)
          
            HStack{
                
                if let quote = quote,let content = quote.content {

                    ScrollView
                    {

                        Text(content).foregroundColor(.white).padding(.all,15)

                    }
                    
                }
                
            }.frame(maxWidth:.infinity,alignment: .topLeading)
            
            Spacer()
            
        }.frame(maxWidth:350, maxHeight:450).background(Color.cardQuoteColor).cornerRadius(7).shadow(color: Color.buttonColor, radius: 10, x: -5, y: 5).overlay(LikeButton(), alignment: .bottom)
        
    }
    
}

struct LikeButton: View {
    
    var body: some View {

        HStack
        {
            
            Spacer()
            ZStack
            {
                
                Image(systemName: "heart.fill").foregroundColor(Color.init(hex:0x7aacb3)).font(.system(size: 28)).padding()
                
            }.frame(maxWidth:60, maxHeight:60).foregroundColor(.white).background(Color.init(hex: 0x4c6e81)).clipShape(Circle()).padding(.trailing,20).padding(.bottom,-25)
                .shadow(radius: 5)
            
        }
        
    }
    
}




struct CardWidget_Previews: PreviewProvider {
    static var previews: some View {
        
        let author = RandomUserResponse(results: [UserInfo(name: UserName(title: "Mr", first: "Malek", last: "Belayeb"), picture: Picture(large: "aaaaa", medium: "https://randomuser.me/api/portraits/med/men/71.jpg", thumbnail: "aaaaa"), location: Location(city: "aaaaa", state: "aaaaa", country: "aaaaa"), email: "ssssss")])
        
        CardWidget(author: author)
    }
}
