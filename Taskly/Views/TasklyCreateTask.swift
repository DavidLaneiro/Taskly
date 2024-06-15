//
//  TasklyCreateTask.swift
//  Taskly
//
//  Created by David  Lourenço on 10/06/2024.
//

import SwiftUI

struct TasklyCreateTask: View {
    
    @ObservedObject var tasklyViewModel: TasklyViewModel
    @FocusState private var isTextfieldFocused : Bool
    
    var body: some View {
        ZStack {
            Color(hex: "FD9B63").ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                        TasklyCancelCreate(tasklyViewModel: tasklyViewModel)

                    TextField("", text: $tasklyViewModel.taskContent, prompt: Text("Insert your new task here").foregroundStyle(Color(hex: "FEFFD2").opacity(0.5)), axis: .vertical)
                        .textFieldStyle(.plain)
                        .foregroundStyle(Color(hex: "FEFFD2"))
                        .focused(self.$isTextfieldFocused)
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
            }
        }.onAppear(perform: {
            DispatchQueue.main.async {
                isTextfieldFocused = true
            }
        })
        .onTapGesture(perform: {
            DispatchQueue.main.async {
                self.isTextfieldFocused = false
            }
        })
    }
}
