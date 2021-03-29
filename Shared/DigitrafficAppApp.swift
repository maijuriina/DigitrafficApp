//
//  DigitrafficAppApp.swift
//  Shared
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import SwiftUI

@main
struct DigitrafficAppApp: App {
    let trafficNetworkManager = TrafficNetworkManager()
    var body: some Scene {
        WindowGroup {
            CurrentTraffic()
                .environmentObject(trafficNetworkManager)
        }
        
    }
}
