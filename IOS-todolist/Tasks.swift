//
//  Lists.swift
//  IOS-todolist
//
//  Created by Bahja Faqid on 2020-11-25.
//

import Foundation
struct Tasks: Decodable{
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool?
}
