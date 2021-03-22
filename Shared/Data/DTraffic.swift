//
//  Traffic.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import Foundation

struct DTraffic: Decodable, Identifiable {
    let id: String?
    let dataUpdatedTime: String?
    let cameraStations: [CameraStation]?
}

struct CameraStation: Decodable, Identifiable {
    let id: String?
    let roadStationId: Int?
    let cameraPresets: [CameraPreset]?
}

struct CameraPreset: Decodable, Identifiable {
    let id, imageUrl: String?
    let presentationName: String?
    let measuredTime: Date?
}

struct TrafficModel: Decodable { // response from url in model
    let dataUpdatedTime: Date?
    let cameraStations: [CameraStation]?
    let cameraPresets: [CameraPreset]?
}

