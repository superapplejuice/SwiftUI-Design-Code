//
//  AvatarComponent.swift
//  DesignCode
//
//  Created by Jan Mathew on 10/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct AvatarComponent: View {
    var dimensions: CGFloat
    var renderOriginal: Bool

    init(_ dimensions: CGFloat, _ renderOriginal: Bool) {
        self.dimensions = dimensions
        self.renderOriginal = renderOriginal
    }

    var body: some View {
        Image("Avatar")
            .renderingMode(self.renderOriginal ? .original : nil)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: self.dimensions, height: self.dimensions)
            .clipShape(Circle())
    }
}
