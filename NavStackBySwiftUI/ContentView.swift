//
//  ContentView.swift
//  NavStackBySwiftUI
//
//  Created by Hakob Ghlijyan on 19.07.2024.
//

import SwiftUI

struct ContentView: View {
    var platforms: [Platform] = [
        .init(name: "Xbox", imageName: "xbox.logo", color: .green),
        .init(name: "Playstation", imageName: "playstation.logo", color: .indigo),
        .init(name: "PC", imageName: "pc", color: .pink),
        .init(name: "Mobile", imageName: "iphone", color: .mint),
    ]
    
    var games: [Game] = [
        .init(name: "Minecraft", rating: "99"),
        .init(name: "God of War", rating: "98"),
        .init(name: "Fortnite", rating: "92"),
        .init(name: "Madden 2023", rating: "88"),
        .init(name: "FIFA 2023", rating: "97"),
    ]
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Platform") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage: platform.imageName)
                                .foregroundStyle(platform.color)
                        }
                    }
                }
                Section("Games") {
                    ForEach(games, id: \.name) { game in
                        NavigationLink(value: game) {
                            Text(game.name)
                        }
                    }
                }
            }
            .navigationTitle("Gaming")
            .navigationDestination(for: Platform.self) { platform in
                viewDestination(platform: platform, games: games)
//                ViewDestination(platform: platform, games: games)
            }
            .navigationDestination(for: Game.self) { game in
                viewDestination2(game: game)
            }
        }
    }
    
    private func viewDestination(platform: Platform, games: [Game]) -> some View {
        ZStack {
            platform.color.ignoresSafeArea()
            VStack {
                Label(platform.name, systemImage: platform.imageName)
                    .font(.largeTitle).bold()
                
                List {
                    ForEach(games, id: \.name) { game in
                        NavigationLink(value: game) {
                            Text(game.name)
                        }
                    }
                }
            }
        }
    }
    
    private func viewDestination2(game: Game) -> some View {
        VStack(spacing: 20.0) {
            Text("\(game.name) - \(game.rating)")
                .font(.largeTitle).bold()
            
            Button("Recomended Games") {
                path.append(games.randomElement()!)
            }
            Button("Go to another platform") {
                path.append(platforms.randomElement()!)
            }
            Button("Go Home") {
                path.removeLast(path.count)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct Platform: Hashable {
    let name: String
    let imageName: String
    let color: Color
}

struct Game: Hashable {
    let name: String
    let rating: String
}

struct ViewDestination: View {
    var platform: Platform
    var games: [Game]
    
    var body: some View {
        ZStack {
            platform.color.ignoresSafeArea()
            VStack {
                Label(platform.name, systemImage: platform.imageName)
                    .font(.largeTitle).bold()
                
                List {
                    ForEach(games, id: \.name) { game in
                        NavigationLink(value: game) {
                            Text(game.name)
                        }
                    }
                }
            }
        }
    }
}
