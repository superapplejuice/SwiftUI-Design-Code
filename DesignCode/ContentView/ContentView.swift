//
//  ContenView.swift
//  DesignCode
//
//  Created by Jan Mathew on 10/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showMenu: Bool = false

    @EnvironmentObject var userData: UserData

    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Text("Watching").font(.system(size: 28, weight: .bold))

                    Spacer()

                    Button(action: { self.showMenu.toggle() }) {
                        AvatarComponent(36, true)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)

                Spacer()
            }
            .padding(.top, 44)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            .offset(y: self.showMenu ? -450 : 0)
            .rotation3DEffect(
                Angle(degrees: self.showMenu ? -10 : 0),
                axis: (x: 10, y: 0, z: 0)
            )
            .scaleEffect(self.showMenu ? 0.9 : 1)
            .animation(
                .spring(
                    response: 0.5,
                    dampingFraction: 0.6,
                    blendDuration: 0
                )
            )

            .edgesIgnoringSafeArea(.all)

            MenuView()
                .environmentObject(UserData())
                .offset(y: self.showMenu ? 0 : 600)
                .animation(
                    .spring(
                        response: 0.5,
                        dampingFraction: 0.6,
                        blendDuration: 0
                    )
                )
        }
    }
}

struct ContenView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
