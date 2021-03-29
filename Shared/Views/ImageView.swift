//
//  ImageView.swift
//  DigitrafficApp
//
//  Created by Maijuriina Mustonen on 29/03/2021.
//

import SwiftUI

struct ImageView: View {
    
    let imageUrl: URL
    
    var body: some View {
        AsyncImage(url: imageUrl, placeholder: Text("Loading image.."))
            .aspectRatio(contentMode: .fit)
    }
}
