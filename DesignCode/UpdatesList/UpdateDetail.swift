//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by Jan Mathew on 15/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var updateItem: UpdateData

    var body: some View {
        List {
            VStack {
                Image(updateItem.icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)

                Text(updateItem.content)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationBarTitle(updateItem.title)
        }
        .listStyle(PlainListStyle())
    }
}
