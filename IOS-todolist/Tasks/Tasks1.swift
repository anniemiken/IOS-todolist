//
//  Lists.swift
//  IOS-todolist
//
//  Created by Bahja Faqid on 2020-11-25.
//

import Foundation
import UIKit

struct Task: Codable{
    let tasks: [Tasks]
    init(tasks: [Tasks]){
        self.tasks = tasks
    }
}

struct Tasks: Codable{
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
    
    init(userId: Int, id: Int, title: String, completed: Bool){
        self.userId = userId
        self.id = id
        self.title = title
        self.completed = completed
    }
}
