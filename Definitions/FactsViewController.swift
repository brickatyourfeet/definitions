//
//  FactsViewController.swift
//  Definitions
//
//  Created by Kyle Braden on 12/3/19.
//  Copyright © 2019 Kyle Braden. All rights reserved.
//

import UIKit

class FactsViewController: UIViewController {

    @IBOutlet weak var factsLabel: UILabel!
    var state = State()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = state.name
        
        factsLabel.text = state.facts
        
    }
        

}
