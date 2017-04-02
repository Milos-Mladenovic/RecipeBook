//
//  Item+CoreDataClass.swift
//  RecipeBook
//
//  Created by Milos Mladenovic on 2/9/17.
//  Copyright © 2017 Milos Mladenovic. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.created = NSDate()
    }
    
}
