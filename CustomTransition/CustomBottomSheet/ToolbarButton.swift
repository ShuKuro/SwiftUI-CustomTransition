//
//  ToolbarButton.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/05/14.
//

import SwiftUI

struct ToolbarButton: View {
  var icon = "bubble.left"
  var isSelected = false
  var isPlus = false
  var action: (() -> ()) = {}

  var body: some View {
    let selectedColor = "orange"

    return Button(action: {
      self.action()
    }) {
      HStack {
        Image(systemName: self.icon)
          .resizable()
          .aspectRatio(1, contentMode: .fit)
          .frame(width: 30, height: 30)
          .foregroundColor(isPlus ? .white: isSelected ? Color(selectedColor) : .gray)
      }
      .padding(10)
      .background(isPlus ? Color("green") : isSelected ? Color(selectedColor).opacity(0.2) : .gray.opacity(0.2))
      .cornerRadius(10)
    }
  }
}

struct ToolbarButton_Previews: PreviewProvider {
  static var previews: some View {
    ToolbarButton()
  }
}
