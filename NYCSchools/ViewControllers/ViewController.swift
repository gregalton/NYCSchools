//
//  ViewController.swift
//  NYCSchools
//
//  Created by Greg Alton on 1/21/20.
//  Copyright © 2020 Greg Alton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var schoolViewModels = [SchoolViewModel]()
    var satScoreDictionary = [String:SATScore]()
    let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
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
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var totalSATScore = 0
        let dbn = schoolViewModels[indexPath.row].id
        let schoolName = schoolViewModels[indexPath.row].name
        if let scores = satScoreDictionary[dbn],
            let reading = Int(scores.sat_critical_reading_avg_score),
        let writing = Int(scores.sat_writing_avg_score),
        let arithmatic = Int(scores.sat_math_avg_score) {
            totalSATScore = reading + writing + arithmatic
        } else {
            totalSATScore = 0
        }
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        cell.accessoryType = .detailDisclosureButton
        cell.textLabel?.text = schoolName
        if(totalSATScore > 0) {
            cell.detailTextLabel?.text = "Avg SAT Score: \(totalSATScore)"
        }
        return cell
    }


}

