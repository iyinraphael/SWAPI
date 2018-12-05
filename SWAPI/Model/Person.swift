//
//  Person.swift
//  SWAPI
//
//  Created by Iyin Raphael on 12/5/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import Foundation

//https://swapi.co/documentation
//Individual entry - Also is non exhaustive
struct Person: Codable {
    let name: String
    let birthYear: String //note: this is different from API
    let height: String
}

/*
 birth_year uses snake case and it's common for the Web
 */
