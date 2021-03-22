//
//  TrafficNetworkManager.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import Foundation

class TrafficNetworkManager : NetworkManagerProtocol {
    public let API_URL = "https://tie.digitraffic.fi/api/v1/data/camera-data"
    
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
    
    func fetchCurrentTraffic(id: String, completion: @escaping (TrafficModel) -> ()) {
        let API_URL_WITH_ID = API_URL + "/" + id
        guard let url = URL(string: API_URL_WITH_ID) else { // creates the url
            fatalError()
        }
        print(url)
        // problem much like https://stackoverflow.com/questions/50179922/debugdescription-expected-to-decode-arrayany-but-found-a-dictionary-instead
        
        // start urlsession with request
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            //print(String(data: data!, encoding: .utf8))
            guard let data = data else { return }

            // if not nil, decode with TrafficModel
            do {
                let decoder = JSONDecoder()
                let currentTraffic = try decoder.decode(TrafficModel.self, from: data)
                /*for cam in currentTraffic.cameraStations {
                    print(cam)
                }*/
                print(currentTraffic as Any)
                print(currentTraffic.self.cameraStations as Any)
                completion(currentTraffic.self)
            } catch {
                print(error)
            }
        }.resume()
    }
}
