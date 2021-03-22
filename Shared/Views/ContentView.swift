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
    let networkManager = TrafficNetworkManager()
    @State var id: String = ""
    @ObservedObject var traffic = CurrentTrafficViewModel()
    
    var body: some View {
        VStack () {
            Text("Digitraffic")
                .bold()
            
            CurrentTraffic()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
