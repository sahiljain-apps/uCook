//
//  RecipeDisplayViewController.swift
//  uCook
//
//  Created by Sahil Jain on 7/8/16.
//  Copyright © 2016 Sahil Jain. All rights reserved.
//

import UIKit

class RecipeDisplayViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    var imageURL: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = NSURL(string: imageURL) else { print("Error with NSURL"); return }
        
        print("URL STRING : \(imageURL)")
        print("URL : \(url)")
        print(UIApplication.sharedApplication().canOpenURL(url))
        
        guard let data = NSData(contentsOfURL: url) else { print("Error with NSData"); return }
        guard let image = UIImage(data: data) else { print("Error with UIImage"); return }

        self.image.image = image
    }
}
