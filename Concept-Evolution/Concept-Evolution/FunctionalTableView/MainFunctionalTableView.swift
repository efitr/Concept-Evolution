//
//  MainFunctionalTableView.swift
//  Concept-Evolution
//
//  Created by Egon Fiedler on 3/2/18.
//  Copyright © 2018 App Solutions. All rights reserved.
//

import Foundation
import UIKit

//Second create a TableCellCallBack that have two parameters, UITableView and IndexPath that is a UITableViewCell
typealias TableCellCallBack = (UITableView, IndexPath) -> UITableViewCell

//First create the class, it needs to get an item, it should inherit from two classes, NSObject and UITableViewDataSource
class FunctionalTableView<Item>: NSObject, UITableViewDataSource{

    
    
    //Third the elements the tableView will hold, an array of those
    var items: [Item]
    
    //Fourth a variable to hold the structure that will be called back
    
    var configureCell = TableCellCallBack()
    
    //Fifth initialize the the structure with the element that will be called back
    init(items: [Item]) {
        self.items = items
    }

    /////////////////////////////////////////////////////////////////////////////////////////////////
    //
    //TableViewElements NumberOfSections, numberOfRowsInSection (how many tableCells there are) and cellForRowAt (safe guarded configure cell, and return that with the parameters of the TableCellCallBack
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let configureCell = configureCell else {
            precondition(false, "You did not pass a configuration closure")
        }
        return configureCell(tableView, indexPath)
    }
}
