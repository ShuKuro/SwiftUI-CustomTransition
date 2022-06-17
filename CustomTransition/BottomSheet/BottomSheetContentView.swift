//
//  BottomSheetContentView.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/06/14.
//

import SwiftUI

struct BottomSheetContentView: View {
  var body: some View {
    VStack {
      RoundedRectangle(cornerRadius: 3, style: .continuous)
        .frame(width: 40, height: 5)
        .padding(8)

      Text("Bottom Sheet")
        .font(.largeTitle)
        .bold()
        .padding(.bottom)

      Button(action: {

      }, label: {
        Label("Add", systemImage: "plus.circle.fill")
          .font(.body.bold())
          .foregroundColor(.white)
          .padding(8)
          .padding(.horizontal, 8)
      })
      .background(Color.purple)
      .cornerRadius(30)
      .padding(.top, 20)

      Spacer()
    }
  }
}

struct BottomSheetContentView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetContentView()
    }
}
