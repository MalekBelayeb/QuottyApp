//
//  AuthorDetailView.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 4/2/2022.
//

import SwiftUI

struct AuthorDetailView: View {
    
    var author:RandomUserResponse?

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
          

            
            Spacer()
            
        }
        
    }
    
}


