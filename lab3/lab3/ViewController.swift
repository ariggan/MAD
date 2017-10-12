//
//  ViewController.swift
//  lab3
//
//  Created by Ariel Riggan on 9/26/17.
//  Copyright © 2017 Ariel Riggan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var xPos : CGFloat = 0
    var yPos : CGFloat = 0
    
    
    @IBOutlet weak var GPAFetch: UIButton!
    @IBOutlet weak var mainStackHeight: NSLayoutConstraint!
    
    @IBOutlet weak var gradeTemplate: UITextField!
    @IBOutlet weak var classNameTemplate: UITextField!
    @IBOutlet weak var grade2: UITextField!
    @IBOutlet weak var grade3: UITextField!
    @IBOutlet weak var grade4: UITextField!
    @IBOutlet weak var grade5: UITextField!
    @IBOutlet weak var printZone: UITextView!
    
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var addClass: UIButton!
    
    var classHeight: CGFloat=0
//    classHeight += classNameTemplate.frame.height
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        gradeTemplate.delegate=self
        grade2.delegate=self
        grade3.delegate=self
        grade4.delegate=self
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField)->Bool{
        textField.resignFirstResponder()
        return true
    }
    
    func getAvgGPA()->Float{
        var grade1Amt: Float
        var grade2Amt: Float
        var grade3Amt: Float
        var grade4Amt: Float
        var grade5Amt: Float
        var gradeSum: Float
        var isNotANum: Bool = false
        var gradeCount: Float = 0.0
        
        gradeSum=0
        if gradeTemplate.text!.isEmpty || Float(gradeTemplate.text!) == nil{
            grade1Amt=0.0
            isNotANum = true;
            //do not add to class count
        }
        else{
            grade1Amt=Float(gradeTemplate.text!)!
            grade1Amt=getSoloGPA(soloGrade: grade1Amt)
            gradeCount=gradeCount+1
        }
        
        
        if grade2.text!.isEmpty || Float(grade2.text!) == nil{
            grade2Amt=0.0
            isNotANum = true;
            //do not add to class count
        }
        else{
            grade2Amt=Float(grade2.text!)!
            grade2Amt=getSoloGPA(soloGrade: grade2Amt)
            gradeCount=gradeCount+1
        }
        
        
        if grade3.text!.isEmpty || Float(grade3.text!) == nil{
            grade3Amt=0.0
            isNotANum = true;
            //do not add to class count
        }
        else{
            grade3Amt=Float(grade3.text!)!
            grade3Amt=getSoloGPA(soloGrade: grade3Amt)
            gradeCount=gradeCount+1
        }
        
        
        if grade4.text!.isEmpty || Float(grade4.text!) == nil{
            grade4Amt=0.0
            isNotANum = true;
            //do not add to class count
        }
        else{
            grade4Amt=Float(grade4.text!)!
            grade4Amt=getSoloGPA(soloGrade: grade4Amt)
            gradeCount=gradeCount+1
        }
        
        if grade5.text!.isEmpty || Float(grade5.text!) == nil{
            grade5Amt=0.0
            isNotANum = true;
            //do not add to class count
        }
        else{
            grade5Amt=Float(grade5.text!)!
            grade5Amt=getSoloGPA(soloGrade: grade5Amt)
            gradeCount=gradeCount+1
        }
        
        if isNotANum == true{
            let alert=UIAlertController(title: "Warning", message: "We noticed one of your grade entries is not a number would you like to disregard that entry and continue?", preferredStyle: UIAlertControllerStyle.alert)
            //create a UIAlertAction object for the button
            let cancelAction=UIAlertAction(title: "Cancel and Fix", style:UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(cancelAction) //adds the alert action to the alert object
            let continueAction=UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: {action in
                gradeSum=(grade1Amt+grade2Amt+grade3Amt+grade4Amt+grade5Amt)
                print ("gradeSum is: "+String(gradeSum))
                self.printZone.text="GPA: "
                self.printZone.text=self.printZone.text+String(gradeSum/gradeCount)
            })
            alert.addAction(continueAction)
            present(alert, animated: true, completion: nil)
        }
        print ("updated sum:"+String(gradeSum))
        return 0.0
        
    }
    
    func getSoloGPA(soloGrade: Float)->Float{
        var letterGradeDeterminer = (soloGrade/10).rounded(.towardZero)
        
        var determinetheExtra=(soloGrade.truncatingRemainder(dividingBy: 10))
        if determinetheExtra<3{
            letterGradeDeterminer=letterGradeDeterminer-0.25
        }
        else if((determinetheExtra>=8) && (letterGradeDeterminer != 9.0)){
            letterGradeDeterminer=letterGradeDeterminer+0.25
        }
        
        if letterGradeDeterminer<6{
            return 0.0
        }
        else if letterGradeDeterminer==100{
            return 4.0
        }
        else{
            letterGradeDeterminer=letterGradeDeterminer-5
            determinetheExtra=((determinetheExtra*10)).rounded(.towardZero)
            return letterGradeDeterminer
        }
    }
    
    @IBAction func updateGPA(_ sender: Any) {
        let output = getAvgGPA()
        printZone.text="GPA: "
        printZone.text=printZone.text+String(output)
    }
    
    
    @IBAction func addingClass(_ sender: Any) {
//        //Set ypos to below last text field
//        yPos += classNameTemplate.frame.height
//        
//        //change mainStackHeight to accomodate new text field & push down get gpa button
//        mainStackHeight.constant+=classNameTemplate.frame.height
//        
//        //new course name text field
//        let tf = UITextField()
//        tf.frame = CGRect(x:xPos,y:yPos,width: classNameTemplate.frame.width,height: classNameTemplate.frame.height)
//        tf.layer.borderWidth = 1
//        tf.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
//        mainStack.addSubview(tf);
//        
//        //new grade text field
//        xPos+=classNameTemplate.frame.width+20
//        let newClass = UITextField()
//        newClass.frame = CGRect(x:xPos,y:yPos,width: gradeTemplate.frame.width,height: gradeTemplate.frame.height)
//        newClass.layer.borderWidth = 1
//        newClass.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
//        mainStack.addSubview(newClass)
//        
//        //reset xPos so that the next course name textfield is aligned on left
//        xPos=0
    }

}

