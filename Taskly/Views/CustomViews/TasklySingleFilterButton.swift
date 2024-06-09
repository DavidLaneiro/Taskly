//
//  TasklySingleFilterButton.swift
//  Taskly
//
//  Created by David  Lourenço on 09/06/2024.
//

import Foundation
import SwiftUI


struct TasklySingleFilterButton: View {
    
    @State private var isToggled : Bool = false
    
    let buttonTitle : String
    let buttonImageName : String
    
    init(buttonTitle: String, buttonImageName: String) {
        self.buttonTitle = buttonTitle
        self.buttonImageName = buttonImageName
    }
    
    var body: some View {
        Button(action: {
            self.isToggled.toggle()
            
        }){
            HStack{
                
                Image(systemName: buttonImageName)
                    .foregroundStyle(Color(hex: self.isToggled ? "FEFFD2" : "FF7D29"))
                Text(buttonTitle)
                    .foregroundStyle(Color(hex: self.isToggled ? "FEFFD2" : "FF7D29"))
                
            }
            .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
            .background(
                RoundedRectangle(cornerRadius: 30.0)
                    .fill(Color(hex: self.isToggled ? "FF7D29" : "FEFFD2"))
                
            )
        }
    }
}

