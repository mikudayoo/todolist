//
//  secondViewController.swift
//  todolist
//
//  Created by 横尾美空 on 2019/02/08.
//  Copyright © 2019年 横尾美空. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
    var selectedInfo : Int!
    @IBOutlet var label1 : UIButton!
    @IBOutlet var label2 : UIButton!
    @IBOutlet var label3 : UIButton!
    @IBOutlet var label4 : UIButton!
    @IBOutlet var label5 : UIButton!
    
    @IBOutlet var memoImage2 : UIImageView!
    @IBOutlet var memoImage3 : UIImageView!
    @IBOutlet var memoImage4 : UIImageView!
    @IBOutlet var memoImage5 : UIImageView!
    
    var saveData : UserDefaults = UserDefaults.standard
    var dayAndPlaceArray : [Dictionary<String,String>] = []
    var doArray : [Dictionary<String,String>] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array(forKey: "DAYANDPLACE") != nil{
            dayAndPlaceArray = saveData.array(forKey: "DAYANDPLACE") as! [Dictionary<String, String>]
        }
        if dayAndPlaceArray[selectedInfo]["CONTENTS2"] == ""{
            label2.isHidden = true
            label3.isHidden = true
            label4.isHidden = true
            label5.isHidden = true
            label1.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS"], for: .normal)
        }else if dayAndPlaceArray[selectedInfo]["CONTENTS3"] == ""{
            label2.isHidden = false
            label3.isHidden = true
            label4.isHidden = true
            label5.isHidden = true
            label1.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS"], for: .normal)
            label2.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS2"], for: .normal)
        }else if dayAndPlaceArray[selectedInfo]["CONTENTS4"] == ""{
            label2.isHidden = false
            label3.isHidden = false
            label4.isHidden = true
            label5.isHidden = true
            label1.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS"], for: .normal)
            label2.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS2"], for: .normal)
            label3.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS3"], for: .normal)
        }else if dayAndPlaceArray[selectedInfo]["CONTENTS5"] == ""{
            label2.isHidden = false
            label3.isHidden = false
            label4.isHidden = false
            label5.isHidden = true
            label1.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS"], for: .normal)
            label2.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS2"], for: .normal)
            label3.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS3"], for: .normal)
            label4.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS4"], for: .normal)
        }else {
            label2.isHidden = false
            label3.isHidden = false
            label4.isHidden = false
            label5.isHidden = false
            label1.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS"], for: .normal)
            label2.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS2"], for: .normal)
            label3.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS3"], for: .normal)
            label4.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS4"], for: .normal)
            label5.setTitle(dayAndPlaceArray[selectedInfo]["CONTENTS5"], for: .normal)
        }
        

        // Do any additional setup after loading the view.
    }
    
    override func prepare (for segue:UIStoryboardSegue,sender : Any!){
        if (segue.identifier == "toAddView"){
            let  destinationVC: addViewController = (segue.destination as? addViewController)!
            destinationVC.selectedInfo = selectedInfo
        }
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
