//
//  DetailViewController.swift
//  NYCSchools
//
//  Created by Greg Alton on 1/24/20.
//  Copyright © 2020 Greg Alton. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var mathLabel: UILabel!
    @IBOutlet weak var readingLabel: UILabel!
    @IBOutlet weak var writingLabel: UILabel!
    @IBOutlet weak var summaryView: UITextView!
    
    
    var school: SchoolViewModel?
    var scores: SATScore?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let name = self.school?.name {
            self.schoolLabel?.text = name
        }
        
        if let scores = self.scores {
            if Int(scores.sat_math_avg_score)! > 0 {
                self.mathLabel?.text = "Math: \(scores.sat_math_avg_score)"
            } else {
                self.mathLabel?.text = "N/A"
            }
            
            if Int(scores.sat_critical_reading_avg_score)! > 0 {
                self.readingLabel?.text = "Reading: \(scores.sat_critical_reading_avg_score)"
            } else {
                self.readingLabel?.text = "N/A"
            }
            
            if Int(scores.sat_math_avg_score)! > 0 {
                self.writingLabel?.text = "Writing: \(scores.sat_writing_avg_score)"
            } else {
                self.writingLabel?.text = "N/A"
            }
        }
        
        if let summary = school?.detailTextString {
            self.summaryView?.text = summary
        } else {
            self.summaryView?.text = ""
        }
    }
    
}
