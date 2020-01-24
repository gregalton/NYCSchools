//
//  ViewController.swift
//  NYCSchools
//
//  Created by Greg Alton on 1/21/20.
//  Copyright © 2020 Greg Alton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var schoolViewModels = [SchoolViewModel]()
    var scores = [SATScore]()
    var satScoreDictionary = [String:SATScore]()
    let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    fileprivate func getData() {
        
        //TODO: Add call for scores in a DispatchGroup
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        NetworkService.shared.getSchools { [weak self] (schools, err) in

            if let err = err {
                print("Failed to get schools:", err)
                return
            }

            self?.schoolViewModels = schools?.map({return SchoolViewModel(school: $0)}) ?? []
            print("schoolViewModels: ", self?.schoolViewModels ?? [])
            dispatchGroup.leave()
            print("finished 1")
        }
        
        dispatchGroup.enter()
        NetworkService.shared.getSATScores { [weak self] (satScoreDictionary, err) in
            
            if let err = err {
                print("failed to get scores", err)
                return
            }
            
            //self?.scores = scores ?? []
            self?.satScoreDictionary = satScoreDictionary ?? [:]
            dispatchGroup.leave()
            print("satScoreDictionary: ", self?.satScoreDictionary ?? [:])
            print("finished 2")
        }
        
        dispatchGroup.notify(queue: DispatchQueue.global()) {
            print("Both queries have completed")
            //reload table
        }
    }


}

