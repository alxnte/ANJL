//
//  ResultsViewController.swift
//  ApolloRX2
//
//  Created by Nubia Johnson on 3/23/22.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblResults: UILabel!
    
    var noCorrect = 0
        var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         lblResults.text = "You got \(noCorrect) out of \(total) correct"
         
         var percentRight = Double(noCorrect) / Double(total)
         percentRight *= 100
         

         var title = ""
         if(percentRight <= 50) {
             title = "You need some work on your medical literacy"
         } else if(percentRight >= 60) {
             title = "Good Job!"
         }
         lblTitle.text = title
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
