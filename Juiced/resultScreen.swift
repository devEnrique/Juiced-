//
//  resultScreen.swift
//  Juiced
//
//  Created by Student on 12/8/16.
//  Copyright © 2016 badGuyApps. All rights reserved.
//

import UIKit
import CoreData

class resultScreen : UIViewController {
    
    @IBOutlet weak var finalLabel: UILabel!
    @IBOutlet weak var caloriesReq: UILabel!
    @IBOutlet weak var juiceCalorie: UILabel!
    var result = ""
    var calNeeded = ""
    var name = ""
    var finalCal = ""
    
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        juiceCalorie.text = "\(name) contains:\(result) calories"
        
        caloriesReq.text = "Calories required for today :\(calNeeded) "
        
        finalLabel.text = "Calories required after \(name):\(finalCal) "
        
    }
    

    
    @IBAction func saveJuice(_ sender: AnyObject) {
        
        
        let AppDel : AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context : NSManagedObjectContext = AppDel.managedObjectContext
        
        let newJuice = NSEntityDescription.insertNewObject(forEntityName: "Collection", into: context)
        
        newJuice.setValue(name, forKey: "juiceName")
        
        newJuice.setValue(result, forKey: "calories")
        
        do {
            try context.save()
        } catch let error {
            print("Could not cache the response \(error)")
        }
        
        print(newJuice)
        
        
        
        
        
    }

}
