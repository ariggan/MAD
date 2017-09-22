//
//  ViewController.swift
//  testTest
//
//  Created by Ariel Riggan on 9/19/17.
//  Copyright © 2017 Ariel Riggan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //outlets
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var text2Change: UITextView!
    @IBOutlet weak var picSelectSeg: UISegmentedControl!
    @IBOutlet weak var brightSlider: UISlider!
    @IBOutlet weak var capSwitch: UISwitch!
    @IBOutlet weak var fontSlider: UISlider!
    
    //actions
    @IBAction func brightSlide(_ sender: UISlider) {
            let brightVar = sender.value
            postImage.alpha = CGFloat(brightVar)
    }
    
    @IBAction func changePhoto(_ sender: UISegmentedControl) {
        if picSelectSeg.selectedSegmentIndex == 0{
            postImage.image = UIImage (named: "beach")
        }
        else if picSelectSeg.selectedSegmentIndex == 1{
            postImage.image=UIImage (named: "resort")
        }
        else if picSelectSeg.selectedSegmentIndex == 2{
            postImage.image=UIImage (named: "mountains")
        }
        else{
            postImage.image=UIImage (named:"eiffel")
        }
    }
    
    @IBAction func capsSwitch(_ sender: Any) {
        if capSwitch.isOn {
            text2Change.text = text2Change.text?.uppercased()
        }
        else{
            text2Change.text = text2Change.text?.lowercased()
        }
    }
    
    @IBAction func fontSizeSlide(_ sender: UISlider) {
        let fontSize = sender.value
        let fontSizeCG = CGFloat(fontSize)
        text2Change.font = UIFont.systemFont(ofSize: fontSizeCG)
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

