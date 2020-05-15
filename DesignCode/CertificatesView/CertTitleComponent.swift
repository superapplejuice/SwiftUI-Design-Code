//
//  TitleView.swift
//  DesignCode
//
//  Created by Jan Mathew on 9/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct CertTitleComponent: View {
    @Binding var showCard: Bool

    var title: String
    var image: String
    var blur: CGFloat

    var body: some View {
        VStack {
            HStack {
                Text(self.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()

            Image(self.image)
            Spacer()
        }
        .blur(radius: self.blur)
        .opacity(self.showCard ? 0.4 : 1)
        .offset(y: self.showCard ? -200 : 0)
        .animation(
            Animation
                .default
                .delay(0.1)
        )
    }
}
