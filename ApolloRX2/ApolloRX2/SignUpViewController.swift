//
//  SignUpViewController.swift
//  ApolloRX2
//
//  Created by Nubia Johnson on 3/23/22.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var createPasswordField: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(image: nil, style: UIBarButtonItem.Style.plain, target: nil, action: nil)


    }
    
    @IBAction func createAccount(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text!
        user.password = createPasswordField.text!
        
        user.signUpInBackground { (success, error) in
            if success{
                self.performSegue(withIdentifier: "quizSegue", sender: nil)
            }else{
                print("Error \(error?.localizedDescription)")
            }
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
