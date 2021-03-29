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
    // @ObservedObject var traffic = CurrentTrafficViewModel()
    
    var body: some View {
        //VStack (alignment: .leading) {
            Text("Digitraffic")
                .bold()
                
            CurrentTraffic()
        //}
        //.padding(.leading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
