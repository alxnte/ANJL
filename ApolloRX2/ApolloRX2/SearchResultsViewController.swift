//
//  SearchResultsViewController.swift
//  ApolloRX2
//
//  Created by Jasmine Makombe on 4/13/22.
//

import UIKit

class SearchResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchResultsTableView: UITableView!
    //let field = SearchViewController.searchTextField.text
    var medSearchResults = [[String:Any]]();
    var delegate: SearchViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchResultsTableView.dataSource = self
        searchResultsTableView.delegate = self
        
        let searchField = delegate!.searchTextField.text as! String
        
        let url = URL(string: "https://rxnav.nlm.nih.gov/REST/drugs.json?name=\(searchField)")
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                 let drugGroup = dataDictionary["drugGroup"] as! [String:Any];
                 let conceptGroup = drugGroup["conceptGroup"] as! [[String:Any]];
                 //var conceptProperties = [Any]()
                 
                 for dict in conceptGroup{
                     let keyExists = dict["conceptProperties"] != nil
                     if keyExists{
                         self.medSearchResults = dict["conceptProperties"] as! [[String:Any]]
                         break
                     }
                 }
                 self.searchResultsTableView.reloadData()
             }

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
        }
        task.resume()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medSearchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drugNameCell")
        
        let drug = medSearchResults[indexPath.row]
        let drugName = drug["synonym"] as! String
        
        cell?.textLabel!.text = drugName
        
        return cell!
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
