//
//  GridLayoutView.swift
//  Moonshot
//
//  Created by Ton Silva on 20/6/23.
//

import SwiftUI

struct GridLayoutView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        }
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
        .background(.darkBackground)
    }
}

struct GridLayoutView_Previews: PreviewProvider {
    static let tempAstronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let tempMissions: [Mission] = Bundle.main.decode("missions.json")
    static var previews: some View {
        GridLayoutView(astronauts: tempAstronauts, missions: tempMissions)
            //.background(.darkBackground)
            .preferredColorScheme(.dark)
    }
}
