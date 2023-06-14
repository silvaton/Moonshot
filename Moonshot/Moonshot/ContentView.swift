//
//  ContentView.swift
//  Moonshot
//
//  Created by Ton Silva on 14/6/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astrounaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("\(astronauts.count)")
            Text("\(missions.count)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
