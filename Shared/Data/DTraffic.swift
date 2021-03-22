//
//  Traffic.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import Foundation

struct DTraffic: Codable {
    let dataUpdatedTime: Date
    let cameraStations: [CameraStation]
}

struct CameraStation: Codable {
    let id: String
    let roadStationId: Int
    let cameraPresets: [CameraPreset]
}

struct CameraPreset: Codable {
    let id, imageUrl: String
    let presentationName: String?
    let measuredTime: Date?
}

struct TrafficModel: Codable { // response from url in model
    let traffic: [DTraffic]
}

