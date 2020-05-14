//
//  HomeSectionCardComponent.swift
//  DesignCode
//
//  Created by Jan Mathew on 12/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct HomeSectionCardComponent: View {
    var sectionData: SectionData

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(self.sectionData.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)

                Spacer()

                Image(self.sectionData.logoImage)
            }
            Text(sectionData.sectionText.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)

            self.sectionData.backgroundImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(self.sectionData.backgroundColor)
        .cornerRadius(30)
        .shadow(color: self.sectionData.backgroundColor.opacity(0.5), radius: 20, y: 10)
    }
}
