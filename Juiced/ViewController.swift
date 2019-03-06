//
//  ViewController.swift
//  Juiced
//
//  Created by student on 12/2/16.
//  Copyright © 2016 badGuyApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //code to add date (do not need anymore)
        //date.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: NSDateFormatterStyle.LongStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
        
        
        if segue.identifier == "male" {
            let sh=(segue.destination) as! viewControllerStats
            sh.gender = 1
        }
        else {
            let sh=(segue.destination) as! viewControllerStats
            sh.gender = 2
        }
    }


}

