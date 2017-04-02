//
//  Item+CoreDataProperties.swift
//  RecipeBook
//
//  Created by Milos Mladenovic on 2/9/17.
//  Copyright © 2017 Milos Mladenovic. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var title: String?
    @NSManaged public var details: String?
    @NSManaged public var created: NSDate?
    @NSManaged public var time: Double
    @NSManaged public var toImage: Image?
    @NSManaged public var toItemType: ItemType?

}

