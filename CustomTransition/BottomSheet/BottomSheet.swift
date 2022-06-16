//
//  BottomSheet.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/06/08.
//

import SwiftUI

struct BottomSheet: View {
  @State var translation: CGSize = .zero
  @State var offsetY: CGFloat = 0

  var body: some View {
    VStack {
      BottomSheetContentView()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.white)
    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    .offset(y: translation.height + offsetY)
    .gesture(
      DragGesture()
        .onChanged { value in
          translation = value.translation
        }
        .onEnded { value in
          withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7)) {
            let snap = translation.height + offsetY

            if snap > 100 {
              offsetY = 400
            } else {
              offsetY = 0
            }

            translation = .zero
          }
        }
    )
    .ignoresSafeArea(edges: .bottom)
  }
}

struct BottomSheet_Previews: PreviewProvider {
  static var previews: some View {
    BottomSheet()
      .background(.blue)
  }
}
