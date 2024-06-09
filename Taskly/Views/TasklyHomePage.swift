//
//  TasklyHomePage.swift
//  Taskly
//
//  Created by David  Lourenço on 08/06/2024.
//

import SwiftUI

struct TasklyHomePage: View {
    
    @StateObject private var tasklyViewModel = TasklyViewModel()
    
    var body: some View {
        ZStack{
            
            // Custom Gradient
            LinearGradient(colors: [Color(hex: "FF7D29"), Color(hex: "FFBF78")], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            ScrollView{
                VStack(spacing: -10){
                    
                    // Logo section
                    TasklyLogoSection(tasklyViewModel: self.tasklyViewModel)
                    
                    VStack{
                        // Search bar
                        TasklySearchBar(tasklyViewModel: self.tasklyViewModel)
                        
                        // "Done" and "In Progress" Filters
                        TasklyFilter()
                        
                        // Title
                        TasklyLeftTitle(title: "Tasks").hidden()
                        
                        
                        // No Data Screen
                        TasklyNoTasks(tasklyViewModel: self.tasklyViewModel)
                        
                    }
     
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    TasklyHomePage()
}
