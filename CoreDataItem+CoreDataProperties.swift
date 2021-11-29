//
//  CoreDataItem+CoreDataProperties.swift
//  Countries
//
//  Created by Artun Erol on 28.11.2021.
//
//

import Foundation
import CoreData


extension CoreDataItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataItem> {
        return NSFetchRequest<CoreDataItem>(entityName: "CoreDataItem")
    }

    @NSManaged public var name: String?

}

extension CoreDataItem : Identifiable {

}
