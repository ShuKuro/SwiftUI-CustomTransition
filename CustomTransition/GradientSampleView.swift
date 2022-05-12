//
//  GradientSampleView.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/05/08.
//

import SwiftUI

struct GradientSampleView: View {
    var body: some View {
      ZStack{
        LinearGradient(colors: [Color.cyan, Color.purple],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
          .ignoresSafeArea()

        VStack{
          Text("Material")
            .font(.largeTitle)
        }
        .foregroundStyle(.black)
        .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height - 300)
        .background(.ultraThinMaterial)
        .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.white, lineWidth: 0.8))
        .cornerRadius(50)
        .shadow(color: .white, radius: 5)

      }
    }
}

struct GradientSampleView_Previews: PreviewProvider {
    static var previews: some View {
        GradientSampleView()
    }
}
