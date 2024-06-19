//
//  TasklyGroupList.swift
//  Taskly
//
//  Created by David  Lourenço on 19/06/2024.
//

import Foundation
import SwiftUI

struct TasklyGroupList: View {
    
    @ObservedObject var tasklyViewModel : TasklyViewModel
    
    var body: some View {
      List{
            Section {
                ForEach (0...4, id: \.self){ _ in
                    
                    
                    ZStack {
                        NavigationLink(destination: TasklyHomePage()){
                            
                        }.opacity(0)
                        
                        TasklyGroupListElement()
                     
                    }.listRowBackground(TasklyCustomColors.customTextColor)
                }
            } header: {
                Text("Groups").foregroundStyle(TasklyCustomColors.customTextColor)
            }
            
        }
      .scrollContentBackground(.hidden)
      .scrollIndicators(.hidden)
    }
}

#Preview {
    TasklyHomePage()
}

