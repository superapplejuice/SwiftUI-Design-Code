//
//  HomeTitleBar.swift
//  DesignCode
//
//  Created by Jan Mathew on 15/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct HomeTitleBarComponent: View {
    @Binding var showUpdate: Bool
    @Binding var showMenu: Bool

    var body: some View {
        HStack {
            Text("Watching").font(.system(size: 28, weight: .bold))

            Spacer()

            Button(action: { self.showMenu.toggle() }) {
                AvatarComponent(dimensions: 36, renderOriginal: true)
            }

            Button(action: { self.showUpdate.toggle() }) {
                Image(systemName: "bell")
                    .renderingMode(.original)
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 36, height: 36)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            }
                // display modal
                .sheet(isPresented: $showUpdate) {
                    // View to render in the modal
                    UpdatesList()
            }
        }
        .padding(.horizontal, 30)
        .padding(.top, 30)
    }
}
