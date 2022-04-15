//
//  AccountViewController.swift
//  ApolloRX2
//
//  Created by Nubia Johnson on 4/14/22.
//

import UIKit
import Parse

class AccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        PFUser.logOut()
        performSegue(withIdentifier: "logoutSegue", sender: (nil))
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
