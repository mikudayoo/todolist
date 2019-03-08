//
//  addViewController.swift
//  todolist
//
//  Created by 横尾美空 on 2019/02/09.
//  Copyright © 2019年 横尾美空. All rights reserved.
//

import UIKit

class addViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet var doTextField : UITextField!
    @IBOutlet var pickerView : UIPickerView!
    @IBOutlet var label : UILabel!
    var saveData : UserDefaults = UserDefaults.standard
    var dayAndPlaceArray : [Dictionary<String,String>] = []
    var selectedInfo : Int!
    var contentsList :[String]!
    var addArray : [Dictionary<String,String>] = []
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.doTextField.delegate = self
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        
        if saveData.array(forKey: "DAYANDPLACE") != nil{
            dayAndPlaceArray = saveData.array(forKey: "DAYANDPLACE") as! [Dictionary<String, String>]
           //if dayAndPlaceArray[selectedInfo ]
            print(selectedInfo)
            print(dayAndPlaceArray[selectedInfo])
            contentsList = [dayAndPlaceArray[selectedInfo]["CONTENTS"],dayAndPlaceArray[selectedInfo]["CONTENTS2"],dayAndPlaceArray[selectedInfo]["CONTENTS3"],dayAndPlaceArray[selectedInfo]["CONTENTS4"],dayAndPlaceArray[selectedInfo]["CONTENTS5"]] as? [String]
        }
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return  1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dayAndPlaceArray.count
    }
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return contentsList [row]
    }
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        
        label.text = contentsList[row]
        
    }
    
    @IBAction func add(){
        let addDictionary = ["TEXT":label.text!,
                             "THINGS":doTextField.text!]
       addArray.append(addDictionary)
       addArray = saveData.array(forKey: "DO") as! [Dictionary<String, String>]
    }
    @IBAction func back (){
        self.dismiss(animated: true, completion: nil)
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
