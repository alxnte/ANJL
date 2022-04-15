//
//  SearchViewController.swift
//  ApolloRX2
//
//  Created by Jasmine Makombe on 4/10/22.
//

import UIKit
import SafariServices

class SearchViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onSearchButton(_ sender: Any) {
        if let url = URL(string:"https://www.webmd.com/drugs/2/index"){
            let safariVC = SFSafariViewController(url: url)
            
            present(safariVC, animated: true, completion: nil)
        }
    }
}

