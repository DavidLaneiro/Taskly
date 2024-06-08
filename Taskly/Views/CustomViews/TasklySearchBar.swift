//
//  TasklySearchBar.swift
//  Taskly
//
//  Created by David  Lourenço on 09/06/2024.
//

import Foundation
import SwiftUI

struct TasklySearchBar: View {
    
    @State private var taskSearchQuery : String = ""
    
    var body: some View {
        HStack(alignment: .center){
            Image(systemName: "magnifyingglass")
                .foregroundStyle(Color(hex: "FF7D29")).padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: -20))
            
            TextField("Search for your task", text: $taskSearchQuery)
                .padding(20)
                .textFieldStyle(.plain)
                .foregroundStyle(Color(hex: "FF7D29"))
            
            
            Button(action:{}){
                Image(systemName: "xmark")
                    .foregroundStyle(Color(hex: "FF7D29"))
                    .padding(EdgeInsets(top: 20, leading: -20, bottom: 20, trailing: 20))
            }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
        .background(
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color(hex: "FEFFD2"))
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .frame(height: 50)
            
        )
    }
}
