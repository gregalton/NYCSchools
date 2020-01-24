//
//  NetworkService.swift
//  NYCSchools
//
//  Created by Greg Alton on 1/21/20.
//  Copyright © 2020 Greg Alton. All rights reserved.
//

import Foundation

class NetworkService: NSObject {
    static let shared = NetworkService()
    
    func getSchools(completion: @escaping ([School]?, Error?) -> ()) {
        
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                completion(nil, err)
                print("Failed to get schools:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            
            do {
                let schools = try JSONDecoder().decode([School].self, from: data)
                DispatchQueue.main.async {
                    completion(schools, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }.resume()
        
    }
    
    //https://data.cityofnewyork.us/resource/f9bf-2cp4.json
    
    func getSATScores(completion: @escaping ([String:SATScore]?, Error?) -> ()) {
        
        let urlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to get scores:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            
            //TODO: Convert to dictionary for faster search on index. Will use a combined score label in each SchoolCell.
            do {
                let scores = try JSONDecoder().decode([SATScore].self, from: data)

                var satScoreDictionary =  [String:SATScore]()

                for score in scores {
                    satScoreDictionary[score.dbn] = score
                }
                
                DispatchQueue.main.async {
                    completion(satScoreDictionary, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
        }.resume()
        
    }
}
