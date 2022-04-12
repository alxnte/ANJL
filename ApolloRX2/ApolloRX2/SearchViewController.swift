//
//  SearchViewController.swift
//  ApolloRX2
//
//  Created by Jasmine Makombe on 4/10/22.
//

import UIKit

class SearchViewController: UIViewController{

    @IBOutlet weak var searchTableView: UITableView!
    
    var medSearchResultsArrayDict = [[String:Any]]()
    
    var medSearchResults = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //searchTableView.dataSource = self
        //searchTableView.delegate = self
        // Do any additional setup after loading the view.
        let url = URL(string: "https://rxnav.nlm.nih.gov/REST/drugs.json?name=Lipitor")!
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
                 let conceptProperties = conceptGroup[1]
                 
                 //let conceptGroup = drugGroup["conceptGroup"] as! [String:Any];
                    
                 //self.medSearchResultsArrayDict = dataDictionary["conceptGroup"] as! [[String:Any]]
                 //var arrayConceptPropertiesArrayDict = self.medSearchResultsArrayDict[1]
                 
                 //self.medSearchResults = arrayConceptPropertiesArrayDict
                 
                 //self.searchTableView.reloadData()
                 
                 print(conceptProperties)

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()
    }
    
    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let drug = medSearchResults[indexPath.row]
        let drugName = drug["conceptProperties"] as! String
        cell.textLabel!.text = "row:\(indexPath.row)"
        
        return cell
    }
    */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
