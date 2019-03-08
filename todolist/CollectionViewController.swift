//
//  CollectionViewController.swift
//  todolist
//
//  Created by 横尾美空 on 2019/02/22.
//  Copyright © 2019年 横尾美空. All rights reserved.
//

import UIKit

private let reuseIdentifier = "collectionViewCell"

class CollectionViewController: UICollectionViewController {
    var saveData : UserDefaults = UserDefaults.standard
    var contentsList : [String]!
    var dayAndPlaceArray : [Dictionary<String,String>] = []
    var selectedInfo : Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        if saveData.array(forKey: "DAYANDPLACE") != nil{
            dayAndPlaceArray = saveData.array(forKey: "DAYANDPLACE") as! [Dictionary<String, String>]
            //if dayAndPlaceArray[selectedInfo ]
        
            if dayAndPlaceArray[selectedInfo]["CONTENTS2"] == "" {
                contentsList = [dayAndPlaceArray[selectedInfo]["CONTENTS"]] as? [String]
            }
            else if dayAndPlaceArray[selectedInfo]["CONTENTS3"] == "" {
                contentsList = [dayAndPlaceArray[selectedInfo]["CONTENTS"],dayAndPlaceArray[selectedInfo]["CONTENTS2"]] as? [String]
            }
            else if dayAndPlaceArray[selectedInfo]["CONTENTS4"] == "" {
                contentsList = [dayAndPlaceArray[selectedInfo]["CONTENTS"],dayAndPlaceArray[selectedInfo]["CONTENTS2"],dayAndPlaceArray[selectedInfo]["CONTENTS3"]] as? [String]
            }
            else if dayAndPlaceArray[selectedInfo]["CONTENTS5"] == "" {
                contentsList = [dayAndPlaceArray[selectedInfo]["CONTENTS"],dayAndPlaceArray[selectedInfo]["CONTENTS2"],dayAndPlaceArray[selectedInfo]["CONTENTS3"],dayAndPlaceArray[selectedInfo]["CONTENTS4"]] as? [String]
            }
            else{
                contentsList = [dayAndPlaceArray[selectedInfo]["CONTENTS"],dayAndPlaceArray[selectedInfo]["CONTENTS2"],dayAndPlaceArray[selectedInfo]["CONTENTS3"],dayAndPlaceArray[selectedInfo]["CONTENTS4"],dayAndPlaceArray[selectedInfo]["CONTENTS5"]] as? [String]
            }
            
        }
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return contentsList.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as!CollectionViewCell
    
        // Configure the cell
    
        return cell
    }
    
    override func prepare (for segue:UIStoryboardSegue,sender : Any!){
        if (segue.identifier == "toAddView"){
            let  destinationVC: addViewController = (segue.destination as? addViewController)!
            destinationVC.selectedInfo = selectedInfo
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
