//
//  TasklyLeftTitle.swift
//  Taskly
//
//  Created by David  Lourenço on 09/06/2024.
//

import Foundation
import SwiftUI

struct TasklyLeftTitle: View {
    
    let title : String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack{
            Text(title)
                .font(.title.bold())
                .foregroundStyle(Color(hex: "FEFFD2"))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
        }
        
    }
}

