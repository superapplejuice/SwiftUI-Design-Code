//
//  ContentView.swift
//  DesignCode
//
//  Created by Jan Mathew on 7/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

class UserData: ObservableObject {
    enum CourseProgress: String {
        case Started
        case InProgress = "In Progress"
        case Completed
    }

    var name: String
    var progress: CourseProgress

    init(
        name: String,
        progress: CourseProgress
    ) {
        self.name = name
        self.progress = progress
    }
}

struct CoursesView: View {
    @State private var show: Bool = false
    @State private var view: CGSize = .zero
    @State private var showCard: Bool = false
    @State private var bottomDrag: CGSize = .zero
    @State private var showFull: Bool = false

    let backCardWidth: CGFloat = 340

    let userData: UserData = UserData(
        name: "Jan Mathew",
        progress: UserData.CourseProgress.InProgress
    )

    var body: some View {
        ZStack {
            TitleView(
                title: "Courses",
                image: "Background1",
                blur: show ? 20 : 0,
                showCard: $showCard
            )

            BackCardView(
                offsetY: show ? -400 : -40,
                scale: 0.9,
                tilt: show ? 0 : 10,
                rotation: 10,
                bgColor: Color("card4"),
                animation: 0.4,
                showCardOffset: -180,
                width: showCard ? 300 : backCardWidth,
                view: $view,
                showCard: $showCard
            )

            BackCardView(
                offsetY: show ? -200 : -20,
                scale: 0.95,
                tilt: show ? 0 : 5,
                rotation: 5,
                bgColor: Color("card3"),
                animation: 0.25,
                showCardOffset: -140,
                width: backCardWidth,
                view: $view,
                showCard: $showCard
            )

            CardView(
                progress: userData.progress,
                // pass state down to view component
                show: $show,
                view: $view,
                showCard: $showCard
            )
            
            BottomCardView(
                name: userData.name,
                progress: userData.progress,
                show: $show,
                showCard: $showCard,
                bottomDrag: $bottomDrag,
                showFull: $showFull
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
