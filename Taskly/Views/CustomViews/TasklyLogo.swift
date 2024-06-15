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
            Image(systemName: "list.bullet")
                .resizable()
                .foregroundStyle(TasklyCustomColors.customYellow)
                .frame(width: 35, height: 25)
            Text("Taskly")
                .font(.largeTitle.bold())
                .foregroundStyle(TasklyCustomColors.customYellow)
        }
    }
}

