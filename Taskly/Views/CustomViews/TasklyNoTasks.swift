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
    
    let upperImageName : String
    let largerText : String
    let shorterText : String
    let tapEnabled : Bool
    
    init(tasklyViewModel: TasklyViewModel, upperImageName: String, largerText: String, shorterText: String, tapEnabled: Bool) {
        self.tasklyViewModel = tasklyViewModel
        self.upperImageName = upperImageName
        self.largerText = largerText
        self.shorterText = shorterText
        self.tapEnabled = tapEnabled
    }
    
    var body: some View {
        
        VStack{
            
            Image(systemName: upperImageName)
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundStyle(Color(hex: "FEFFD2"))
                .opacity(0.8)
            
            
            
            Text(largerText)
                .font(.largeTitle.bold())
                .foregroundStyle(Color(hex: "FEFFD2"))
                .opacity(0.8)
            
            Text(shorterText)
                .font(.footnote.bold())
                .foregroundStyle(Color(hex: "FEFFD2"))
                .opacity(0.8)
        }
        .padding()
        .onTapGesture {
            if tapEnabled{
                self.tasklyViewModel.toggleIsSheetPresented()
                self.tasklyViewModel.taskContent = ""
            }

        }
        .fullScreenCover(isPresented: self.$tasklyViewModel.isSheetPresented, content: {
            TasklyCreateTask(tasklyViewModel: self.tasklyViewModel)
        })
    }
}

