//
//  ContentView.swift
//  Moonshot
//
//  Created by Ton Silva on 14/6/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State var switchGridMode: Bool = true
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            Group {
                if switchGridMode {
                    GridLayoutView(astronauts: astronauts, missions: missions)
                } else {
                    ListLayoutView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    switchGridButton
                }
            }
        }
    }
    
    var switchGridButton: some View {
        Button {
            self.switchGridMode.toggle()
            print(switchGridMode)
        } label: {
            Image(systemName: "switch.2")
                .foregroundColor(.white)
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(switchGridMode: true)
    }
}
