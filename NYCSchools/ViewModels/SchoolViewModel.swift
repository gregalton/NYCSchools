//
//  SchoolViewModel.swift
//  NYCSchools
//
//  Created by Greg Alton on 1/21/20.
//  Copyright © 2020 Greg Alton. All rights reserved.
//

import Foundation
import UIKit

struct SchoolViewModel {
    
    let id: String
    let name: String
    let detailTextString: String
    let accessoryType: UITableViewCell.AccessoryType
    
    
    init(school: School) {
        
        self.id = school.dbn
        self.name = school.school_name
        self.detailTextString = school.overview_paragraph
        self.accessoryType = .detailDisclosureButton
        
    }
    
}
