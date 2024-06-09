//
//  TasklyViewModel.swift
//  Taskly
//
//  Created by David  Lourenço on 09/06/2024.
//

import Foundation
import SwiftUI
import Combine

class TasklyViewModel : ObservableObject{
    
    @Published var searchBarQuery : String = ""
    @Published var isSheetPresented : Bool = false

    private var cancellables : Set<AnyCancellable> = []

    
    func deleteSearchBarQuery(){
        
        self.searchBarQuery = ""
        
    }
    
    func toggleIsSheetPresented(){
        
        self.isSheetPresented.toggle()
        
    }
    
    
}
