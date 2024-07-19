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
        .init(name: "Pc", imageName: "pc", color: .pink),
        .init(name: "Mobile", imageName: "iphone", color: .mint),
    ]
    
    var body: some View {
        List {
            Section("Platform") {
                ForEach(platforms, id: \.name) { platform in
                    Label(platform.name, systemImage: platform.imageName)
                        .foregroundStyle(platform.color)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

struct Platform {
    let name: String
    let imageName: String
    let color: Color
}
