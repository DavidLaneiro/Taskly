//
//  TasklyLogo.swift
//  Taskly
//
//  Created by David  Lourenço on 08/06/2024.
//

import Foundation
import SwiftUI

struct TasklyLogo: View {
    var body: some View {
        HStack{
            Image(systemName: "text.justifyleft")
                .resizable()
                .foregroundStyle(TasklyCustomColors.customYellow)
                .frame(width: 20, height: 20)
            Text("Taskly")
                .font(.title.bold())
                .foregroundStyle(TasklyCustomColors.customYellow)
        }
    }
}

