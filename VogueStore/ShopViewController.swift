//
//  ShopViewController.swift
//  VogueStore
//
//  Created by Macbook on 10/18/16.
//  Copyright © 2016 Raihana A. Souleymane. All rights reserved.
//

import Foundation
import UIKit

class ShopViewController: UITableViewController {
    
    var item : [NSDictionary] = []
    
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.25) { () -> Void in
            self.navigationItem.rightBarButtonItem?.image = UIImage(named:"cart")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            
            self.navigationItem.leftBarButtonItem?.image = UIImage(named:"backButton")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        }
        
        //  Create array of each item
        let sneakers = ["price":"49.95","picture": "4.png","descrip":"Sneakers A","isBigSale":false] as [String : Any]
        let shoesB = ["price":"79.95","picture": "5.png","descrip":"Shoes B","isBigSale":false] as [String : Any]
        let dressA = ["price":"99.00","picture": "10.png","descrip":"Dress A","isBigSale":false] as [String : Any]
        let dressB = ["price":"89.00","picture": "11.png","descrip":"Dress B","isBigSale":false] as [String : Any]
        let Hat = ["price":"39.00","picture": "8.png","descrip":"Featured Item: Magician Hat","isBigSale":true] as [String : Any]
        
        
        /*randomly populate array of all items
         idiealy, data should be get from an API and parsed into a model */
        
        item = [Hat as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,shoesB as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,dressB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary,dressA as NSDictionary,sneakers as NSDictionary,shoesB as NSDictionary]
        //print(item.count)
    }
    
    
    override func viewDidLoad() {
          self.tableView.separatorColor = UIColor.clear
    }
    
    @IBAction func backButtonClicked(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    
// MARK: - Tableview delegate Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
            return (item.count/2 + 1)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 225
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell( withIdentifier: "ShopListcell", for: indexPath) as! ShopListcell
      
       if (item[indexPath.row].object(forKey: "isBigSale")!) as! Bool == true {
        cell.view1.isHidden = false
        cell.view2.isHidden =  true
        cell.v1image2.image = UIImage(named:"9.png")
        cell.v1image1.image = UIImage(named:"\(item[indexPath.row].object(forKey: "picture")!)")
        cell.v1priceLabel.text = "$"+"\(item[indexPath.row].object(forKey: "price")!)"
        cell.viDesLabel.text = "\(item[indexPath.row].object(forKey: "descrip")!)"
        }
        else{
        cell.view2.isHidden = false
        cell.view1.isHidden =  true
        cell.v2image1.image = UIImage(named:"\(item[indexPath.row].object(forKey: "picture")!)")
        cell.v2DesLabel1.text = "\(item[indexPath.row].object(forKey: "descrip")!)"
        cell.v2priceLabel1.text = "$"+"\(item[indexPath.row].object(forKey: "price")!)"
        cell.v2image2.image =  UIImage(named:"\(item[indexPath.row + 1].object(forKey: "picture")!)")
        cell.v2priceLabel2.text = "\(item[indexPath.row + 1].object(forKey: "descrip")!)"
        cell.v2DesLabel2.text = "$"+"\(item[indexPath.row + 1].object(forKey: "price")!)"
        }
        
        return cell
    }
    
}

class ShopListcell: UITableViewCell {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var v1priceLabel: UILabel!
    @IBOutlet weak var viDesLabel: UILabel!
    
    @IBOutlet weak var v1image1: UIImageView!
    @IBOutlet weak var v1image2: UIImageView!
    
    
    @IBOutlet weak var view2 : UIView!
    @IBOutlet weak var v2DesLabel1 : UILabel!
    @IBOutlet weak var v2DesLabel2 : UILabel!
    @IBOutlet weak var v2image1 :UIImageView!
    @IBOutlet weak var v2image2:UIImageView!
    @IBOutlet weak var v2priceLabel1 : UILabel!
    @IBOutlet weak var v2priceLabel2 : UILabel!
    
    
    
}
