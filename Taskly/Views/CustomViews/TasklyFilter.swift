//
//  TasklyFilter.swift
//  Taskly
//
//  Created by David  Lourenço on 09/06/2024.
//

import Foundation
import SwiftUI

enum ButtonType {
    case All
    case Completed
    case InProgress
}

struct TasklyFilter: View {
    
    @ObservedObject var tasklyViewModel : TasklyViewModel
    @State private var selectedButtonType: ButtonType = .All
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal){
                HStack(spacing: 10){
                    TasklySingleFilterButton(tasklyViewModel: self.tasklyViewModel, buttonTitle: "All", buttonImageName: "list.bullet.clipboard", isSelected: selectedButtonType == .All){
                        
                        selectedButtonType = .All
                        self.tasklyViewModel.isAllToggled = true
                        self.tasklyViewModel.isCompletedToggled = false
                        self.tasklyViewModel.isInProgressToggled = false
                        self.tasklyViewModel.deleteSearchBarQuery()
                        
                        withAnimation{
                            proxy.scrollTo(1)
                        }
                        
                        
                    }.id(1)
                    
                    TasklySingleFilterButton(tasklyViewModel: self.tasklyViewModel, buttonTitle: "Done", buttonImageName: "checkmark", isSelected: selectedButtonType == .Completed){
                        
                        selectedButtonType = .Completed
                        self.tasklyViewModel.isAllToggled = false
                        self.tasklyViewModel.isCompletedToggled = true
                        self.tasklyViewModel.isInProgressToggled = false
                        self.tasklyViewModel.deleteSearchBarQuery()
                        withAnimation{
                            proxy.scrollTo(2)
                        }
                    }.id(2)
                    
                    TasklySingleFilterButton(tasklyViewModel: self.tasklyViewModel, buttonTitle: "In progress", buttonImageName: "rays", isSelected: selectedButtonType == .InProgress){
                        
                        selectedButtonType = .InProgress
                        self.tasklyViewModel.isAllToggled = false
                        self.tasklyViewModel.isCompletedToggled = false
                        self.tasklyViewModel.isInProgressToggled = true
                        self.tasklyViewModel.deleteSearchBarQuery()
                        withAnimation{
                            proxy.scrollTo(3)
                        }
                        
                    }.id(3)
                    
                }
            }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    TasklyHomePage()
}

