//
//  HomeView.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/05/06.
//

import SwiftUI

struct HomeView: View {
  @State var hasScrolled = false
  @Namespace var namespace
  @State var show = false

  var body: some View {
    ZStack {
      Color("background").ignoresSafeArea()

      ScrollView {
        Text("Courses".uppercased())
          .font(.footnote.weight(.semibold))
          .foregroundColor(.secondary)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal, 20)
        
        if !show {
          CourseItem(namespace: namespace, show: $show)
            .onTapGesture {
              withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                show.toggle()
              }
            }
        }

      }
      .coordinateSpace(name: "scroll")
      .safeAreaInset(edge: .top, content: {
        Color.clear.frame(height: 70)
      })

      if show {
        CourseView(namespace: namespace, show: $show)
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
