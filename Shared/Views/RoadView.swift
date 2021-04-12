//
//  RoadView.swift
//  DigitrafficApp
//
//  Created by Maijuriina Mustonen on 29/03/2021.
//

import SwiftUI

struct RoadView: View {
    
    @EnvironmentObject var networkManager: TrafficNetworkManager
    let road: String
    let roadId: String
    
    var body: some View {
        List(networkManager.tempRoads) { road in
            NavigationLink(destination: ImageView(imageUrl: URL(string: road.imageUrl)!)) {
                Text(road.presentationName ?? "Road name not in use")
            }
        }
        .onAppear() {
            self.networkManager.fetchPresets(roadId: self.road)
        }
        .navigationBarTitle(road)
    }

}

struct RoadView_Previews: PreviewProvider {
    static var previews: some View {
        RoadView(road: "Road", roadId: "100")
            .environmentObject(TrafficNetworkManager())
    }
}
