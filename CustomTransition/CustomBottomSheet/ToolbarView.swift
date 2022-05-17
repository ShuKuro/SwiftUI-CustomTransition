//
//  ToolbarView.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/05/14.
//

import SwiftUI

struct ToolbarView: View {
  @Binding var currentHeight: CGFloat
  @Binding var movingOffset: CGFloat

  var body: some View {
    ToolbarButton(icon: "plus", isPlus: true) {
      withAnimation(.spring(dampingFraction: 0.7)) {
        self.currentHeight = 0.0
        self.movingOffset = 0.0
      }
    }
    .padding(.top, 15)
    .padding(.horizontal, 30)
    .frame(minWidth: 0.0, maxWidth: .infinity)
    .offset(y: self.currentHeight == 0  ? -100 : 0)
  }
}

struct ToolbarView_Previews: PreviewProvider {
  static var previews: some View {
    ToolbarView(currentHeight: .constant(0.0), movingOffset: .constant(0.0))
  }
}
