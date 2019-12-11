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
        
        //getStateInfo(state: state.name)
        getStateInfo2(state: state)
    }
    
//    func getStateInfo(state: String){
//        let baseURL = "https://www.50states.com/"
//        let stateString = state + ".htm"
//        let fullURL = URL(string: baseURL + stateString)!
//
//        let task = URLSession.shared.dataTask(with: fullURL){ (data, response, error) in
//            guard let data = data else {
//                print("no data")
//                return
//            }
//
//            guard let allHTML = String(data: data, encoding: String.Encoding.utf8) else {
//                print("unable to turn HTML into string")
//                return
//            }
//
//            print(allHTML)
//        }
//        task.resume()
//    }
    
//https://www.factmonster.com/us/states/ --use this URL plus state, lowercase state and replace space with "-"
    
    
    func getStateInfo2(state: State){
        let nicknameURL = URL(string: "https://www.factmonster.com/us/states/state-nicknames")!
        //let stateString = state + ".htm"
        //let fullURL = URL(string: baseURL + stateString)!
        
        let task = URLSession.shared.dataTask(with: nicknameURL){ (data, response, error) in
            guard let data = data else {
                print("no data")
                return
            }
            
            guard let allHTML = String(data: data, encoding: String.Encoding.utf8) else {
                print("unable to turn HTML into string")
                return
            }
            
            let allHTML2 = String(allHTML)
            
            //print(state + " " + allHTML)
            
            let leftSide = """
            /us/states/\(state.name.lowercased())">\(state.name)</a></td><td>
            """
            
            guard let nickname = allHTML2.allStringsBetween(start: leftSide, end: "</td>") else {
                print("failed to get left side of html")
                return
            }
            
            print(nickname[0])
            
        }
        task.resume()
    }
        
}

extension String{

func allStringsBetween(start: String, end: String) -> [Any]? {
          var strings = [Any]()
          var startRange: NSRange = (self as NSString).range(of: start)

          while true {
              if startRange.location != NSNotFound {
                  var targetRange = NSRange()
                  targetRange.location = startRange.location + startRange.length
                  targetRange.length = self.count - targetRange.location
                  let endRange: NSRange = (self as NSString).range(of: end, options: [], range: targetRange)
                  if endRange.location != NSNotFound {
                      targetRange.length = endRange.location - targetRange.location
                      strings.append((self as NSString).substring(with: targetRange))
                      var restOfString =  NSRange()
                      restOfString.location = endRange.location + endRange.length
                      restOfString.length = self.count - restOfString.location
                      startRange = (self as NSString).range(of: start, options: [], range: restOfString)
                  }
                  else {
                      break
                  }
              }
              else {
                  break
              }

          }
          return strings
      }

  }
