//
//  Traffic.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import Foundation

struct DTraffic: Codable {
    let id: Int
    let cameraStationsId, cameraPresetsId, roadName, imageUrl, measuredTime: String
}

struct TrafficModel: Codable {
    let traffic: [DTraffic]
}

