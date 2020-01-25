//
//  DetailViewController.swift
//  NYCSchools
//
//  Created by Greg Alton on 1/24/20.
//  Copyright © 2020 Greg Alton. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var school: SchoolViewModel? {
        didSet {
            print("got school in Detail View")
        }
    }
    var scores: SATScore?
    
//    init(school: SchoolViewModel, scores: SATScore) {
//        super.init(nibName: nil, bundle: nil)
//        self.school = school
//        self.scores = scores
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
