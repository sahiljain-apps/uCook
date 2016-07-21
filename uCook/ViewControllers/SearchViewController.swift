//
//  SearchViewController.swift
//  uCook
//
//  Created by Sahil Jain on 7/6/16.
//  Copyright © 2016 Sahil Jain. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class SearchViewController: UIViewController {
    
    var idNumbers: [String] = []
    
    

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    
    
    
    var string: String = ""
    
    
    
    
    @IBAction func button2tapped(sender: AnyObject) {
        if (idNumbers.count > 0) {
            print(idNumbers[1])
        }
    }
    
    
    @IBAction func button3tapped(sender: AnyObject) {
        if (idNumbers.count > 0) {
            print(idNumbers[2])
        }
    }
    
    
    @IBAction func button4tapped(sender: AnyObject) {
        if (idNumbers.count > 0) {
            print(idNumbers[3])
        }
    }
    
    @IBAction func button5tapped(sender: AnyObject) {
        if (idNumbers.count > 0) {
            print(idNumbers[4])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toRecipeViewController" {
            
            
             if (idNumbers.count > 0) {
             print(idNumbers[0])
    
             
             
             
             let headers = [
             "X-Mashape-Key" : "JXzflsmovMmshEocNmtGsJrVRT7cp1x4OjGjsnOnagilxH6SfW",
             "Accept": "application/json"
             ]
             
             Alamofire.request(.GET, "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/" + idNumbers[0] + "/information?includeNutrition=false", headers: headers).responseJSON { response in
             print()
             
             if let value = response.result.value {
             let json = JSON(value)
             
             
             json.array
             
             json["image"]
             
             self.string = json["image"].stringValue
        
             
             RecipeDisplayViewController().imageURL = self.string
             RecipeDisplayViewController().viewDidLoad()
             }
             }
             }
            
 
        }
    }
 
}


extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
 
        textField.resignFirstResponder()
 
 
 
        let parameters = [
            "fillingredients": "false",
            "ingredients": textField.text!,
            "limitLicense": "false",
            "number": "5",
            "ranking": "1",
            ]
        
        let headers = [
            "X-Mashape-Key" : "JXzflsmovMmshEocNmtGsJrVRT7cp1x4OjGjsnOnagilxH6SfW",
            "Accept": "application/json"
        ]
        
        Alamofire.request(.GET, "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients", parameters: parameters, headers: headers).responseJSON { response in
            //            print(response)
            
            if let value = response.result.value {
                let json = JSON(value)
                
                // Do what you need to with JSON here!
                // The rest is all boiler plate code you'll use for API requests
                json.array
                
                self.label.text = (json[0]["title"].stringValue)
                self.label1.text = (json[1]["title"].stringValue)
                self.label2.text = (json[2]["title"].stringValue)
                self.label3.text = (json[3]["title"].stringValue)
                self.label4.text = (json[4]["title"].stringValue)
                
                self.idNumbers.append(json[0]["id"].stringValue)
                self.idNumbers.append(json[1]["id"].stringValue)
                self.idNumbers.append(json[2]["id"].stringValue)
                self.idNumbers.append(json[3]["id"].stringValue)
                self.idNumbers.append(json[4]["id"].stringValue)

                
            }
            
            
        }
        textField.text = ""

        
        return true
        
    }
    
    func getUrl() -> (String) {
        return string
    }
    
    
    
}


