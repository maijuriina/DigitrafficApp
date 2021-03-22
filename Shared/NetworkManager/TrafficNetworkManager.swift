//
//  TrafficNetworkManager.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import Foundation

class TrafficNetworkManager : NetworkManagerProtocol {
    func fetchCurrentTraffic(roadName: String, completion: @escaping (TrafficModel) -> ()) {
        // use index of list object as roadName...
        let API_URL = "https://tie.digitraffic.fi/api/v1/data/camera-data"
    
    
    }
}
