//
//  TasklyAddEditList.swift
//  Taskly
//
//  Created by David  Lourenço on 17/06/2024.
//

import Foundation
import SwiftUI


struct TasklyAddEditList: View {
    
    @ObservedObject var tasklyViewModel: TasklyViewModel
    var isEdit : Bool = false
    
    init(tasklyViewModel: TasklyViewModel, isEdit: Bool) {
        self.tasklyViewModel = tasklyViewModel
        self.isEdit = isEdit
    }
    
    var body: some View {
        List {
            
            Section {
                TasklyCustomTextField(tasklyViewModel: self.tasklyViewModel, isEdit: self.isEdit)            .listRowBackground(TasklyCustomColors.customYellow)
                    .frame(height: 200, alignment: .topLeading)
            }
            
            Section {
                HStack{
                    Label(self.tasklyViewModel.toggleState ? "Completed" : "In Progress", systemImage: self.tasklyViewModel.toggleState ? "checkmark" : "rays")
                        .foregroundStyle(TasklyCustomColors.darkerOrange)
                        .font(.system(size: 16, weight: .bold))
                    
                    Toggle(isOn: self.$tasklyViewModel.toggleState) {
                        
                        
                        
                    }
                    .tint(TasklyCustomColors.darkerOrange)
                }
                .listRowBackground(TasklyCustomColors.customYellow)
            .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            }header: {
                Text("Configuration")
                    .foregroundStyle(TasklyCustomColors.customYellow)
            }
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .listRowSpacing(10)
    }
}

#Preview {
    TasklyCreateTask(tasklyViewModel: TasklyViewModel())
}

