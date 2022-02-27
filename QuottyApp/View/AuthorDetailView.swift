//
//  AuthorDetailView.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 4/2/2022.
//

import SwiftUI

struct AuthorDetailView: View {
    
    var author:UserInfo?
    
    var body: some View {
        
        VStack(spacing:20)
        {
                
                HStack
                {
                    
                    if let firstAuthResult = author
                    {
                        
                        if let picture = firstAuthResult.picture,let imgUrl = picture.medium {
                                
                            
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
        
            
            HStack
            {
                
                VStack(alignment:.leading, spacing:10)
                    {

                        HStack{

                            Text("Email:").foregroundColor(.white).bold()

                            if let author = self.author, let email = author.email
                            {
                                Text(email).foregroundColor(.white).bold().padding(.leading,10)
                            }
                            
                        }
                        
                        HStack{
                            
                            Text("Adress:").foregroundColor(.white).bold()
                            
                            if let author = author,let location = author.location {
                                
                                Text(location.city! + ", " + location.state! + ", " + location.country!).foregroundColor(.white)
                                
                            }
                            
                        }
                        
                    }.padding(10)
                
            }.frame(maxWidth:.infinity,alignment:.leading)
           
            Spacer()
            
        }
        
    }
    
}


