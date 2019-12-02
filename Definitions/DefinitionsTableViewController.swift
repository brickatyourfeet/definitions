//
//  DefinitionsTableViewController.swift
//  Definitions
//
//  Created by Kyle Braden on 11/20/19.
//  Copyright © 2019 Kyle Braden. All rights reserved.
//

import UIKit

class DefinitionsTableViewController: UITableViewController {
    
    var states = ["Alabama", "Alaska", "Arizona", "Arkansas"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let numberOfRows = 25
        //return numberOfRows
            return states.count
    }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
            cell.textLabel?.text = states[indexPath.row]

        return cell
    }

  }

        
