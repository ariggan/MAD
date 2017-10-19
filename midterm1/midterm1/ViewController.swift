//
//  ViewController.swift
//  midterm1
//
//  Created by Ariel Riggan on 10/19/17.
//  Copyright © 2017 Ariel Riggan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var roundCommute: UITextField!
    @IBOutlet weak var commuteTimeLabel: UILabel!
    @IBOutlet weak var gasNeededLabel: UILabel!
    @IBOutlet weak var monthlySwitch: UISwitch!
    @IBOutlet weak var inTank: UILabel!
    @IBOutlet weak var inTankSlider: UISlider!

    @IBOutlet weak var segTransport: UISegmentedControl!
    @IBOutlet weak var transportImage: UIImageView!
    var sliderVal = 15.0;
    override func viewDidLoad() {
        roundCommute.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField)->Bool{
        textField.resignFirstResponder()
        return true
    }
    @IBAction func calculateCommuteGas(_ sender: Any) {
        var miles = 0.0
        var commuteTime = 0
        var gasNeeded = 0.0
        var mph = 24.0
        var busWait = false
        
        if roundCommute.text!.isEmpty{
            miles = 0.0
        }
        else{
            miles = Double(roundCommute.text!)!
        }
        
        if (segTransport.selectedSegmentIndex==1){
            transportImage.image = UIImage(named: "bus")
            mph = 12.0
            busWait = true
            
        }
        else if (segTransport.selectedSegmentIndex == 2){
            transportImage.image = UIImage(named: "bike")
            mph = 10.0
        }
        else{
            gasNeeded = miles/mph
            if gasNeeded < sliderVal{
                let myAlert = UIAlertController(title: "Oops!", message: "You do not have enough gas to reach your destination! Please change your destination to one closer.", preferredStyle:UIAlertControllerStyle.alert)
                
                let cancelThis = UIAlertAction(title: "Ignore", style: UIAlertActionStyle.cancel, handler: nil)
                myAlert.addAction(cancelThis)
                let okAction = UIAlertAction(title:"Okay", style: UIAlertActionStyle.default, handler: { action in
                    self.roundCommute.text="0.0"
                    miles=0.0
                    gasNeeded=0.0
                    
                })
                myAlert.addAction(okAction)
                present(myAlert,animated: true, completion: nil)
            }
        }
        
        
        
        commuteTime = Int((miles/20.0)*60)
        if (busWait){
            commuteTime += 10 // 5min wait each way while bussing
        }
        
        
        commuteTimeLabel.text = String(commuteTime) + String(" mins")
        
        gasNeededLabel.text = String(gasNeeded) + String(" gallons")
        
        
        
    }
    
    @IBAction func showMonthly(_ sender: Any) {
        var miles = 0.0
        var commuteTime = 0
        var gasNeeded = 0.0
        if roundCommute.text!.isEmpty{
            miles = 0.0
        }
        else{
            miles = Double(roundCommute.text!)!
        }
        
        gasNeeded = miles/24.0
        commuteTime = Int((miles/20.0)*60)
        
        if monthlySwitch.isOn{
            commuteTime = commuteTime*20
            gasNeeded = gasNeeded*20
        }
        commuteTimeLabel.text = String(commuteTime) + String(" mins")
        
        gasNeededLabel.text = String(gasNeeded) + String(" mins")
        
    }
    @IBAction func changeTankVal(_ sender: UISlider) {
        let gallonsInTank=sender.value
        sliderVal=Double(sender.value)
        inTank.text = String(gallonsInTank) + String(" gallons")
    }
    
    
    


}

