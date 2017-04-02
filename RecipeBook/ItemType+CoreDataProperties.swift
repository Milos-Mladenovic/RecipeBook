//
//  ItemType+CoreDataProperties.swift
//  RecipeBook
//
//  Created by Milos Mladenovic on 2/9/17.
//  Copyright © 2017 Milos Mladenovic. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
