//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Jan Mathew on 15/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import Combine
import SwiftUI

struct UpdateData: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
    var content: String
    var date: String
}

// original data
let updateDataList: [UpdateData] = [
    UpdateData(
        icon: "Card1",
        title: "SwiftUI Advanced",
        content:
            "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.",
        date: "JAN 1"
    ),
    UpdateData(
        icon: "Card2",
        title: "Webflow",
        content:
            "Design and animate a high converting landing page with advanced interactions, payments and CMS",
        date: "OCT 17"
    ),
    UpdateData(
        icon: "Card3",
        title: "ProtoPie",
        content:
            "Quickly prototype advanced animations and interactions for mobile and Web.",
        date: "AUG 27"
    ),
    UpdateData(
        icon: "Card4",
        title: "SwiftUI",
        content:
            "Learn how to code custom UIs, animations, gestures and components in Xcode 11",
        date: "JUNE 26"
    ),
    UpdateData(
        icon: "Card5",
        title: "Framer Playground",
        content:
            "Create powerful animations and interactions with the Framer X code editor",
        date: "JUN 11"
    ),
]

// store data, allows for data mutation
class UpdateStore: ObservableObject {
    @Published var updateList: [UpdateData] = updateDataList
}
