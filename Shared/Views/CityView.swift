//
//  CityView.swift
//  DigitrafficApp
//
//  Created by Maijuriina Mustonen on 29/03/2021.
//

import SwiftUI

struct CityView: View {
    
    @EnvironmentObject var networkManager: TrafficNetworkManager
    let municipality: String
    
    var body: some View {
        List(networkManager.roadNames, id: \.self) { road in
            NavigationLink(destination: RoadView(road: road, roadId: "null")) {
                Text(road)
            }
        }
        .navigationBarTitle(municipality)
        .onAppear() {
            self.networkManager.fetchRoadNames(selectedMunicipality: self.municipality)
        }
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(municipality: "Municipality")
            .environmentObject(TrafficNetworkManager())
    }
}
