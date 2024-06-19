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
                    .foregroundStyle(self.isSelected ? TasklyCustomColors.customTextColor : TasklyCustomColors.darker)
                
                if !buttonTitle.isEmpty{
                    Text(buttonTitle)
                        .foregroundStyle(self.isSelected ? TasklyCustomColors.customTextColor : TasklyCustomColors.darker)
                }
                
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .background(
                RoundedRectangle(cornerRadius: 30.0)
                    .fill(self.isSelected ? TasklyCustomColors.darker : TasklyCustomColors.customTextColor)
                
                
            )
        }
    }
}

#Preview {
    TasklyHomePage()
}


