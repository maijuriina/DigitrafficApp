//
//  CurrentTraffic.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 22/03/2021.
//

import SwiftUI

struct CurrentTraffic: View {
    // var traffic: TrafficData
    //var height: CGFloat = 0
    @EnvironmentObject var networkManager: TrafficNetworkManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Traffic camera")
                .font(.title2)
                .foregroundColor(Color.purple)
            
            /*NavigationView {
                List {
                    ForEach(networkManager.$provinceArray, id: \.self) { province in
                        NavigationLink(destination: MunicipalityView(province: province)) {
                            Text(province)
                        }
                    }
                }
                .navigationBarTitle("title here")
                .onAppear {
                    self.networkManager.fetchData()
                    self.networkManager.fetchMetadata()
                }
            }*/
            
            /*Text("\(traffic.cameraStations[0].cameraPresets[0].presentationName ?? "Unknown")")
                .font(.system(size: 50))
                .bold()
                .foregroundColor(.purple)
                .padding(.bottom)
            
            */
        }
    }
}
        /*VStack(alignment: .leading) {
            Text("Traffic camera")
                .font(.title2)
                .foregroundColor(Color.purple)
            
            Text("\(traffic?.cameraStations?[0].cameraPresets?[0].presentationName ?? "Unknown")")
                .font(.system(size: 50))
                .bold()
                .foregroundColor(.purple)
                .padding(.bottom)
            
            Image(uiImage: "https://weathercam.digitraffic.fi/\(traffic?.cameraStations?[0].cameraPresets?[0].id ?? "Unknown").jpg".load())
 
        
    }}*/


// used for locating picture using url
extension String {
    func load() -> UIImage {
        do {
            guard let url = URL(string: self) else {
                return UIImage()
            }
            // convert url to data
            print(url)
            let data: Data = try
                Data(contentsOf: url)
            return UIImage(data: data)
            ?? UIImage()
        }
        catch {
            print(error)
        }
        return UIImage()
    }
}


struct CurrentTraffic_Previews: PreviewProvider {
    static var previews: some View {
        CurrentTraffic()
    }
}
