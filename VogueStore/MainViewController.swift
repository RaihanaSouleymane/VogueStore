//
//  MainViewController.swift
//  VogueStore
//
//  Created by Macbook on 10/18/16.
//  Copyright © 2016 Raihana A. Souleymane. All rights reserved.
//

import Foundation
import UIKit


class MainViewController: UIViewController,UIGestureRecognizerDelegate {

    let baseUrl = Webservice.sharedInstance.baseURL
    @IBOutlet weak var loyaltyLabel: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var topConst: NSLayoutConstraint!
    @IBOutlet weak var myView2: UIView!
    @IBOutlet weak var label1V2: UILabel!
    @IBOutlet weak var label2V1: UILabel!

    @IBOutlet weak var label1V1: UILabel!
    @IBOutlet weak var myView1: UIView!
    @IBOutlet weak var swipeableView: UIView!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var myPageController: UIPageControl!
    
    var myImageList:[String] = ["4.png", "5.png","6.png","7.png"]
    let maxImages = 3
    var imageIndex: NSInteger = 0
    var loyaltyPoint :NSNumber = 0
    
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.25) { () -> Void in
         self.navigationController?.navigationBar.barTintColor = UIColor.white
         self.navigationController?.navigationBar.tintColor = UIColor.clear
         
            self.navigationItem.rightBarButtonItem?.image = UIImage(named:"profilePic")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
            
             self.navigationItem.leftBarButtonItem?.image = UIImage(named:"Menu")!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
         }
         self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black]
        
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        
        
        // Api call to get the Loyalty Number
        
        Webservice.sharedInstance.sendData(json: nil, method: "POST", url: baseUrl as NSURL, success: { (json) in
            print(json)
            
            //Show ActivityController
            ActivityIndicator.showActivityIndicator(self.view, text: "")
            
//            //print ("the result", json)
            if let response = json as? AnyObject {
               
                self.loyaltyPoint = (response.object(forKey: "rewardPoints") as? NSNumber)!
               

                 self.loyaltyLabel.text = "\(numberFormatter.string(from: (self.loyaltyPoint))!)" + " pts"
        
            }
                      // hide ActivityController
        ActivityIndicator.hideActivityIndicator(self.view)
            
        }) { (Error) in
            
            //hide ActivityController
        ActivityIndicator.hideActivityIndicator(self.view)
            print(Error)
             self.loyaltyLabel.text = "\(self.loyaltyPoint)" + " pts"
            
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func awakeFromNib() {
        NotificationCenter.default.addObserver(self, selector: Selector(("keyboardWillShow:")), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: Selector(("refresh:")), name: NSNotification.Name(rawValue: "loadMembers"), object: nil)
        
        
//        NotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
//        firstNameTextField.delegate = self
//        lastNameTextField.delegate = self
//        emailTextField.delegate = self
//        firstNameTextField.becomeFirstResponder()
    }
    

    
    
    override func viewDidLoad() {
        
        
        var yourLabel: UILabel = UILabel()
        let label : UILabel?
        label?.frame = CGRect(x: 0, y: 0, width: 200, height: 21)
        
        // you will probably want to set the font (remember to use Dynamic Type!)
        label?.font = UIFont.boldSystemFont(ofSize: 12.0)
        
        // and set the text color too - remember good contrast
        label?.textColor = .black
        
        // may not be necessary (e.g., if the width & height match the superview)
        // if you do need to center, CGPointMake has been deprecated, so use this
        label?.center = self.view.center
        
        // this changed in Swift 3 (much better, no?)
        label?.textAlignment = .center
        
        label.text = "I am a test label"
        
        self.view.addSubview(label!)
        
        
  
        let swipeLeft = UISwipeGestureRecognizer(target: self, action:  #selector(self.swiped))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
         swipeLeft.delegate = self
        self.swipeableView.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action:  #selector(self.swiped))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        swipeRight.delegate = self
        self.swipeableView.addGestureRecognizer(swipeRight)
        
        self.myImageView.image = UIImage(named:"4.png")
        self.myPageController.currentPage = imageIndex
        
        myView1.isHidden = true
        myView2.isHidden = true
           }
    
    
    
    func swiped(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.right :
                print("User swiped right")
                
                // decrease index first
                
                imageIndex -= 1
                
                // check if index is in range
                
                if imageIndex < 0 {
                    
                    imageIndex = maxImages
                    
                }
                
                self.myImageView.image = UIImage(named: myImageList[imageIndex])
                self.myPageController.currentPage = imageIndex
            case UISwipeGestureRecognizerDirection.left:
                print("User swiped Left")
                
                // increase index first
                
                imageIndex += 1
                
                // check if index is in range
                
                if imageIndex > maxImages {
                    
                    imageIndex = 0
                    
                }
                
               self.myImageView.image = UIImage(named: myImageList[imageIndex])
                self.myPageController.currentPage = imageIndex
            default:
                break //stops the code/codes nothing.
                
                
            }
            
            if imageIndex == 2 {
                myView1.isHidden = false
                myView2.isHidden = false
                label1V1.text = "Fashion Show"
                topConst.constant = 10
                label2V1.isHidden = false
                label2V1.text = "December 1st 2015"
                label1V2.text = "Get Tickets  >"
                
            }
            else if imageIndex == 3 {
                    myView1.isHidden = false
                    myView2.isHidden = false
                    label1V1.text = "Personal Shopper"
                topConst.constant = myView1.frame.size.height/2 - label1V1.frame.size.height/2
                   // label1V1.center = myView1.center
                    label2V1.isHidden = true
                    label1V2.text = "Book Now  >"

            }
            else {
                myView1.isHidden = true
                myView2.isHidden = true
            }
            
            
        }
        
        
    }
    
}

