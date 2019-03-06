//
//  viewControllerStats.swift
//  Juiced
//
//  Created by student on 12/2/16.
//  Copyright © 2016 badGuyApps. All rights reserved.
//

import UIKit

class viewControllerStats: UIViewController{
    
    @IBOutlet var ageSlide: UISlider!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var heightSlide: UISlider!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightSlide: UISlider!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var activitySlide: UISlider!
    @IBOutlet var activityLabel: UILabel!
    
    var gender = 0
    var BMR = 0.0  //Basal Metabolic Rate
    
    
    
    
    @IBAction func ageChange(_ sender: AnyObject) {
        
        let ageCurrent = Int(ageSlide.value)
        ageLabel.text = "\(ageCurrent)"
            }
    @IBAction func heightChange(_ sender: AnyObject) {
        
        let heightCurrent = Int(heightSlide.value)
        heightLabel.text = "\(heightCurrent)"
        
    }
        
    @IBAction func weightChange(_ sender: AnyObject) {
        let weightCurrent = Int(weightSlide.value)
        weightLabel.text = "\(weightCurrent)"
        
    }
    
    
    @IBAction func activityChange(_ sender: AnyObject) {
        let activityCurrent = Int(activitySlide.value)
        activityLabel.text = "\(activityCurrent)"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ageLabel.text = "???"
        heightLabel.text = "???"
        weightLabel.text = "???"
        activityLabel.text = "??"
    }
    
    func getActivity () -> Double
    {
        let activity = (Double)(activityLabel.text!)
        
        
        
        if (activity == 1.0)
        {
            return 1.2
        }
        else if (activity == 2.0)
        {
            return 1.375
        }
        else if (activity == 3.0)
        {
            return 1.55
            
        }
        else if (activity == 4.0)
        {
            return 1.725
        }
        else
        {
            return 1.9
        }
    }
    
    @IBAction func calculateCaloriesNeeded(_ sender: AnyObject) {
         print("\(gender)")
         let age = (Double)(ageLabel.text!)
         let height = ((Double)(heightLabel.text!)! * 2.54)
         let weight = ((Double)(weightLabel.text!)! / 2.2046 )
        
         BMR = ((6.25*height) + (10*weight) - (age!*5.0))
        
         if (gender == 1) {
            
            BMR += 5
            
         }
            
         else {
            BMR -= 161
         }
        
         BMR = BMR * getActivity() //different activity levels result in different calorie counts
        
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
        
        
        if segue.identifier == "submitStats" {
            let sh=(segue.destination) as! ViewConrollerPicker
            sh.calorieNeed = (Int)(BMR)
        }
    
    
    }

    
}
