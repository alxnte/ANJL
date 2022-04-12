//
//  MedicineEditViewController.swift
//  ApolloRX2
//
//  Created by Nubia Johnson on 4/11/22.
//

import UIKit

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
        navigationController?.popViewController(animated: true)
        //performSegue(withIdentifier: "saveSegue", sender: (Any).self)
    }
    
}
