//
//  DefinitionsTableViewController.swift
//  Definitions
//
//  Created by Kyle Braden on 11/20/19.
//  Copyright © 2019 Kyle Braden. All rights reserved.
//

import UIKit

class DefinitionsTableViewController: UITableViewController {
    
    //var states = ["Alabama", "Alaska", "Arizona", "Arkansas"]
    
    var states: [State] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alabama = State()
        alabama.name = "Alabama"
        alabama.facts = "some facts about Alabama"
        states.append(alabama)
        
        let alaska = State()
        alaska.name = "Alaska"
        alaska.facts = "some facts about alaska"
        states.append(alaska)
        
    }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //let numberOfRows = 50
        //return numberOfRows
            return states.count
    }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
            cell.textLabel?.text = states[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedState = states[indexPath.row]
        performSegue(withIdentifier: "goToStateFacts", sender: selectedState)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let stateVC = segue.destination as? FactsViewController{
            if let selectedState = sender as? State {
                stateVC.state = selectedState
            }

        }
        
    }

  }

        
