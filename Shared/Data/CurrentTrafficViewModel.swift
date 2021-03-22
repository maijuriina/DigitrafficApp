//
//  CurrentTrafficViewModel.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 22/03/2021.
//

import Foundation
import Combine

final class CurrentTrafficViewModel: ObservableObject {
    @Published var current: TrafficModel?
    let networkManager = TrafficNetworkManager()
    
    init() {
        self.fetch()
    }
}

extension CurrentTrafficViewModel {
    func fetch(by cameraPresetsId: String = "C0150200") {
        networkManager.fetchCurrentTraffic(cameraPresetsId: cameraPresetsId) {
            self.current = $0
        }
    }
}
