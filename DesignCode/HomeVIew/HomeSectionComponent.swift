//
//  HomeSectionComponent.swift
//  DesignCode
//
//  Created by Jan Mathew on 15/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct HomeSectionComponent: View {
    var body: some View {
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
                                Angle(
                                    degrees:
                                        Double(
                                            geometry.frame(in: .global).minX
                                                - 30
                                        )
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
    }
}
