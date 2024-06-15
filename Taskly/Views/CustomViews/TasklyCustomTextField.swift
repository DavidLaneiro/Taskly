//
//  TasklyCustomTextField.swift
//  Taskly
//
//  Created by David  Lourenço on 15/06/2024.
//

import SwiftUI


struct TasklyCustomTextField: View {
    
    @ObservedObject var tasklyViewModel: TasklyViewModel
    @FocusState private var isTextfieldFocused : Bool
    
    var body: some View {
        ZStack(alignment: .topLeading){
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color(hex: "FEFFD2"))
                .frame(height: 200)
            
            TextField("", text: $tasklyViewModel.taskContent, prompt: Text("Insert your task here")
                .foregroundStyle(Color(hex: "FD9B63")
                    .opacity(0.5)
                ), axis: .vertical)
            .padding(20)
            .textFieldStyle(.plain)
            .focused(self.$isTextfieldFocused)
            .background(
                RoundedRectangle(cornerRadius: 20.0)
                    .fill(Color(hex: "FEFFD2"))
                
            )
            .foregroundStyle(Color(hex: "FD9B63"))
            .font(.system(size: 18, weight: .bold))
            
            
        }
        .onAppear(perform: {
            DispatchQueue.main.async {
                isTextfieldFocused = true
            }
        })
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
    }
}
