//
//  MenuRow.swift
//  DesignCode
//
//  Created by Jan Mathew on 10/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct MenuRowComponent: View {
    var title: String
    var icon: String

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: self.icon)
                .font(.system(size: 20, weight: .medium))
                .imageScale(.large)
                .frame(width: 32, height: 32)
                .foregroundColor(
                    Color(
                        #colorLiteral(
                            red: 0.662745098,
                            green: 0.7333333333,
                            blue: 0.831372549,
                            alpha: 1
                        )
                    )
                )

            Text(self.title)
                .font(.system(size: 20, weight: .bold))
                .frame(width: 120, alignment: .leading)
        }
    }
}
