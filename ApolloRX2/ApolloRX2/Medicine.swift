//
//  Medicine.swift
//  ApolloRX2
//
//  Created by Nubia Johnson on 4/11/22.
//

import Foundation

var medList = [Medicine]()

class Medicine{
    var id: Int!
    var name: String!
    var date: Date!
    
    func medicineForDate(date: Date) -> [Medicine]{
        var daysMedicine = [Medicine]()
        for medicine in medList{
            if(medicine.date == date){
                daysMedicine.append(medicine)
            }
            
        }
        return daysMedicine
    }
}
