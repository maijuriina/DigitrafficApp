//
//  TrafficMetaData.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 29/03/2021.
//

import Foundation

struct TrafficMetadata: Decodable {
    let dataSet: [DataSet]
}

struct DataSet: Decodable, Identifiable {
    let id: String
    let properties: Property
    
    enum CodingKeys: String, CodingKey {
        case id
        case properties
    }
}

struct Property: Decodable, Identifiable {
    let id: String
    let municipality: String
    let province: String
    let names: Names
    let presets: [Preset]

    enum CodingKeys: String, CodingKey {
        case id, municipality, province
        case names
        case presets
    }
}

struct Names: Decodable {
    let fi: String?
    let sv: String?
    let en: String?
}

struct Preset: Decodable, Identifiable {
    var id = UUID()
    let presentationName: String?
    let imageUrl: String
}
