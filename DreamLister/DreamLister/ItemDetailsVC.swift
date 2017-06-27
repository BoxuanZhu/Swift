//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Boxuan Zhu on 6/27/17.
//  Copyright © 2017 Boxuan Zhu. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    @IBOutlet weak var thumgImg: UIImageView!
 
    var stores = [Store]()
    var itemToEdit: Item?
    var imgPicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleField.delegate = self
        priceField.delegate = self
        detailsField.delegate = self
        storePicker.delegate = self
        storePicker.dataSource = self
        imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        //generateStores()
        getStores()
        
        if itemToEdit != nil {
            loadItemData()
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            thumgImg.image = img
        }
        
        imgPicker.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBAction func savePressed(_ sender: UIButton){
        var item: Item!
        
        let picture = Image(context: context)
        picture.image = thumgImg.image
        if itemToEdit == nil {
            item = Item(context: context)
            
        } else {
            item = itemToEdit
        }
        
        item.image = picture
        
        if let title = titleField.text {
            item.title = title
        }
        
        if let price = priceField.text{
            item.price = Double(price)!
        }
        
        if let details = detailsField.text {
            item.details = details
        }
        
        item.store = stores[storePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
        
    }
    
    @IBAction func addImg(_ sender: UIButton){
        present(imgPicker, animated: true, completion: nil)
    }
    
    @IBAction func deletePressed(_ sender: UIButton){
        if itemToEdit != nil {
            context.delete(itemToEdit!)
            ad.saveContext()
        }
        _ = navigationController?.popViewController(animated: true)
    }
    
    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            print( "error occured")
        }
    }
    
    func generateStores() {
        let store = Store(context: context)
        store.name = "Best Buy"
        let store2 = Store(context: context)
        store2.name = "Kmart"
        let store3 = Store(context: context)
        store3.name = "Tesla"
        let store4 = Store(context: context)
        store4.name = "Amazon"
        let store5 = Store(context: context)
        store5.name = "Ebay"
        let store6 = Store(context: context)
        store6.name = "Footlocker"
        
        ad.saveContext()
        
        
    }
    
    func loadItemData() {
        
        if let item = itemToEdit {
            thumgImg.image = item.image?.image as? UIImage
            titleField.text = item.title
            priceField.text = "\(item.price)"
            detailsField.text = item.details
            
            if let store = item.store {
                
                var index = 0
                repeat {
                    let s = stores[index]
                    if s.name == store.name {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
                }while(index < stores.count)
            }
        }
    }

}
