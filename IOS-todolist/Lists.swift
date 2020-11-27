//
//  ListItem.swift
//  IOS-todolist
//
//  Created by Bahja Faqid on 2020-11-27.
//

import Foundation
import CoreData

public class Lists: NSManagedObject{
    @NSManaged public var date: Date?
    @NSManaged public var identifier: String?
    @NSManaged public var name: String?
}
