//
//  SearchViewController.swift
//  ApolloRX2
//
//  Created by Leah Clements on 3/24/22.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    import UIKit
    class SearchViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
            @IBOutlet weak var tableView: UITableView!
            @IBOutlet weak var searchBar: UISearchBar!
    //
            let data = ["Hydrocodone,acetaminophen", "Simvastatin,Zocor,", "Lisinopril, Qbrelis", "Levothyroxine, Synthroid",
                "Amlodipine Besylate, Norvasc", "Omeprazole, Prilosec OTC", "Azithromycin, AzaSite", "Metformin , Glumetza",
                "Hydrochlorothiazide, Microzide", "Omeprazole", "Warfarin", "Atorvastatin, Lipitor",
                "Albuterol, Ventolin", "Losartan, Cozaar", "Amlodipine, Norvasc", "Amoxicillin, Amoxil",]

            var filteredData: [String]!

            override func viewDidLoad() {
                super.viewDidLoad()
                tableView.dataSource = self
                searchBar.delegate = self
                filteredData = data
            }

            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as UITableViewCell
                cell.textLabel?.text = filteredData[indexPath.row]
                return cell
            }

            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return filteredData.count
            }

            // This method updates filteredData based on the text in the Search Box
            func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
                // When there is no text, filteredData is the same as the original data
                // When user has entered text into the search box
                // Use the filter method to iterate over all items in the data array
                // For each item, return true if the item should be included and false if the
                // item should NOT be included
                filteredData = searchText.isEmpty ? data : data.filter { (item: String) -> Bool in
                    // If dataItem matches the searchText, return true to include it
                    return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
                }
                
                tableView.reloadData()
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
