//
//  ItemDetailsVC.swift
//  RecipeBook
//
//  Created by Milos Mladenovic on 2/10/17.
//  Copyright © 2017 Milos Mladenovic. All rights reserved.
//

import UIKit
import CoreData
class ItemDetailsVC: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    @IBOutlet weak var detailsField: UITextView!
    @IBOutlet weak var thumbImg: UIImageView!

    
    
    var types = [ItemType]()
    
    var itemToEdit: Item?
    var imagePicker: UIImagePickerController!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        detailsField.delegate = self
        detailsField.clipsToBounds = true
        
        detailsField.text = "Write your recipe here..."
     
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        if itemToEdit != nil {
            loadItemData()
        }
        
      
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ItemDetailsVC.dismissKeyboard))
        
                view.addGestureRecognizer(tap)
        }
    
        func dismissKeyboard() {
        view.endEditing(true)
        }
        func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
            if detailsField.text == "Write your recipe here..." {
                detailsField.textColor = UIColor.lightGray
        }
            return (detailsField != nil)
        }
    

    
        func textViewDidBeginEditing(_ textView: UITextView) {
            if  detailsField.text == "Write your recipe here..." &&
                detailsField.textColor == UIColor.lightGray {
                detailsField.text = ""
                detailsField.textColor = UIColor.black
            }
        }
        func textViewDidEndEditing(_ textView: UITextView) {
             if detailsField.text == "" {
                detailsField.text = "Write your recipe here..."
                detailsField.textColor = UIColor.lightGray
            }
        }
    
        @IBAction func savePressed(_ sender: UIButton) {
        
            var item:Item!
        
            let picture = Image(context: context)
                picture.image = thumbImg.image
            
        
        
            if itemToEdit == nil  {
            
                item = Item(context: context)
            
                }else {
            
                    item = itemToEdit
                }
            
                item.toImage = picture
        
                if let title = titleField.text {
        
        item.title = title
        }
        
        if let time = timeField.text{
        item.time = (time as NSString).doubleValue
        }
        
        if let details = detailsField.text{
        item.details = details
        }
        
        
        
        ad.saveContext()
        
       _ = navigationController?.popViewController(animated: true)
    }
    
    func loadItemData() {
        
        if let item = itemToEdit {
            titleField.text = item.title
            timeField.text = "\(item.time)"
            detailsField.text = item.details
            thumbImg.image = item.toImage?.image as? UIImage
            
        }
        
    }
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        
        
    present(imagePicker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            thumbImg.image = img
            
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
}
