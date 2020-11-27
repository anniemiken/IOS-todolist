//
//  Lists+CoreDataProperties.swift
//  IOS-todolist
//
//  Created by Bahja Faqid on 2020-11-27.
//
//

import Foundation
import CoreData


extension Lists {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Lists> {
        return NSFetchRequest<Lists>(entityName: "Lists")
    }

    @NSManaged public var date: Date?
    @NSManaged public var identifier: String?
    @NSManaged public var name: String?

}

extension Lists : Identifiable {

}
