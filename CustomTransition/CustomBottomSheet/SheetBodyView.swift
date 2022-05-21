//
//  SheetBodyView.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/05/15.
//

import SwiftUI

struct SheetBodyView: View {
  @Binding var movingOffset: CGFloat
  let screenSize = UIScreen.main.bounds.size
  
  var body: some View {
    let phoneRatio = String(format: "%.3f", screenSize.width / screenSize.height)
    let refRatio = String(format: "%.3f",  9.0 / 16.0)
    let isXorAbove = phoneRatio != refRatio

    return VStack(spacing: 25) {
      Rectangle()
        .frame(width: 80, height: 7)
        .cornerRadius(5)
        .foregroundColor(.gray.opacity(0.5))

      VStack {
        Text("SheetBody")
          .font(.largeTitle)
      }
      Spacer()
    }
    .frame(height: 310)
    .padding(.bottom, isXorAbove ? 60 : 50)
    .padding(.top, 15)
    .offset(y: movingOffset)
  }

  var customButton: some View {
    let screenWidth = screenSize.width

    return Button(action: {

    }, label: {
      HStack {
        Image(systemName: "plus")
          .resizable()
          .frame(width: 15, height: 15)
          .foregroundColor(Color.white)

        Text("Button")
          .foregroundColor(Color.white)
      }.frame(width: screenWidth * 0.7 )
        .padding(.vertical)
        .background(Color("green"))
        .cornerRadius(10)
    })
  }
}

struct SheetBodyView_Previews: PreviewProvider {
    static var previews: some View {
        SheetBodyView(movingOffset: .constant(0.0))
    }
}
