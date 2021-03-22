//
//  NetworkManagerProtocol.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchAllTraffic()
    func fetchCurrentTraffic(cameraPresetsId: String, completion: @escaping (TrafficModel) -> ())
    
}
