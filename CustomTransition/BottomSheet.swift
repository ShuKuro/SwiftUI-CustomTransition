//
//  BottomSheet.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/06/08.
//

import SwiftUI

struct BottomSheet: View {
    var body: some View {
      VStack {
        Text("Cards")
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(.white)
      .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
      .ignoresSafeArea(edges: .bottom)
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet()
        .background(.blue)
    }
}
