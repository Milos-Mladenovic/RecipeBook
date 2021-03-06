//
//  Image+CoreDataProperties.swift
//  RecipeBook
//
//  Created by Milos Mladenovic on 2/9/17.
//  Copyright © 2017 Milos Mladenovic. All rights reserved.
//

import Foundation
import CoreData


extension Image {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Image> {
        return NSFetchRequest<Image>(entityName: "Image");
    }

    @NSManaged public var image: NSObject?
    @NSManaged public var toItem: Item?

}
