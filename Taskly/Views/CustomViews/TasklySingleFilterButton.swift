//
//  TasklySingleFilterButton.swift
//  Taskly
//
//  Created by David  Lourenço on 09/06/2024.
//

import Foundation
import SwiftUI


struct TasklySingleFilterButton: View {
    
    @ObservedObject var tasklyViewModel : TasklyViewModel
    
    let buttonTitle : String
    let buttonImageName : String
    var isSelected : Bool = false
    var action : () -> Void
    
    
    var body: some View {
        Button(action: {
           
            action()
           
        }){
            HStack{
                
                Image(systemName: buttonImageName)
                    .foregroundStyle(Color(hex: self.isSelected ? "FEFFD2" : "FF7D29"))
                Text(buttonTitle)
                    .foregroundStyle(Color(hex: self.isSelected ? "FEFFD2" : "FF7D29"))
                
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(
                RoundedRectangle(cornerRadius: 30.0)
                    .fill(Color(hex: self.isSelected ? "FF7D29" : "FEFFD2"))
                
                
            )
        }
    }
}

#Preview {
    TasklyHomePage()
}


