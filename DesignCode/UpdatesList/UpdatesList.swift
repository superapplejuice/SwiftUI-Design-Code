//
//  UpdatesList.swift
//  DesignCode
//
//  Created by Jan Mathew on 14/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct UpdateData: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
    var content: String
    var date: String
}

let updateDataList = [
    UpdateData(
        icon: "Card1",
        title: "SwiftUI Advanced",
        content: "Want to test concepts using real techniques? This is the perfect course to learn design using SwiftUI.",
        date: "Dec 14"
    ),
    UpdateData(
        icon: "Card2",
        title: "SwiftUI Prototyping",
        content: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.",
        date: "Nov 23"
    )
]

struct UpdatesList: View {
    var body: some View {
        NavigationView {
            List(updateDataList) { item in
                NavigationLink(destination: Text(item.content)) {
                    Text(item.title)
                }
            }
            .navigationBarTitle(Text("Updates"))
        }
    }
}

struct UpdatesList_Previews: PreviewProvider {
    static var previews: some View {
        UpdatesList()
    }
}
