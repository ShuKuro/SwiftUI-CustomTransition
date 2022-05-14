//
//  CustomBottomSheet.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/05/12.
//

import SwiftUI

struct CustomBottomSheet: View {
  @Binding var currentHeight: CGFloat
  @Binding var movingOffset: CGFloat

    var body: some View {
      CustomSheet(currentHeight: $currentHeight, movingOffset: $movingOffset, smallHeight: 300, onDragEnd: {position in
        // DO somethings on drag end
      }) {
        ZStack(alignment: .top) {
          Text("Sheet")
            .font(.largeTitle)
          ToolbarView(currentHeight: self.$currentHeight, movingOffset: self.$movingOffset)
        }
        .background(Color.white)
        .clipShape(RoundedShape())
        .shadow(color: Color.gray.opacity(0.2), radius: 6, x: 0.0, y: -5)
      }
    }
}

struct CustomBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
      CustomBottomSheet(currentHeight: .constant(0.0), movingOffset: .constant(0.0))
    }
}
