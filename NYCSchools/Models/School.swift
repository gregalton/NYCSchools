//
//  School.swift
//  NYCSchools
//
//  Created by Greg Alton on 1/21/20.
//  Copyright © 2020 Greg Alton. All rights reserved.
//

import Foundation

struct School: Decodable {
    let dbn: String
    let school_name: String
    let boro: String
    let overview_paragraph: String
}
