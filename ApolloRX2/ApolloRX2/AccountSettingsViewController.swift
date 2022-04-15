//
//  AccountSettingsViewController.swift
//  ApolloRX2
//
//  Created by Nubia Johnson on 4/14/22.
//

import UIKit
import Parse

class AccountSettingsViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var newPasswordField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func saveSettings(_ sender: UIButton) {
        let account = PFObject(className: "AccountSettings")
        account["user"] = PFUser.current()!
        account["name"] = nameField.text!
        account["number"] = numberField.text!
        account["newPassword"] = newPasswordField.text!
        
        var nameField = nameField.text!
        var newPasswordField = newPasswordField.text!
        var number = numberField.text!
        
        
        account.saveInBackground { success, error in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("saved!")
            } else{
                print("error!")
            }
        }
        
        /*user.pinInBackground(withName: name){ (success, error) in
            if success{
                self.performSegue(withIdentifier: "saveSettings", sender: nil)
            }else{
                print("Error \(error?.localizedDescription)")
            }
        }*/
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
