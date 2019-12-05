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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedState = states[indexPath.row]
        performSegue(withIdentifier: "goToStateFacts", sender: selectedState)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let stateVC = segue.destination as! FactsViewController
        let selectedState = sender as! String
        stateVC.state = selectedState
    }

  }

        
