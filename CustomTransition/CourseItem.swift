//
//  CourseItem.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/05/06.
//

import SwiftUI

struct CourseItem: View {
  var namespace: Namespace.ID
  @Binding var show: Bool

  var body: some View {
    VStack {
      Spacer()
      VStack(alignment: .leading, spacing: 12) {
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
      .background(
        Rectangle()
          .fill(.ultraThinMaterial)
          .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
          .blur(radius: 30)
          .matchedGeometryEffect(id: "Blur", in: namespace)
      )
     }
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
    .frame(height: 500)
    .padding(20)
  }
}

struct CourseItem_Previews: PreviewProvider {
  @Namespace static var namespace
  static var previews: some View {
    CourseItem(namespace: namespace, show: .constant(true))
  }
}
