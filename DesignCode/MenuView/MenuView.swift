//
//  MenuView.swift
//  DesignCode
//
//  Created by Jan Mathew on 10/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    @Binding var showMenu: Bool
    @Binding var viewState: CGSize

    @EnvironmentObject var userData: UserData

    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: 16) {
                Text("\(self.userData.name) - \(self.userData.completion)% complete")
                    .font(.caption)

                // `Color` is also a View
                Color.white
                    .frame(
                        width: CGFloat(self.userData.completion),
                        height: 6
                    )
                    .cornerRadius(3)
                    .frame(width: 130, height: 6, alignment: .leading)
                    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.1))
                    .cornerRadius(3)
                    .padding()
                    .frame(width: 150, height: 24)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(12)

                MenuRowComponent(
                    title: "Account",
                    icon: "person.circle"
                )
                MenuRowComponent(
                    title: "Billing",
                    icon: "creditcard"
                )
                MenuRowComponent(
                    title: "Logout",
                    icon: "exclamationmark.circle"
                )
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(LinearGradient(
                gradient: Gradient(
                    colors: [Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), Color(#colorLiteral(red: 0.8705882353, green: 0.8941176471, blue: 0.9450980392, alpha: 1))]
                ),
                startPoint: .topLeading,
                endPoint: .bottom
            ))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(
                color: Color.black.opacity(0.3),
                radius: 20,
                x: 0,
                y: 20
            )
            .padding(.horizontal, 30)
            .overlay(
                AvatarComponent(
                    dimensions: 60,
                    renderOriginal: false
                ).offset(y: -150)
            )
        }
        .padding(.bottom, 30)
        .background(Color.black.opacity(0.0001))
        .offset(y: self.showMenu ? 0 : currentScreen.height)
        .offset(y: self.viewState.height)
        .animation(
            .spring(
                response: 0.5,
                dampingFraction: 0.6,
                blendDuration: 0
            )
        )
        .onTapGesture {
            self.showMenu.toggle()
        }
    }
}
