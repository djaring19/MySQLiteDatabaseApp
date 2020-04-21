//
//  HomeViewController.swift
//  MySQLiteDatabaseApp
//
//  Created by Don Riz Jaring on 4/21/20.
//  Copyright © 2020 DJ Initiatives. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var lblTable : UILabel!
    @IBOutlet var lblPicker : UILabel!
    
    @IBOutlet var tfName : UITextField!
    @IBOutlet var tfEmail : UITextField!
    @IBOutlet var tfFood : UITextField!
    
    @IBAction func addPerson(sender: Any) {
        let person : Data = Data.init()
        person.initWithData(theRow: 0, theName: tfName.text!, theEmail: tfEmail.text!, theFood: tfFood.text!)
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let returnCode = mainDelegate.insertIntoDatabase(person: person)
        
        var returnMSG : String = "Person Added"
        
        if returnCode == false {
            returnMSG = "Person add failed"
        }
        
        let alertController = UIAlertController(title: "SQLite add", message: returnMSG, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch = touches.first!
        let touchPoint : CGPoint = touch.location(in: self.view!)
        
        let tableFrame : CGRect = lblTable.frame
        let pickerFrame : CGRect = lblPicker.frame
        
        if tableFrame.contains(touchPoint) {
            rememberEnteredData()
            performSegue(withIdentifier: "HomeSegueToTable", sender: self)
            
        }
        
        if pickerFrame.contains(touchPoint) {
            rememberEnteredData()
            performSegue(withIdentifier: "HomeSegueToPicker", sender: self)
        }
    }
    
    func rememberEnteredData() {
        let defaults = UserDefaults.standard
        defaults.set(tfName.text, forKey: "lastName")
        defaults.set(tfEmail.text, forKey: "lastEmail")
        defaults.set(tfFood.text, forKey: "lastFood")
        defaults.synchronize()
    }
    
    @IBAction func unwindToHomeViewController(sender: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        
        if let name = defaults.object(forKey: "lastName") as? String {
            tfName.text = name
        }
        if let email = defaults.object(forKey: "lastEmail") as? String {
            tfEmail.text = email
        }
        if let food = defaults.object(forKey: "lastFood") as? String {
            tfFood.text = food
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
