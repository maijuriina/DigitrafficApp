//
//  TrafficNetworkManager.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 08/03/2021.
//

import Foundation

class TrafficNetworkManager: ObservableObject {
    
    // "https://tie.digitraffic.fi/api/v1/data/camera-data"
    @Published var cameraStations = [CameraStation]()
    
    // "https://tie.digitraffic.fi/api/v3/metadata/camera-stations"
    @Published var metadata = [Feature]()
    
    // Store provinces in @Published array to be shown inside Views
    var province: Set<String> = []
    @Published var provinceArray: [String] = []
    
    // Store municipalities also
    var municipality: Set<String> = []
    @Published var municipalityArray: [String] = []
    
    @Published var tempRoads: [Preset] = []
    
    // Store road names in @Published array to be shown inside Views
    @Published var roadNames: [String] = []
    
    // Store imageUrls also
    @Published var imageUrls: [String] = []
    
    @Published var cameraPresets: [CameraPreset] = []
    
    func fetchData() {
        if let url = URL(string: "https://tie.digitraffic.fi/api/v1/data/camera-data") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.cameraStations = results.cameraStations
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchMetadata() {
        
        if let url = URL(string: "https://tie.digitraffic.fi/api/v3/metadata/camera-stations") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Metadata.self, from: safeData)
                            DispatchQueue.main.async {
                                self.metadata = results.features
                                
                                for i in results.features {
                                    self.province.insert(i.properties.province)
                                }
                                self.provinceArray = Array(self.province)
                                self.provinceArray.sort()
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchMunicipalities(selectedProvince: String) {
        
        DispatchQueue.main.async {
            
            self.municipality.removeAll()
            
            for province in self.metadata {
                if province.properties.province == selectedProvince {
                    self.municipality.insert(province.properties.municipality)
                }
            }
            
            self.municipalityArray = Array(self.municipality)
            self.municipalityArray.sort()
        }
    }
    
    func fetchRoadNames(selectedMunicipality: String) {

        DispatchQueue.main.async {
            self.roadNames.removeAll()
                        
            for municipality in self.metadata {
                if municipality.properties.municipality == selectedMunicipality {
                    self.roadNames.append(municipality.properties.names.fi ?? "Municipality")
                }
            }
        }
    }
    
    func fetchPresets(roadId: String) {
        
        DispatchQueue.main.async {
            self.tempRoads.removeAll()
            
            for road in self.metadata {
                if road.properties.names.fi == roadId {
                    for preset in road.properties.presets {
                        self.tempRoads.append(preset)
                    }
                }
            }
        }
    }
    
    func fetchImageUrls(roadId: String) {
        
        DispatchQueue.main.async {
            self.imageUrls.removeAll()
            
            for road in self.cameraStations {
                if road.id == roadId {
                    self.imageUrls.append(road.cameraPresets[0].presentationName ?? "Name unavailable")
                }
            }
        }
    }
}
