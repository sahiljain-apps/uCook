//
//  AppDelegate.swift
//  uCook
//
//  Created by Sahil Jain on 7/6/16.
//  Copyright © 2016 Sahil Jain. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
//        
//        let parameters = [
//            "fillingredients": "false",
//            "ingredients": "apples,flour,sugar",
//            "limitLicense": "false",
//            "number": "5",
//            "ranking": "1",
//            ]
//        
//        let headers = [
//            "X-Mashape-Key" : "JXzflsmovMmshEocNmtGsJrVRT7cp1x4OjGjsnOnagilxH6SfW",
//            "Accept": "application/json"
//        ]
//        
//        Alamofire.request(.GET, "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients", parameters: parameters, headers: headers).responseJSON { response in
////            print(response)
//            
//            if let value = response.result.value {
//                let json = JSON(value)
//                
//                // Do what you need to with JSON here!
//                // The rest is all boiler plate code you'll use for API requests
//                json.array
//                
//                for value in 0...(json.count-1) {
//                    print(json[value]["title"])
//                }
//
//            }
//        }
//        
//        let parameters = [
//            "fields" : "item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat",
//            
//            "appId" : "e8c8b903",
//            "appKey" : "9d5b1b90b6c72a4d84ac66cab8ba2f10"
//        ]
//        
//        let headers = [
//            "Content-Type": "application/json"
//        ]
//        Alamofire.request(.GET, "https://api.nutritionix.com/v1_1/search/cheddar%20cheese?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat&appId=e8c8b903&appKey=9d5b1b90b6c72a4d84ac66cab8ba2f10").responseJSON { response in print(response)
//
//            if let value = response.result.value {
//                let foodItems = JSON(value)
//                foodItems.array
//            }
//        }
//        

        
        
        // Override point for customization after application launch.
        return true
        
        
    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

