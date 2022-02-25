//
//  SettingsView.swift
//  QuottyApp
//
//  Created by ODC on 23/2/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {

        VStack
        {
            
            List
            {
                
                Section(header: Text("Notifiations"), content: {
                    
                    Toggle("Activer les notifications", isOn: Binding.constant(true)).frame(maxWidth:.infinity)
             
                })
                
                Section(header: Text("Theme"), content: {
                    
                    Toggle("Theme 1", isOn: Binding.constant(true)).frame(maxWidth:.infinity)
             
                })
                
            }.frame(maxWidth:.infinity,maxHeight: 400).cornerRadius(8)
            
            
        }.navigationTitle("Mes Parametres").frame(maxWidth:.infinity,maxHeight: .infinity).padding(20)
        

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
