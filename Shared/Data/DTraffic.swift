//
//  Traffic.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import Foundation

struct DTraffic: Codable {
    let dataUpdatedTime: String
}

struct CameraStations: Codable {
    let cameraStationsId: String
    let roadStationId: Int
}

struct CameraPresets: Codable {
    let cameraPresetsId, presentationName, imageUrl, measuredTime: String
}

struct TrafficModel: Codable { // response from url in model
    let traffic: [DTraffic]
    let cameraStations: CameraStations
    let cameraPresets: CameraPresets
}

