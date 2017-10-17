//
//  addViewController.swift
//  projectOne
//
//  Created by Ariel Riggan on 10/12/17.
//  Copyright © 2017 Ariel Riggan. All rights reserved.
//

import UIKit

class addViewController: UIViewController, UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet weak var plantName: UITextField!
    
    @IBOutlet weak var notes: UITextView!
    override func viewDidLoad() {
        plantName.delegate=self
        notes.delegate=self
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindAddSegue"{
            let sceneNextController = segue.destination as! ViewController
            if plantName.text!.isEmpty == false{
                sceneNextController.user.plantName=plantName.text
            }
            if notes.text!.isEmpty == false{
                sceneNextController.user.notes=notes.text
            }
            
        }
    }

    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
