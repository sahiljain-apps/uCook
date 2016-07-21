//
//  FoodSearchViewController.swift
//  uCook
//
//  Created by Sahil Jain on 7/7/16.
//  Copyright © 2016 Sahil Jain. All rights reserved.
//

import Alamofire
import UIKit
import SwiftyJSON

class FoodSearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate {
    
    var searchActive : Bool = false
    
    
    var filtered:[String] = []
    
    @IBOutlet weak var label: UILabel!

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    enum State {
        case DefaultMode
        case SearchMode
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var array:[String] = []
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let variable = searchBar.text
        
        searchBar.setShowsCancelButton(true, animated: true)
        
        
        let parameters = [
            
            "api_key": "Adi6OlKunz11Hn3Ms8SOvTeH6AHQzwmr8dMFJSJR",
            
            "offset":"0",
            
            "max": "10",
            
            
            "sort":"r",
            
            "q": variable!,
            
            "format": "json"
            
        ]
        
        let headers = [
            "Content-Type": "application/json"
        ]
        
        
        Alamofire.request(.GET, "https://api.nal.usda.gov/ndb/search/", parameters: parameters, headers: headers).responseJSON { response in
            print("Hello")
            
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    self.array.append(variable!)
                    
                    var b: Int = 0
                    var c: Int = json["list"]["item"][b].count
                    if (c >= 10) {
                        b = 9
                    }
                    else {
                        b = c - 1
                    }
                    
                    self.array.append(variable!)
                    for value in 1...b {
                        self.array.append(json["list"]["item"][value]["name"].stringValue)

                    }
                    
                    
                    self.tableView.reloadData()
                    
                    searchBar.resignFirstResponder()

                    
                    
                    
                    
                }
            case .Failure(let error):
                print(error)
                
                searchBar.resignFirstResponder()

            }
            
            
            
            
        }
        
        
    }
    
    
    
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchBar.text = ""
        searchBar.setShowsCancelButton(false, animated: true)
        array.removeAll()
        tableView.reloadData()
    }
    
   
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.tableView.reloadData()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        return array.count
        
        
    }
    
    var a: Int = 0
    
    func getArray() -> [String] {
        return array;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FoodCell") as! FoodSearchTableViewCell
        
        
        if (array.count > 0) {
            cell.label.text = array[a]
            if (a < array.count-1) {
            a = a + 1
            }
        }
        
        
        
        return cell
    }
    

    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}


