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
            
            NavigationLink(destination: TasklyCreateTask(tasklyViewModel: tasklyViewModel)) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .foregroundStyle(TasklyCustomColors.customYellow)
                    .frame(width: 32, height: 32)
                    .padding(20)
            }
        }
    }
}

