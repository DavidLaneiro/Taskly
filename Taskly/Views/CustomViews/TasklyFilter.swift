//
//  TasklyFilter.swift
//  Taskly
//
//  Created by David  Lourenço on 09/06/2024.
//

import Foundation
import SwiftUI

struct TasklyFilter: View {
    var body: some View {
        HStack(spacing: 10){
            TasklySingleFilterButton(buttonTitle: "Done", buttonImageName: "checkmark")
            
            TasklySingleFilterButton(buttonTitle: "In progress", buttonImageName: "rays")

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
    }
}

#Preview {
    TasklyHomePage()
}

