//
//  MatchedView.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/05/02.
//

import SwiftUI

struct MatchedView: View {
  @Namespace var namespace
  @State var show = false

  var body: some View {
    ZStack {
      if !show {
        VStack(alignment: .leading, spacing: 12) {
          Spacer()
          Text("SwiftUI")
            .font(.largeTitle.weight(.bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .matchedGeometryEffect(id: "title", in: namespace)
          Text("20 sections - 3 hours ".uppercased())
            .font(.footnote.weight(.semibold))
            .matchedGeometryEffect(id: "subtitle", in: namespace)
          Text("Build an iOS app for iOS15 with custom layouts, animations and ...")
            .font(.footnote)
            .matchedGeometryEffect(id: "text", in: namespace)
         }
        .padding(20)
        .foregroundStyle(.white)
        .background(
          Image("illustration")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .matchedGeometryEffect(id: "image", in: namespace)
        )
        .background(
          Image("background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask(
          RoundedRectangle(cornerRadius: 30, style: .continuous)
            .matchedGeometryEffect(id: "mask", in: namespace)
        )
        .frame(height: 300)
        .padding(20)
      } else {
        ScrollView {
          VStack(alignment: .leading, spacing: 12) {
            Spacer()
            Text("Build an iOS app for iOS15 with custom layouts, animations and ...")
              .font(.footnote)
              .matchedGeometryEffect(id: "text", in: namespace)
            Text("20 sections - 3 hours ".uppercased())
              .font(.footnote.weight(.semibold))
              .matchedGeometryEffect(id: "subtitle", in: namespace)
            Text("SwiftUI")
              .font(.largeTitle.weight(.bold))
              .frame(maxWidth: .infinity, alignment: .leading)
              .matchedGeometryEffect(id: "title", in: namespace)
           }
          .frame(height: 500)
          .padding(20)
          .foregroundStyle(.black)
          .background(
            Image("illustration")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .matchedGeometryEffect(id: "image", in: namespace)
          )
          .background(
            Image("background")
              .resizable()
              .aspectRatio(contentMode: .fill)
              .matchedGeometryEffect(id: "background", in: namespace)
          )
          .mask(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
              .matchedGeometryEffect(id: "mask", in: namespace)
        )
        }
      }
    }
    .onTapGesture {
      withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
        show.toggle()
      }

    }
  }
}

struct MatchedView_Previews: PreviewProvider {
  static var previews: some View {
    MatchedView()
  }
}
