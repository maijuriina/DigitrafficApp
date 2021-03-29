//
//  CurrentTrafficViewModel.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 22/03/2021.
//

import Foundation
import Combine

final class CurrentTrafficViewModel: ObservableObject {
    // @Published var current: TrafficData
    let networkManager = TrafficNetworkManager()
    
    init() {
        // self.current = $0
        self.fetch()
    }
}

extension CurrentTrafficViewModel {
    func fetch() {
        networkManager.fetchData()
    }
    /*func fetch(by id: String = "C0150200") {
        networkManager.fetchCurrentTraffic(id: id) {
            self.current = $0
        }
    } */
}
