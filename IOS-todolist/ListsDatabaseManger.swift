//
//  ListsDatabaseManger.swift
//  IOS-todolist
//
//  Created by Bahja Faqid on 2020-11-25.
//

import Foundation
import CoreData

class ListsDatabaseManager: NSManagedObject {
    @NSManaged public var date: Date?
    @NSManaged public var identifier: String?
    @NSManaged public var name: String?

   
}
