//
//  ContentView.swift
//  Shared
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import SwiftUI
import UIKit

struct ContentView: View {
    // create instance of TrafficNetworkManager
    @EnvironmentObject var networkManager: TrafficNetworkManager
    
    var body: some View {
            /*Text("Digitraffic")
                .bold()
                .font(.title3)*/
        
            NavigationView {
                List {
                    ForEach(networkManager.provinceArray, id: \.self) { province in
                        NavigationLink(destination: MunicipalityView(province: province)) {
                            Text(province)
                                .font(.title2)
                                .foregroundColor(Color.purple)
                        }
                    }
                }
                .navigationBarTitle("Traffic camera")
                .onAppear {
                    self.networkManager.fetchData()
                    self.networkManager.fetchMetadata()
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TrafficNetworkManager())
    }
}
