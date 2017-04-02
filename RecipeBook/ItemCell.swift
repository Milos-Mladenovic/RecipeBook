//
//  ItemCell.swift
//  RecipeBook
//
//  Created by Milos Mladenovic on 2/10/17.
//  Copyright © 2017 Milos Mladenovic. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var details: UILabel!

    
    
    
    

    func configureCell(item: Item) {
        
        title.text = item.title
        time.text = "\(item.time)min"
        details.text = item.details
        thumb.image = item.toImage?.image as? UIImage
        
        
    }
    
    
    
    
    
    
    
}
