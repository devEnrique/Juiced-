//
//  ViewControllerPicker.swift
//  Juiced
//
//  Created by student on 12/5/16.
//  Copyright © 2016 badGuyApps. All rights reserved.
//

import UIKit

class ViewConrollerPicker : UIViewController, UIPickerViewDelegate , UIPickerViewDataSource{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ingredients.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ingredients[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        count += 1
        
        if (count <= 5 ){
        ingredientLabel.text? += ingredients[row] + "\n"
        calorieCount += calories[row]
        
            
        }
        
        else
        {
            let myAlert = UIAlertController ( title: "Alert" , message: "Only Five Ingredients Please!" , preferredStyle: UIAlertControllerStyle.alert)
            let okayAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default){
                (ACTION) in print("")
            }
            
            myAlert.addAction(okayAction)
            self.present(myAlert, animated: true, completion: nil)
        }
    }

    @IBAction func clearIngredients(_ sender: AnyObject) {
        ingredientLabel.text = ""
        calorieCount = 0
        count = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
        
        
        if  segue.identifier == "calorieCount" {
            
            let sh=(segue.destination) as! resultScreen
            sh.result = String(calorieCount)
            sh.calNeeded = String (calorieNeed)
            sh.name = (juiceName.text)!
            sh.finalCal = String(calorieNeed-calorieCount) 
        }
        
    }

   
    @IBOutlet var juiceName: UITextField!
    @IBOutlet var picker: UIPickerView!
    @IBOutlet var ingredientLabel: UILabel!
    var calorieNeed = 0
    var count = 0
    var calorieCount=0
    var ingredients = ["Apple","Apricot", "Artichoke", "Avocado", "Banana", "Blackberry", "Bok Choy","Broccoli","Brussel Sprouts","Cabbage","Cantaloupe","Carrots","Cauliflower","Celery","Cherry","Cilantro","Collard Greens","Cranberries","Cucumber","Eggplant","Fig","Grapefruit","Grapes","Green Beans", "Honeydew Melon","Kale","Kiwi","Leeks","Lemon","Mango","Mushrooms","Nectarine","Onion","Orange","Papaya","Parsley","Parsnips","Peach","Pear","Pineapple","Plum","Prunes","Pumpkin","Radish","Raisin","Raspberry","Snow Peas", "Spinach", "Strawberry" ,"Sweet Potatoes", "Tangerine", "Tomatoes", "Watermelon", "Yam", "Yellow Sweet Corn", "Zucchini"]
    
    var calories = [ 95 , 30,60 , 150, 107, 1,  109, 31,38, 21, 25, 52,25,14, 3, 4, 56, 46,16,20,279, 52, 62,31,48, 33,34,4,20,40,15,63,44,45, 67,1, 100, 35,45,50,25,9,30,1,5,1,14,7,3,114,26,32,85, 177,85,33]
    
}
