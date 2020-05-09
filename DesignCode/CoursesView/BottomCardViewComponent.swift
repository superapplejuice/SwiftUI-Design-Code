//
//  BottomCardView.swift
//  DesignCode
//
//  Created by Jan Mathew on 9/5/20.
//  Copyright © 2020 Jan Mathew. All rights reserved.
//

import SwiftUI

struct BottomCardView: View {
    @Binding var show: Bool
    @Binding var showCard: Bool
    @Binding var bottomDrag: CGSize
    @Binding var showFull: Bool
    
    var name: String
    var progress: UserData.CourseProgress
    
    func setBodyText(_ progress: UserData.CourseProgress) -> String {
        switch progress {
        case .Started:
            return "This card is proof that \(name) has officially purchased the course from Design+Code."
        case .InProgress:
            return "This card is proof that \(name) is being taught the above course by a Design+Code instructor."
        case .Completed:
            return "This card is proof that \(name) has completed the above course with approval from a Design+Code instructor."
        }
    }

    init(
        name: String,
        progress: UserData.CourseProgress,
        show: Binding<Bool>,
        showCard: Binding<Bool>,
        bottomDrag: Binding<CGSize>,
        showFull: Binding<Bool>
    ) {
        self.name = name
        self.progress = progress
        
        _show = show
        _showCard = showCard
        _bottomDrag = bottomDrag
        _showFull = showFull
    }
    
    var body: some View {
        // set spacing between each element in the stack
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 40, height: 6)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text(self.setBodyText(self.progress))
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4)
            
            Spacer()
        }
        .padding(.top, 8)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(x: 0, y: showCard ? 360 : 1000)
        .offset(y: bottomDrag.height)
        .blur(radius: show ? 20 : 0)
        .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        .gesture(
            DragGesture().onChanged { value in
                self.bottomDrag = value.translation
                
                if self.showFull {
                    self.bottomDrag.height += -300
                }
                
                // prevent user from dragging the card too high
                if self.bottomDrag.height <= -300 {
                    self.bottomDrag.height = -300
                }
            }
            .onEnded { _ in
                // close bottom card if drag position is low
                if self.bottomDrag.height >= 50 {
                    self.showCard = false
                }
                
                // show full bottom card display
                if (
                    // perform if NOT showFull & dragged to high position
                    self.bottomDrag.height <= -110 && !self.showFull
                ) || (
                    // perform if IS showFull & drag position higher than -250
                    self.bottomDrag.height <= -250 && self.showFull
                ) {
                    self.bottomDrag.height = -300
                    self.showFull = true
                } else {
                    self.bottomDrag = .zero
                    self.showFull = false
                }
            }
        )
    }
}
