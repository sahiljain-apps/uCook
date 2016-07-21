//
//  FoodSearchTableViewCell.swift
//  
//
//  Created by Sahil Jain on 7/7/16.
//
//

import UIKit
import Parse

protocol FoodSearchTableViewCellDelegate: class {
    func cell(cell: FoodSearchTableViewCell)
    
}

class FoodSearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    weak var delegate: FoodSearchTableViewCellDelegate?
    
    var foodArray:[String] = []
    
    
    @IBAction func buttonTapped(sender: AnyObject) {
//        delegate?.cell(self)
//        foodArray.append(self.label.text!)
//        
//        var array1 = FoodSearchViewController().getArray()
////        array1.removeAll()
////        FoodSearchViewController().tableView.reloadData()
//        
//        print(foodArray)

        }
    }
