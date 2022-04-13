//
//  SearchViewController.swift
//  ApolloRX2
//
//  Created by Jasmine Makombe on 4/10/22.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var searchTextField: UITextField!
    //var search:String = ""
    @IBOutlet weak var searchTableView: UITableView!
    
    //var medSearchData = [[String:Any]]()
    var medSearchResults = [[String:Any]]();
    var searchString = "https://rxnav.nlm.nih.gov/REST/drugs.json?name="


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchTableView.dataSource = self
        searchTableView.delegate = self
        
        //medSearchResults = medSearchData
        // Do any additional setup after loading the view.
        //let searchName = drugSearchBar.text
        //let userInput = searchTextField.text
        let url = URL(string: searchString)
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
                 self.searchTableView.reloadData()
                 print(self.medSearchResults)
             }

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
        }
        task.resume()
    }
    
    
    /*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        
        if string.isEmpty{
            search = String(search.dropLast())
        }
        else{
            search = textField.text!+string
        }
        
        print(search)
        
        let predicate = NSPredicate(format: "SELF.name CONTAINS[cd] %@", search)
        let arr = (medSearchData as NSArray).filtered(using: predicate)
        
        if arr.count > 0{
            
            medSearchResults.removeAll(removeAll(keepingCapacity: true))
        }
    }
 */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medSearchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medNameCell")
        
        let searchField = searchTextField.text!
        searchString = searchString + searchField
        
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
