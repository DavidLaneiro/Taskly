//
//  TasklyCreateTask.swift
//  Taskly
//
//  Created by David  Lourenço on 10/06/2024.
//

import SwiftUI

struct TasklyCreateTask: View {
    
    @ObservedObject var tasklyViewModel : TasklyViewModel
    
    var body: some View {
        ZStack{
            
            // Custom Gradient
            LinearGradient(colors: [Color(hex: "FF7D29"), Color(hex: "FFBF78")], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            ScrollView{
                VStack{
                    HStack{
                        Button(action:{
                            
                            self.tasklyViewModel.toggleIsSheetPresented()
                            
                        }){
                            Text("Cancel")
                                .foregroundStyle(Color(hex: "FEFFD2"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                        }
                        
                    }
                    
                }
            }
        }
    }
}

#Preview {
    TasklyHomePage()
}

