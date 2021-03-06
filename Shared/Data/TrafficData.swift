//
//  Traffic.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import Foundation

struct Results: Codable {
    let dataUpdatedTime: String
    let cameraStations: [CameraStation]
}

struct CameraStation: Codable, Identifiable {
    let id: String
    let roadStationID: Int
    let nearestWeatherStationID: Int?
    let cameraPresets: [CameraPreset]
    
    enum CodingKeys: String, CodingKey {
        case id
        case roadStationID = "roadStationId"
        case nearestWeatherStationID = "nearestWeatherStationId"
        case cameraPresets
    }
}

struct CameraPreset: Codable, Identifiable {
    let id: String
    let presentationName: String?
    let imageURL: String
    let measuredTime: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case presentationName
        case imageURL = "imageUrl"
        case measuredTime
    }
}
