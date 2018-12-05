//
//  PersonSearchResult.swift
//  SWAPI
//
//  Created by Iyin Raphael on 12/5/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

//RULE: Always do a few searches by hand and see what gets sent back before you do your coding
struct PersonSearchResult: Codable {
    
    let results: [Person]
}

//When working with JSON you will need a lot of classes
//https://swapi.co/people/?search=le
