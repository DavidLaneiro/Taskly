//
//  TasklyFilter.swift
//  Taskly
//
//  Created by David  Lourenço on 09/06/2024.
//


import Foundation
import SwiftUI

enum ButtonType {
    case All, Completed, InProgress
}

struct TasklyFilter: View {
    
    @ObservedObject var tasklyViewModel: TasklyViewModel
    @State private var selectedButtonType: ButtonType = .All
    
    var body: some View {
        HStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        filterButton(
                            title: "All tasks",
                            imageName: "list.bullet.clipboard",
                            buttonType: .All,
                            id: 1,
                            proxy: proxy
                        )
                        filterButton(
                            title: "In progress",
                            imageName: "rays",
                            buttonType: .InProgress,
                            id: 2,
                            proxy: proxy
                        )
                        filterButton(
                            title: "Completed tasks",
                            imageName: "checkmark",
                            buttonType: .Completed,
                            id: 3,
                            proxy: proxy
                        )
                        
                    }.padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                }
                .padding(.horizontal, 0)
                .scrollIndicators(.hidden)
            }

        }
        
    }
    
    private func filterButton(title: String, imageName: String, buttonType: ButtonType, id: Int, proxy: ScrollViewProxy) -> some View {
        TasklySingleFilterButton(
            tasklyViewModel: tasklyViewModel,
            buttonTitle: title,
            buttonImageName: imageName,
            isSelected: selectedButtonType == buttonType
        ) {
            selectedButtonType = buttonType
            updateViewModel(for: buttonType)
            withAnimation {
                proxy.scrollTo(id, anchor: .center)
                
            }
        }
        .id(id)
    }
    
    private func updateViewModel(for buttonType: ButtonType) {
        switch buttonType {
        case .All:
            tasklyViewModel.isAllToggled = true
            tasklyViewModel.isCompletedToggled = false
            tasklyViewModel.isInProgressToggled = false
        case .Completed:
            tasklyViewModel.isAllToggled = false
            tasklyViewModel.isCompletedToggled = true
            tasklyViewModel.isInProgressToggled = false
        case .InProgress:
            tasklyViewModel.isAllToggled = false
            tasklyViewModel.isCompletedToggled = false
            tasklyViewModel.isInProgressToggled = true
        }
        tasklyViewModel.deleteSearchBarQuery()
    }
}

#Preview {
    TasklyHomePage()
}
