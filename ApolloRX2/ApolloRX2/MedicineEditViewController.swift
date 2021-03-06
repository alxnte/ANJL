//
//  MedicineEditViewController.swift
//  ApolloRX2
//
//  Created by Nubia Johnson on 4/11/22.
//

import UIKit
import Parse

class MedicinceEditViewController: UIViewController{
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.date = selectedDate
    }
    

    @IBAction func saveAction(_ sender: Any) {
        let newMedicine = Medicine()
        newMedicine.id = medList.count
        newMedicine.name = nameTF.text
        newMedicine.date = datePicker.date
        
        medList.append(newMedicine)
        //navigationController?.popViewController(animated: true)
        
        
        let account = PFObject(className: "AccountSettings")
        account["user"] = PFUser.current()!
        account["medicine"] = nameTF.text!
        
        
        account.saveInBackground { success, error in
            if success{
                self.performSegue(withIdentifier: "saveSegue", sender: nil)
                print("saved!")
            } else{
                print("error!")
            }
        }
    }
    
}
