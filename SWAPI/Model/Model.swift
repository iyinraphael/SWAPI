//
//  Model.swift
//  SWAPI
//
//  Created by Iyin Raphael on 12/5/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

class Model {
    //Singleton
    static let shared = Model()
    private init() {}
    
    typealias UpdateHandler = () -> Void
    var updateHandler: UpdateHandler? = nil
    var people: [Person] = [] {
        didSet{
            DispatchQueue.main.async {
                self.updateHandler?()
            }
        }
    }
    
    //This is Called "Encapsulation"
    //Hiding implementation details, which can change and presenting only the API that is relevant to our consumers. This is simply programming practices.
    //Controlling and limiting my public API
    //"A small API surface area
    
    // Tripple-slach comment provide API documentatio in-line that can be used within your program and by clients via libraries/framework
    
    
    /// Returns the number of people that is currently stored in the model
    func numberOfpeople() -> Int {
        return people.count
    }
    
    func person(at index: Int) -> Person {
        return people[index]
    }
    
    func search(for string: String) {
        SWAPI.searchForPeople(with: string) { (people, error) in
            if let error = error {
                NSLog("Error fetching people \(error)")
                return
            }
            self.people = people ?? []
        }
    }
}
