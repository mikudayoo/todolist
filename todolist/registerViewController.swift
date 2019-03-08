//
//  registerViewController.swift
//  todolist
//
//  Created by 横尾美空 on 2019/02/08.
//  Copyright © 2019年 横尾美空. All rights reserved.
//

import UIKit

class registerViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var dayTextField : UITextField!
    @IBOutlet var placeTextField : UITextField!
    @IBOutlet var  contentsTextField : UITextField!
    @IBOutlet var  contentsTextField2 : UITextField!
    @IBOutlet var  contentsTextField3 : UITextField!
    @IBOutlet var  contentsTextField4 : UITextField!
    @IBOutlet var  contentsTextField5 : UITextField!
    @IBOutlet var plusButton1 : UIButton!
    @IBOutlet var plusButton2 : UIButton!
    @IBOutlet var plusButton3 : UIButton!
    @IBOutlet var plusButton4 : UIButton!
    @IBOutlet var batsuButton2 : UIButton!
    @IBOutlet var batsuButton3 : UIButton!
    @IBOutlet var batsuButton4 : UIButton!
    @IBOutlet var batsuButton5 : UIButton!
    
    var saveData : UserDefaults = UserDefaults.standard
    var dayAndPlaceArray : [Dictionary<String,String>] = []
    var datePicker : UIDatePicker = UIDatePicker()
//    var selectedInfo : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dayTextField.delegate = self
        self.placeTextField.delegate = self
        self.contentsTextField.delegate = self
        self.contentsTextField2.delegate = self
        self.contentsTextField3.delegate = self
        self.contentsTextField4.delegate = self
        self.contentsTextField5.delegate = self
        
        contentsTextField2.isHidden = true
        contentsTextField3.isHidden = true
        contentsTextField4.isHidden = true
        contentsTextField5.isHidden = true
        plusButton1.isHidden = false
        plusButton2.isHidden = true
        plusButton3.isHidden = true
        plusButton4.isHidden = true
        batsuButton2.isHidden = true
        batsuButton3.isHidden = true
        batsuButton4.isHidden = true
        batsuButton5.isHidden = true
        
        
        
        // Do any additional setup after loading the view.
        if saveData.array(forKey: "DAYANDPLACE") != nil{
            dayAndPlaceArray = saveData.array(forKey: "DAYANDPLACE") as! [Dictionary<String, String>]
            print(dayAndPlaceArray)
      }
        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        dayTextField.inputView = datePicker

        let toolbar = UIToolbar(frame: CGRect(x:0,y:0,width:view.frame.size.width,height:35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem,doneItem],animated:true)
        dayTextField.inputView = datePicker
        dayTextField.inputAccessoryView = toolbar
        
    }
    override  func  viewWillAppear(_ animated:Bool){
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        // 選択されているTextFieldを更新
//        self.placeTextField = textField
//        self.dayTextField = textField
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedInfo = indexPath.row as Int
//        if selectedInfo != nil {
//            // SubViewController へ遷移するために Segue を呼び出す
//            performSegue(withIdentifier: "toSecondView",sender: nil)
//        }
//    }
    
    @IBAction func add(){
        let dayAndPlaceDictionary = ["DAY":dayTextField.text!,
                                     "PLACE":placeTextField.text!,
                                     "CONTENTS":contentsTextField.text!,
                                     "CONTENTS2":contentsTextField2.text!,
                                     "CONTENTS3":contentsTextField3.text!,
                                     "CONTENTS4":contentsTextField4.text!,
                                     "CONTENTS5":contentsTextField5.text!
                                     ]
        dayAndPlaceArray.append(dayAndPlaceDictionary)
        saveData.set(dayAndPlaceArray,forKey:"DAYANDPLACE")
        dayTextField.text = ""
        placeTextField.text = ""
        contentsTextField.text = ""
        contentsTextField2.text = ""
        contentsTextField3.text = ""
        contentsTextField4.text = ""
        contentsTextField5.text = ""
       print(dayAndPlaceDictionary)
    }
    
    @objc func done() {
        dayTextField.endEditing(true)
        
        // 日付のフォーマット
        let formatter = DateFormatter()
        
        //"yyyy年MM月dd日"を"yyyy/MM/dd"したりして出力の仕方を好きに変更できるよ
        formatter.dateFormat = "yyyy.MM.dd"
        
        //(from: datePicker.date))を指定してあげることで
        //datePickerで指定した日付が表示される
        dayTextField.text = "\(formatter.string(from: datePicker.date))"
        
        
        
    }
    @IBAction func plus1(){
        contentsTextField2.isHidden = false
        plusButton2.isHidden = false
        batsuButton2.isHidden = false
        plusButton1.isHidden = true
    }
    @IBAction func plus2(){
        contentsTextField3.isHidden = false
        plusButton3.isHidden = false
        plusButton2.isHidden = true
        batsuButton3.isHidden = false
        batsuButton2.isHidden = true
    }
    @IBAction func plus3(){
        contentsTextField4.isHidden = false
        plusButton4.isHidden = false
        plusButton3.isHidden = true
        batsuButton4.isHidden = false
        batsuButton3.isHidden = true
    }
    @IBAction func plus4(){
        contentsTextField5.isHidden = false
        batsuButton5.isHidden = false
        plusButton4.isHidden = true
        batsuButton4.isHidden = true
    }
    
    @IBAction func batsu2(){
        contentsTextField2.isHidden = true
        plusButton1.isHidden = false
        plusButton2.isHidden = true
        batsuButton2.isHidden = true
    }
    @IBAction func batsu3(){
        contentsTextField3.isHidden = true
        plusButton2.isHidden = false
        plusButton3.isHidden = true
        batsuButton3.isHidden = true
        batsuButton2.isHidden = false
    }
    @IBAction func batsu4(){
        contentsTextField4.isHidden = true
        plusButton3.isHidden = false
        plusButton4.isHidden = true
        batsuButton4.isHidden = true
        batsuButton3.isHidden = false
    }
    @IBAction func batsu5(){
        contentsTextField5.isHidden = true
        plusButton4.isHidden = false
        batsuButton5.isHidden = true
        batsuButton4.isHidden = false
    }
    
    @IBAction func back (){
        self.dismiss(animated: true, completion: nil)
    }
    
//    override func prepare (for segue:UIStoryboardSegue,sender : Any!){
//        if (segue.identifier == "toSecondView"){
//            let  destinationVC: secondViewController = (segue.destination as? secondViewController)!
//            destinationVC.selectedInfo = selectedInfo
//        }
//    }
//    
   
    
    
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


