//
//  TasklyGroupListElement.swift
//  Taskly
//
//  Created by David  Lourenço on 19/06/2024.
//

import SwiftUI


struct TasklyGroupListElement: View {
    var body: some View {
        HStack(spacing: 20){
            
            Image(systemName: "bookmark.fill")
                .resizable()
                .frame(width: 10, height: 15)
                .foregroundStyle(TasklyCustomColors.darker)
            
            Text("Bookmarks Group")
                .lineLimit(1)
                .font(.system(size: 16))
                .bold()
                .foregroundStyle(TasklyCustomColors.darker)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 5, height: 10)
                .foregroundStyle(TasklyCustomColors.darker)
                .onTapGesture(perform: {
                    // Needs favorite logic!!!
                })
            
            
        }
    }
}
