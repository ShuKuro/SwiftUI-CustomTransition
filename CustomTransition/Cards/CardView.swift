//
//  CardView.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/06/02.
//

import SwiftUI

struct CardView: View {
  var title = "Card Name"
  var cardNumber = "1234 5678 9012 3456"
  var name = "John Smith"
  var limit = "07/24"
  var background = Color.black
  
  var body: some View {
    VStack() {
      HStack {
        Text(title)
          .font(.largeTitle)
          .fontWeight(.bold)
          .foregroundColor(.white)
        Spacer()
      }
      .padding(20)
      .padding(.bottom, 20)

      Text(cardNumber)
        .font(.title)
        .foregroundColor(.white)
        .padding(10)

      Text(limit)
        .font(.title2)
        .foregroundColor(.white)

      HStack {
        Text(name)
          .font(.title2)
          .foregroundColor(.white)
        Spacer()
      }
      .padding([.leading, .bottom], 20)

    }
    .background(background)
    .cornerRadius(10)
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView()
      .previewLayout(.sizeThatFits)
  }
}
