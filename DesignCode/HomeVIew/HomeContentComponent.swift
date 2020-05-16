//
//  TitleComponent.swift
//  DesignCode
//
//  Created by Jan Mathew on 12/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct SectionData: Identifiable {
    var id = UUID()
    var title: String
    var logoImage: String
    var sectionText: String
    var backgroundImage: Image
    var backgroundColor: Color
}

let sectionData: [SectionData] = [
    SectionData(
        title: "Prototype designs in SwiftUI",
        logoImage: "Logo1",
        sectionText: "18 Sections",
        backgroundImage: Image(uiImage: #imageLiteral(resourceName: "Card6")),
        backgroundColor: Color("card1")
    ),
    SectionData(
        title: "Build a SwiftUI app",
        logoImage: "Logo1",
        sectionText: "20 Sections",
        backgroundImage: Image(uiImage: #imageLiteral(resourceName: "Card4")),
        backgroundColor: Color("card2")
    ),
    SectionData(
        title: "Advanced SwiftUI",
        logoImage: "Logo1",
        sectionText: "20 Sections",
        backgroundImage: Image(uiImage: #imageLiteral(resourceName: "Card5")),
        backgroundColor: Color("card3")
    ),
]

struct HomeContentComponent: View {
    @State private var showUpdate: Bool = false

    @Binding var showMenu: Bool
    @Binding var viewState: CGSize

    var body: some View {
        VStack {
            HomeTitleBarComponent(
                showUpdate: $showUpdate,
                showMenu: $showMenu
            )

            HomeSectionComponent()

            Spacer()
        }
        .padding(.top, 44)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
        .offset(y: self.showMenu ? -450 : 0)
        .rotation3DEffect(
            Angle(
                degrees: self.showMenu
                    ? Double(self.viewState.height / 10) - 10 : 0
            ),
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
    }
}
