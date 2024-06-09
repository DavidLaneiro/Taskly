//
//  TasklyLogoSection.swift
//  Taskly
//
//  Created by David  Lourenço on 09/06/2024.
//

import Foundation
import SwiftUI


struct TasklyLogoSection: View {
    
    @ObservedObject var tasklyViewModel : TasklyViewModel
    
    var body: some View {
        HStack{
            TasklyLogo()
                .padding(20)
            Spacer()
            
            Button(action: {
                
                self.tasklyViewModel.toggleIsSheetPresented()
                
            }){
                Image(systemName: "plus.circle.fill").resizable().foregroundStyle(Color(hex: "FEFFD2")).frame(width: 32, height: 32).padding(20)
            }
        }
    }
}

