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
    let mass: Mass
    let flickr_images: [String]
    let engines: Engines
    let first_stage: FirstStage
    let second_stage: SecondStage
    let landing_legs: LandingLegs
}

struct Height: Codable {
    let meters: Double
    let feet: Double

}

struct LandingLegs: Codable {
    let number: Int
    let material: String?
}

struct Mass: Codable {
    let kg: Int
    let lb: Int
}

struct Diameter: Codable {
    var meters: Double
    var feet: Double
}

struct ThrustSeaLevel: Codable {
    let kN: Int
    let lbf: Int
    
}

struct ThrustVacuum: Codable {
    let kN: Int
    let lbf: Int
}

struct Isp: Codable {
    let sea_level: Int
    let vacuum: Int
}

struct Thrust: Codable {
    let kN: Int
    let lbf: Int
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

struct FirstStage: Codable {
    let thrust_sea_level: ThrustSeaLevel
    let thrust_vacuum: ThrustVacuum
    let reusable: Bool
    let fuel_amount_tons: Double
    let burn_time_sec: Int?
    let engines: Int
}

struct SecondStage: Codable {
    let reusable: Bool
    let engines: Int
    let fuel_amount_tons: Double
    let burn_time_sec: Int?
    let thrust: Thrust
    
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
