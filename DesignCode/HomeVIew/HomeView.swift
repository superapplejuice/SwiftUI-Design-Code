//
//  ContenView.swift
//  DesignCode
//
//  Created by Jan Mathew on 10/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private var showMenu: Bool = false
    @State private var viewState: CGSize = .zero

    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)

            HomeContentComponent(showMenu: $showMenu, viewState: $viewState)

            MenuView(showMenu: $showMenu, viewState: $viewState)
                .environmentObject(UserData())
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    self.viewState = value.translation

                    // prevent user from dragging too high
                    if self.viewState.height <= -200 {
                        self.viewState.height = -200
                    }

                    // automatically close app on excess downward drag
                    if self.viewState.height > 175 {
                        self.showMenu = false
                        self.viewState = .zero
                    }
                }
                .onEnded { _ in
                    if self.viewState.height > 50 {
                        self.showMenu = false
                    }

                    self.viewState = .zero
                }
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
