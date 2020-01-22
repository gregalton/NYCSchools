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
    let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    fileprivate func getData() {
        
        // TODO: Add call for scores in a DispatchGroup
        NetworkService.shared.getSchools { [weak self] (schools, err) in
            
            if let err = err {
                print("Failed to fetch schools:", err)
                return
            }
            
            self?.schoolViewModels = schools?.map({return SchoolViewModel(school: $0)}) ?? []
            
        }
    }


}

