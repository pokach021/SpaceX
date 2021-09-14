//
//  RocketModel.swift
//  RSSchool_T11
//
//  Created by Andrew Pokachailo on 9/13/21.
//

import Foundation

struct RocketModel: Codable {
    let company: String
    let wikipedia: String
    let description: String
    let name: String
    let cost_per_launch: Int 
    let success_rate_pct: Int
    let first_flight: String
    let height: Height
    let diameter: Diameter
    let flickr_images: [String]
    let engines: Engines
}

struct Height: Codable {
    let meters: Double
    let feet: Double

}

struct Diameter: Codable {
    var meters: Double
    var feet: Double
}

struct ThrustSeaLevel: Codable {
    let kN: Int
    let lbf: Int
    
}

struct Isp: Codable {
    let sea_level: Int
    let vacuum: Int
}

struct Engines: Codable {
    let type: String
    let layout: String?
    let version: String
    let number: Int
    let propellant_1: String
    let propellant_2: String
    let thrust_sea_level: ThrustSeaLevel
    let isp: Isp
}


//"engines": {
//   "isp": {
//     "sea_level": 288,
//     "vacuum": 312
//   },
//   "thrust_sea_level": {
//     "kN": 845,
//     "lbf": 190000
//   },
//   "thrust_vacuum": {
//     "kN": 914,
//     "lbf": 205500
//   },
//   "number": 27,
//   "type": "merlin",
//   "version": "1D+",
//   "layout": "octaweb",
//   "engine_loss_max": 6,
//   "propellant_1": "liquid oxygen",
//   "propellant_2": "RP-1 kerosene",
//   "thrust_to_weight": 180.1
// },

//    let height: [String: Double]
//    let diameter: [String: Double]
//    let mass: [String: Int]
//    let firstStage: [String: [String: Int]]
//    let isReusable: Bool
//    let engines:Int
//    let fuelAmountInTons: Int
//    let burnTimeInSec: Int
//    let secondStage: [String: [String: Int]]
