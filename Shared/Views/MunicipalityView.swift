//
//  MunicipalityView.swift
//  DigitrafficApp
//
//  Created by Maijuriina Mustonen on 29/03/2021.
//

import SwiftUI

struct MunicipalityView: View {
    @EnvironmentObject var networkManager: TrafficNetworkManager
    let province: String
    
    var body: some View {
        List (networkManager.municipalityArray, id: \.self) { municipality in
            NavigationLink(destination: CityView(municipality: municipality)) {
                Text(municipality)
            }
        }
        .navigationBarTitle(province)
        .onAppear() {
            self.networkManager.fetchMunicipalities(selectedProvince: self.province)
        }
    }
}

struct MunicipalityView_Previews: PreviewProvider {
    static var previews: some View {
        MunicipalityView(province: "Province")
    }
}
