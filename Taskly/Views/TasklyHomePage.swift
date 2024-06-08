//
//  TasklyHomePage.swift
//  Taskly
//
//  Created by David  Lourenço on 08/06/2024.
//

import SwiftUI

struct TasklyHomePage: View {
    
    var body: some View {
        ZStack{
            
            // Custom Gradient
            LinearGradient(colors: [Color(hex: "FF7D29"), Color(hex: "FFBF78")], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack(spacing: -10){
                
                // Title and plus button
                
                HStack{
                    TasklyLogo()
                    .padding(20)
                    Spacer()
                    
                    Button(action: {
                        
                    }){
                        Image(systemName: "plus.circle.fill").resizable().foregroundStyle(Color(hex: "FEFFD2")).frame(width: 32, height: 32).padding(20)
                    }
                }
                
                // Search bar
                TasklySearchBar()
                
            

                Spacer()
            }
        }
    }
}

#Preview {
    TasklyHomePage()
}

