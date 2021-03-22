//
//  TrafficNetworkManager.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import Foundation

class TrafficNetworkManager : NetworkManagerProtocol {
    let API_URL = "https://tie.digitraffic.fi/api/v1/data/camera-data"
    
    func fetchAllTraffic() {
        guard let url = URL(string: API_URL) else { // creates the url
            fatalError()
        }
        print(url)
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let currentAllTraffic = try JSONDecoder().decode(TrafficModel.self, from: data)
                print(currentAllTraffic)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func fetchCurrentTraffic(cameraPresetsId: String, completion: @escaping (TrafficModel) -> ()) {
        // use index of list object as roadName...
        guard let url = URL(string: API_URL) else { // creates the url
            fatalError()
        }
        print(url)
        
        // start urlsession with request
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data else { return }

            // if not nil, decode with TrafficModel
            do {
                let currentTraffic = try JSONDecoder().decode(TrafficModel.self, from: data)
                print(currentTraffic)
                completion(currentTraffic)
            } catch {
                print(error)
            }
        }.resume()
    }
}
