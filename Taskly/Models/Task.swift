//
//  Task.swift
//  Taskly
//
//  Created by David  Lourenço on 11/06/2024.
//

import Foundation

struct Task : Identifiable, Codable {
    
    var id : UUID
    var title : String
    var dueDate : Date
    var isCompleted : Bool
    var order: Int64
    
    init(entity: TaskEntity) {
        self.id = entity.id ?? UUID()
        self.title = entity.title ?? ""
        self.dueDate = entity.dueDate ?? Date()
        self.isCompleted = entity.isCompleted
        self.order = entity.order
    }
}
