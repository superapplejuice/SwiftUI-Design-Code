//
//  BackCardView.swift
//  DesignCode
//
//  Created by Jan Mathew on 9/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct CertBackCardComponent: View {
    @Binding var view: CGSize
    @Binding var showCard: Bool

    var offsetY: CGFloat = -20
    var scale: CGFloat = 1
    var tilt: Double = 0
    var bgColor: Color = Color.blue
    var animation: Double = 0
    var rotation: Double = 0
    var showCardOffset: CGFloat = 0
    var width: CGFloat = 0

    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: self.width, height: 220)
        .background(self.bgColor)
        .cornerRadius(20)
        .shadow(radius: 20)
        .offset(x: 0, y: self.offsetY)
        .offset(x: self.view.width, y: self.view.height)
        .offset(y: showCard ? self.showCardOffset : 0)
        .scaleEffect(showCard ? 1 : self.scale)
        .rotationEffect(.degrees(showCard ? 0 : self.tilt))
        .rotation3DEffect(
            .degrees(showCard ? 0 : self.rotation),
            axis: (x: 10.0, y: 0, z: 0)
        )
        .blendMode(.hardLight)
        .animation(.easeInOut(duration: self.animation))
    }
}
