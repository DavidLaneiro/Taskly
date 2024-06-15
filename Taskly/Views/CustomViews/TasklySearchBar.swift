//
//  TasklySearchBar.swift
//  Taskly
//
//  Created by David  Lourenço on 09/06/2024.
//

import Foundation
import SwiftUI

struct TasklySearchBar: View {
    
    @ObservedObject var tasklyViewModel : TasklyViewModel
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundStyle(TasklyCustomColors.darkerOrange).padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 0))
            
            TextField("", text: self.$tasklyViewModel.searchBarQuery, prompt: Text("Search for your task").foregroundStyle(TasklyCustomColors.darkerOrange.opacity(0.5)))
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                .textFieldStyle(.plain)
                .foregroundStyle(TasklyCustomColors.darkerOrange)
                
            if !tasklyViewModel.searchBarQuery.isEmpty{
                Button(action:{
                    // Delete all text in the textField
                    self.tasklyViewModel.deleteSearchBarQuery()
                    
                }){
                    Image(systemName: "xmark")
                        .foregroundStyle(TasklyCustomColors.darkerOrange)
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 20))
                }
            }
        
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .background(
            RoundedRectangle(cornerRadius: 30.0)
                .fill(TasklyCustomColors.customYellow)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .frame(height: 50)
            
        )
    }
}
