//
//  TitleView.swift
//  DesignCode
//
//  Created by Jan Mathew on 9/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct TitleView: View {
    @Binding var showCard: Bool
    
    var title: String = ""
    var image: String = ""
    var blur: CGFloat = 20
    
    init(
        title: String,
        image: String,
        blur: CGFloat,
        showCard: Binding<Bool>
    ) {
        self.title = title
        self.image = image
        self.blur = blur
        _showCard = showCard
    }
    
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
        .opacity(showCard ? 0.4 : 1)
        .offset(y: showCard ? -200 : 0)
        .animation(
            Animation
                .default
                .delay(0.1)
        )
    }
}
