//
//  LanguageViewModel.swift
//  QuotesAppSwiftUI
//
//  Created by ODC on 21/1/2022.
//

import Foundation

class LanguageItem:Identifiable
{
    
    let id = UUID()
    var isSelected:Bool = false
    var language:String?
    var code:String?
    
    init(language:String,code:String)
    {
        self.language = language
        self.code = code
    }
    
}

class LanguageViewModel:ObservableObject
{
    
    public static let sharedInstance = LanguageViewModel()
    
    @Published var languageArr:[LanguageItem] = [LanguageItem(language: "English",code: "en"),LanguageItem( language: "Fench",code: "fr"),LanguageItem(language: "Spanish",code:"es"),LanguageItem(language: "Italian",code: "it"),LanguageItem(language: "Portuguese",code:"pt"),LanguageItem(language: "Slovakian",code:"sk"),LanguageItem(language: "Czech",code:"cs"),LanguageItem(language: "Danish",code:"de")]
    
    var selectedLanguage: LanguageItem?
    
    func updateSelectedLanguage(id:String)
    {
        
        for lang in languageArr
        {
            lang.isSelected = false
        }
        
        self.selectedLanguage = self.languageArr.first(where: {return $0.id.description  == id})
        self.selectedLanguage?.isSelected.toggle()
        
        self.languageArr = self.languageArr
    }
    
}
