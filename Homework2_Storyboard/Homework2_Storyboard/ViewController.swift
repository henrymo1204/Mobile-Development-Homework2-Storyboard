//
//  ViewController.swift
//  Homework2_Storyboard
//
//  Created by Henry mo on 11/24/20.
//  Copyright © 2020 Henry mo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var output: UILabel!
    @IBAction func button(_ sender: UIButton) {
        print("add button clicked")
        
        if let t1 = text1.text, t1.isEmpty, let t2 = text2.text, t2.isEmpty {
            output.text = "You did not enter any data"
        }
        else if let t1 = text1.text, t1.isEmpty {
            output.text = "You need to enter claim title"
        }
        else if let t2 = text2.text, t2.isEmpty {
            output.text = "You need to enter date"
        }
        else {
            let t1 = text1.text as String?
            let t2 = text2.text as String?
            let cObj = Claim(title: t1!, date: t2!)
            let c = ClaimService()
            c.addClaim(cObj: cObj, completion: { value in
                if value {
                    self.output.text = "Claim \(t1!) was successfully created"
                    self.text1.text = ""
                    self.text2.text = ""
                }
                else {
                    self.output.text = "Claim \(t1!) failed to be created"
                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

