//
//  BottomSheet.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/06/08.
//

import SwiftUI

struct BottomSheet: View {
  @State var translation: CGSize = .zero

  var body: some View {
    VStack {
      BottomSheetContentView()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.white)
    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    .offset(y: translation.height)
    .gesture(
      DragGesture()
        .onChanged { value in
          translation = value.translation
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
