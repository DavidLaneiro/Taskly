//
//  TasklyLogoSection.swift
//  Taskly
//
//  Created by David  Lourenço on 09/06/2024.
//

import Foundation
import SwiftUI


struct TasklyLogoSection: View {
    
    @ObservedObject var tasklyViewModel: TasklyViewModel
    
    var body: some View {
        HStack {
            TasklyLogo()
                .padding(20)
            
            Spacer()
            
            TasklySingleFilterButton(tasklyViewModel: self.tasklyViewModel, buttonTitle: "", buttonImageName: "tray.fill", isSelected: self.tasklyViewModel.toggleGroups, action: {
                
                self.tasklyViewModel.toggleGroups.toggle()
                
        
            }).frame(width: 32, height: 32)
            
            NavigationLink(destination: TasklyCreateTask(tasklyViewModel: tasklyViewModel)) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .foregroundStyle(TasklyCustomColors.customTextColor)
                    .frame(width: 32, height: 32)
                    .padding(20)
            }
        }
    }
}

#Preview {
    TasklyHomePage()
}

