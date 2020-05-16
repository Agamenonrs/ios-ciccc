//
//  Todo.swift
//  Assignment6
//
//  Created by Agamenon Rocha Dos Santos on 15/05/20.
//  Copyright © 2020 Agamenon. All rights reserved.
//

import Foundation

class Todo {
    var title: String
    var todoDescription: String
    var isComplete: Bool
    var priority : Int
    
    init(title : String, todoDescription: String, isComplete : Bool, priority : Int ) {
        self.title = title
        self.todoDescription = todoDescription
        self.isComplete = isComplete
        self.priority = priority
        
    }
    
}
