//
//  CourseView.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/05/06.
//

import SwiftUI

struct CourseView: View {
  var namespace: Namespace.ID
  @Binding var show: Bool

  var body: some View {
    ZStack {
      ScrollView {
        cover
      }
      .background(Color("background"))
      .ignoresSafeArea()

      Button {
        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
          show.toggle()
        }
      } label: {
        Image(systemName: "xmark")
          .font(.body.weight(.bold))
          .foregroundColor(.secondary)
          .padding(8)
          .background(.ultraThinMaterial, in: Circle())
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
      .padding(20)
    }
  }
  var cover: some View {
    VStack {
      Spacer()
    }
    .frame(maxWidth: .infinity)
    .frame(height: 500)
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
    .overlay(
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
        Divider()
        HStack {
          Image(systemName: "star")
          Text("Star")
        }
      }
        .padding(20)
        .background(
          Rectangle()
            .fill(.ultraThinMaterial)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .matchedGeometryEffect(id: "Blur", in: namespace)
        )
        .offset(y: 250)
        .padding(20)
    )
  }
}

struct CourseView_Previews: PreviewProvider {
  @Namespace static var namespace

  static var previews: some View {
    CourseView(namespace: namespace, show: .constant(true))
  }
}
