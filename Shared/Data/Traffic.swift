//
//  Traffic.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import Foundation

struct Traffic: Codable {
    let cameraStationId, cameraPresetId, roadName, imageUrl, measuredTime: String
}

struct TrafficModel: Codable {
    let traffic: [Traffic]
}

