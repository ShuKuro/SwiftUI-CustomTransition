//
//  CardsStockView.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/06/02.
//

import SwiftUI

let screen = UIScreen.main.bounds

struct CardsStockView: View {
  @State var show = false
  @State var viewState = CGSize.zero

  var body: some View {
    ZStack() {
      CardView(title: "UI Design", cardNumber: "0000 0000 0000 0000 ", name: "Certificates", limit: "07/24", background: .pink)
        .frame(width: 340.0, height: 220)
        .shadow(radius: 20)
        .offset(x: 0, y: show ? -400 : -40)
        .scaleEffect(0.85)
        .rotationEffect(Angle(degrees: show ? 15 : 0))
        .blendMode(.hardLight)
        .offset(x: viewState.width, y: viewState.height)
        .animation(.easeInOut(duration: 0.3), value: show)
        .animation(.easeInOut(duration: 0.3), value: viewState)

      CardView(title: "UI Design", cardNumber: "0000 0000 0000 0000 ", name: "Certificates", limit: "07/24", background: .purple)
        .frame(width: 340.0, height: 220)
        .shadow(radius: 20)
        .offset(x: 0, y: show ? -200 : -20)
        .scaleEffect(0.90)
        .rotationEffect(Angle(degrees: show ? 10 : 0))
//        .blendMode(.hardLight)
        .offset(x: viewState.width, y: viewState.height)
        .animation(.easeInOut(duration: 0.2), value: show)
        .animation(.easeInOut(duration: 0.2), value: viewState)

      CardView(title: "UI Design", cardNumber: "0000 0000 0000 0000 ", name: "Certificates", limit: "07/24", background: .cyan)
        .frame(width: 340.0, height: 220)
        .shadow(radius: 20)
        .scaleEffect(0.95)
        .rotationEffect(Angle(degrees: show ? 5 : 0))
        .blendMode(.hardLight)
        .offset(x: viewState.width, y: viewState.height)
        .animation(.spring(), value: show)
        .animation(.spring(), value: viewState)
        .onTapGesture {
          self.show.toggle()
        }
        .gesture(
          DragGesture()
            .onChanged { value in
              self.viewState = value.translation
              self.show = true
            }
            .onEnded { value in
              self.viewState = .zero
              self.show = false
            }
        )
    }
    .frame(minWidth: 0, maxWidth: 712, minHeight: 0, maxHeight: screen.height)
  }
}

struct CardsStockView_Previews: PreviewProvider {
  static var previews: some View {
    CardsStockView()
  }
}
