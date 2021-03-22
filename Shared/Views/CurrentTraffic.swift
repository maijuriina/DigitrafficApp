//
//  CurrentTraffic.swift
//  DigitrafficApp (iOS)
//
//  Created by Maijuriina Mustonen on 22/03/2021.
//

import SwiftUI

struct CurrentTraffic: View {
    var traffic: TrafficModel?
    var height: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Traffic camera")
                .font(.title)
                .foregroundColor(Color.purple)
            
            /*Text("\(traffic?.name?? "Unknown")")
                .font(.system(size: 50))
                .bold()
                .foregroundColor(.purple)
                .padding(.bottom)
 */
        }
    }
}

struct CurrentTraffic_Previews: PreviewProvider {
    static var previews: some View {
        CurrentTraffic()
    }
}
