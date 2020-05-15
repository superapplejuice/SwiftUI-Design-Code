//
//  CardView.swift
//  DesignCode
//
//  Created by Jan Mathew on 9/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct CertCardComponent: View {
    // receive values from state
    @Binding var show: Bool
    @Binding var view: CGSize
    @Binding var showCard: Bool

    var progress: UserData.CourseProgress

    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("SwiftUI Design")
                        .font(.title)
                        .foregroundColor(Color.white)
                    Text(self.progress.rawValue)
                        .foregroundColor(Color("accent"))
                }
                Spacer()
                Image("Logo1")
            }
            .padding()
            
            Spacer()
            Image("Card1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 110, alignment: .top)
        }
        .frame(width: showCard ? 375 : 340, height: 220.0)
        .background(Color.black)
        .clipShape(
            RoundedRectangle(
                cornerRadius: showCard ? 30 : 20,
                style: .continuous
            )
        )
        .shadow(radius: 20)
        .offset(x: self.view.width, y: self.view.height)
        .offset(y: showCard ? -100 : 0)
        .blendMode(.hardLight)
        /*
         response: lag
         dampingFraction: resistance
         blendDuration: transitions between response and dampingFraction
         */
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
        .onTapGesture {
            self.showCard.toggle()
        }
        .gesture(
            showCard ? nil : DragGesture()
                .onChanged { value in
                    // set drag values to @State
                    self.view = value.translation
                    self.show = true
                }
                .onEnded { _ in
                    self.view = .zero
                    self.show = false
                }
        )
    }
}
