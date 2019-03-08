//
//  ViewController.swift
//  todolist
//
//  Created by 横尾美空 on 2019/02/08.
//  Copyright © 2019年 横尾美空. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var table : UITableView!
    var dayandplaceArray : [Dictionary<String,String>] = []
    var saveData : UserDefaults = UserDefaults.standard
    var selectedInfo : Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "firstTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if saveData.array(forKey: "DAYANDPLACE") != nil{
            dayandplaceArray = saveData.array(forKey: "DAYANDPLACE") as! [Dictionary<String, String>]
        }
        table.reloadData()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dayandplaceArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedInfo = indexPath.row as Int
        if selectedInfo != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegue(withIdentifier: "toCollectionView",sender: nil)
        }
    }
    
     func tableView(_ tableView : UITableView, cellForRowAt indexpath:IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexpath) as! firstTableViewCell
        let nowIndexPathDictionary = dayandplaceArray[indexpath.row]
        cell.dayLabel.text = nowIndexPathDictionary["DAY"]
        cell.placeLabel.text = nowIndexPathDictionary["PLACE"]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dayandplaceArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveData.set(dayandplaceArray,forKey:"DAYANDPLACE")
        }
    }
    override func prepare (for segue:UIStoryboardSegue,sender : Any!){
        if segue.identifier == "toCollectionView"{
            let  destinationVC = segue.destination as! CollectionViewController
            destinationVC.selectedInfo = self.selectedInfo
        }
    }
    @IBAction func back (){
        self.dismiss(animated: true, completion: nil)
    }
    

    
}

