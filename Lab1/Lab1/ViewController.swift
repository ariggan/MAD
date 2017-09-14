//
//  ViewController.swift
//  Lab1
//
//  Created by Ariel Elizabeth Riggan on 9/13/17.
//  Copyright © 2017 Ariel Elizabeth Riggan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainGhost1: UIImageView!
    @IBOutlet weak var mainGhost2: UIImageView!
    
    @IBOutlet weak var changeText: UILabel!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    @IBAction func correct(_ sender: UIButton) {
        if sender.tag == 1{
            changeText.text = "How'd you know?"
        }
        else if sender.tag == 2{
            changeText.text = "Wrong! Boo!"
        }
        else{
            print("error")
        }
        mainGhost1.alpha = 1
        mainGhost1.rightAnchor
        mainGhost2.alpha = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

