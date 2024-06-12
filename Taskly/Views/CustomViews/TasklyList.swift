//
//  TasklyList.swift
//  Taskly
//
//  Created by David  Lourenço on 12/06/2024.
//

import Foundation
import SwiftUI

struct TasklyList: View {
    
    @ObservedObject var tasklyViewModel : TasklyViewModel
    
    var body: some View {
        List{
            ForEach(self.tasklyViewModel.tasks){ task in
                Button(action: {
                    
                    
                }){
                    
                    HStack(spacing: 20){
                        
                        Image(systemName: "circle")
                            .resizable()
                            .frame(width:30, height: 30)
                            .foregroundStyle(Color(hex: "FF7D29"))
                        Text("\(task.title)")
                            .lineLimit(1)
                            .font(.title3)
                            .bold()
                            .foregroundStyle(Color(hex: "FF7D29"))
                    }
                    
                }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 20).foregroundStyle(Color(hex: "FEFFD2"))
                )
            }
            .onMove(perform: { indices, newOffset in
                // Move function
                // Update the array and CoreData
            })
            .onDelete(perform: { indexSet in
                // Delete function
                // Update the array and CoreData
            })
  
        }
        .scaledToFill()
        .listRowSpacing(20)
        .listStyle(.plain)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        .scrollIndicators(.hidden)
        .background(.clear)
    }
    
}
