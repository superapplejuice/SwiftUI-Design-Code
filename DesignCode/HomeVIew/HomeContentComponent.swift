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
    )
]

struct HomeContentComponent: View {
    @State private var showUpdate: Bool = false

    @Binding var showMenu: Bool
    @Binding var viewState: CGSize

    var body: some View {
        VStack {
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
                    // code to show in the modal
                    CertificatesView().environmentObject(UserData())
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 30)

            // horizontal scrolling
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(sectionData) { item in
                        /*
                         gives dimension info
                         e.g. width, height, corner positions, etc.
                         */
                        GeometryReader { geometry in
                            HomeSectionCardComponent(sectionData: item)
                                .rotation3DEffect(
                                    Angle(degrees:
                                        Double(geometry.frame(in: .global).minX - 30)
                                    ) / -25,
                                    axis: (x: 0, y: 10, z: 0)
                                )
                        }
                        .frame(width: 275, height: 257)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }

            Spacer()
        }
        .padding(.top, 44)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
        .offset(y: self.showMenu ? -450 : 0)
        .rotation3DEffect(
            Angle(degrees: self.showMenu ? Double(self.viewState.height / 10) - 10 : 0
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

struct HomeContentComponent_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentComponent(showMenu: .constant(false), viewState: .constant(.zero))
    }
}
