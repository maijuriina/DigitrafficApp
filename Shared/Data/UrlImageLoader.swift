//
//  UrlImageLoader.swift
//  DigitrafficApp
//
//  Created by Maijuriina Mustonen on 29/03/2021.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    
    private var url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
        self.secureUrl(url: url)
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
    // takes URLComponents and makes it into https url
    func secureUrl(url: URL) {
        if var components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            components.scheme = "https"
            self.url = components.url!
        }
    }
}
