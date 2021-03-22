//
//  Traffic.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 22/03/2021.
//

import Foundation

struct Traffic: Codable {
    let id: Int
    let cameraStationsId, cameraPresetsId, roadName, imageUrl, measuredTime: String
}
