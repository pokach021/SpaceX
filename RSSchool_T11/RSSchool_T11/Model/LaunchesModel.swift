//
//  LaunchesModel.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/16/21.
//

import Foundation

struct LaunchesModel: Codable {
    let name: String 
    let date_utc: String
    let links: Links
    let flight_number: Int
    let details: String?
    let static_fire_date_utc: String?
    let success: Bool?
    
}

struct Links: Codable {
    let patch: Patch
    let flickr: Flickr
}
struct Patch: Codable {
    let small: String?
    let large: String?
    
}

struct Flickr: Codable {
    let small: [String]
    let original: [String]
}
