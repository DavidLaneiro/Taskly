//
//  TasklyNoTasks.swift
//  Taskly
//
//  Created by David  Lourenço on 10/06/2024.
//

import Foundation
import SwiftUI
import Combine

struct TasklyNoTasks: View {

    @ObservedObject var tasklyViewModel : TasklyViewModel
    
    var body: some View {
        VStack{
            
            Image(systemName: "bag.fill.badge.plus")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(Color(hex: "FEFFD2"))
                .opacity(0.8)
            
            
            
            Text("No tasks yet!")
                .font(.largeTitle.bold())
                .foregroundStyle(Color(hex: "FEFFD2"))
                .opacity(0.8)
            
            Text("Tap to create a new Task")
                .font(.footnote.bold())
                .foregroundStyle(Color(hex: "FEFFD2"))
                .opacity(0.8)
        }
        .padding()
        .onTapGesture {
            self.tasklyViewModel.toggleIsSheetPresented()
        }
        .fullScreenCover(isPresented: self.$tasklyViewModel.isSheetPresented, content: {
            TasklyCreateTask(tasklyViewModel: self.tasklyViewModel)
        })
    }
}

