//
//  TasklyCancelCreate.swift
//  Taskly
//
//  Created by David  Lourenço on 11/06/2024.
//

import Foundation
import SwiftUI


struct TasklyCancelCreate: View {
    
    @ObservedObject var tasklyViewModel : TasklyViewModel
    
    var body: some View {
        HStack{
            Button(action:{
                
                self.tasklyViewModel.toggleIsSheetPresented()
                
            }){
                Text("Cancel")
                    .foregroundStyle(Color(hex: "FEFFD2"))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Button(action:{
                
                // Save new element
                self.tasklyViewModel.addTask()
                
                self.tasklyViewModel.toggleIsSheetPresented()
                
                
            }){
                Text("Create")
                    .foregroundStyle(Color(hex: "FF7D29"))
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .background(
                        
                        RoundedRectangle(cornerRadius: 30.0)
                            .fill(Color(hex: "FEFFD2"))
                            .frame(height: 30)
                        
                    )
            }.opacity(self.tasklyViewModel.taskContent.isEmpty ? 0.6 : 1)
            .disabled(self.tasklyViewModel.taskContent.isEmpty)
        }
    }
}
