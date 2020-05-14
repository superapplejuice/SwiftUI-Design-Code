//
//  ContentView.swift
//  DesignCode
//
//  Created by Jan Mathew on 7/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct CertificatesView: View {
    @State private var show: Bool = false
    @State private var view: CGSize = .zero
    @State private var showCard: Bool = false
    @State private var bottomDrag: CGSize = .zero
    @State private var showFull: Bool = false

    @EnvironmentObject var userData: UserData

    let backCardWidth: CGFloat = 340

    var body: some View {
        ZStack {
            CertTitleComponent(
                title: "Certificates",
                image: "Background1",
                blur: self.show ? 20 : 0,
                showCard: $showCard
            )

            CertBackCardComponent(
                offsetY: self.show ? -400 : -40,
                scale: 0.9,
                tilt: self.show ? 0 : 10,
                bgColor: Color("card4"),
                animation: 0.4,
                rotation: 10,
                showCardOffset: -180,
                width: showCard ? 300 : backCardWidth,
                view: $view,
                showCard: $showCard
            )

            CertBackCardComponent(
                offsetY: self.show ? -200 : -20,
                scale: 0.95,
                tilt: self.show ? 0 : 5,
                bgColor: Color("card3"),
                animation: 0.25,
                rotation: 5,
                showCardOffset: -140,
                width: backCardWidth,
                view: $view,
                showCard: $showCard
            )

            CertCardComponent(
                progress: self.userData.progress,
                show: $show,
                view: $view,
                showCard: $showCard
            )

            CertBottomCardComponent(
                name: self.userData.name,
                progress: self.userData.progress,
                show: $show,
                showCard: $showCard,
                bottomDrag: $bottomDrag,
                showFull: $showFull
            )
        }
    }
}

struct CertificatesView_Previews: PreviewProvider {
    static var previews: some View {
        CertificatesView().environmentObject(UserData())
    }
}
