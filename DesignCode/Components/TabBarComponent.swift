//
//  TabBarComponent.swift
//  DesignCode
//
//  Created by Jan Mathew on 15/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct TabBarComponent: View {
    var body: some View {
        // bottom navigation bar
        TabView {
            HomeView().tabItem {
                Image(systemName: "play.circle.fill")

                Text("Home")
            }

            CertificatesView()
                .environmentObject(UserData())
                .tabItem {
                    Image(systemName: "rectangle.stack.fill")

                    Text("Certificates")
                }
        }
    }
}

struct TabBarComponent_Previews: PreviewProvider {
    static var previews: some View {
            TabBarComponent()
    }
}
