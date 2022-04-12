//
//  SearchTableViewController.swift
//  ApolloRX2
//
//  Created by Jasmine Makombe on 4/12/22.
//

import UIKit

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var medSearchResults = [[String:Any]]()
    var filteredData = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchQuery = searchBar.searchTextField.text
        filteredData = medSearchResults
        searchBar.delegate = self
        
        let url = URL(string: "https://rxnav.nlm.nih.gov/REST/drugs.json?name=\(searchQuery)")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                 let drugGroup = dataDictionary["drugGroup"] as! [String:Any];
                 let conceptGroup = drugGroup["conceptGroup"] as! [[String:Any]];
                 let conceptGroupSecondElem = conceptGroup[1];
                 let conceptProperties = conceptGroupSecondElem["conceptProperties"] as! [[String:Any]]
                 
                 self.medSearchResults = conceptProperties
                 
                 self.tableView.reloadData()
             }
        }
        task.resume()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.medSearchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "medCell") as! UITableViewCell
        
        let drug = filteredData[indexPath.row] as! [String:Any]
        let drugName = drug["synonym"] as! String
        
        cell.textLabel!.text = drugName
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        var drugName: String
        
        if searchText == ""{
            filteredData = medSearchResults
        }
        else{
            for dict in medSearchResults{
                drugName = dict["synonym"] as! String
                
                if drugName.lowercased().contains(searchText.lowercased()){
                    filteredData.append(drugName)
                }
            }
        }
        self.tableView.reloadData()
    }
}
