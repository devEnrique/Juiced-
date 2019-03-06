//
//  lookUP.swift
//  Juiced
//
//  Created by student on 12/12/16.
//  Copyright © 2016 badGuyApps. All rights reserved.
//

import UIKit
import CoreData

class lookUP : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var txtJuiceName: UITextField!
    @IBOutlet var juiceCalorie: UILabel!
    
    @IBAction func load(_ sender: AnyObject) {
        
        let AppDel : AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context : NSManagedObjectContext = AppDel.managedObjectContext
        
        let request = NSFetchRequest<NSFetchRequestResult> (entityName: "Collection")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate (format: "juiceName = %@" , txtJuiceName.text!)
        
        do {
            let results:NSArray = try context.fetch(request) as NSArray
            if (results.count > 0){
                let res = results[0] as! NSManagedObject
                txtJuiceName.text = (res.value(forKey: "juiceName") as! String)
                juiceCalorie.text = (res.value(forKey: "calories") as! String)
                
            }
            else {
                juiceCalorie.text = "Juice not found"
            }

            } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        
        
        
    }
    
}
