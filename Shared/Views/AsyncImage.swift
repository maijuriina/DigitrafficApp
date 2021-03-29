//
//  AsyncImage.swift
//  DigitrafficApp
//
//  Created by Maijuriina Mustonen on 29/03/2021.
//

import SwiftUI

struct AsyncImage<Placeholder: View>: View {
    
    @ObservedObject private var imageLoader: ImageLoader
    private let placeholder: Placeholder?
    
    init(url: URL, placeholder: Placeholder? = nil) {
        imageLoader = ImageLoader(url: url)
        self.placeholder = placeholder
    }
    
    var body: some View {
        roadImage
            .onAppear(perform: imageLoader.load)
            .onDisappear(perform: imageLoader.cancel)
    }
    
    private var roadImage: some View {
        Group {
            if imageLoader.image != nil {
                Image(uiImage: imageLoader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}
