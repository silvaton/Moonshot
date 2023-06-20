//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Ton Silva on 20/6/23.
//

import SwiftUI

struct ListLayoutView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    HStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)

                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                    }
                }
            }
            .listRowBackground(Color(red: 0.1, green: 0.1, blue: 0.2))
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
        .scrollContentBackground(.hidden)
    }
}

struct ListLayoutView_Previews: PreviewProvider {
    static let tempAstronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let tempMissions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListLayoutView(astronauts: tempAstronauts, missions: tempMissions)
            .preferredColorScheme(.dark)
    }
}
