//
//  ContentView.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/05/01.
//

import SwiftUI

struct ContentView: View {
  @State var showModal = false
  @Namespace var namespace

  var body: some View {
    ZStack {
      LinearGradient(colors: [Color.red, Color.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea()

      Button(action: {
        withAnimation(.easeOut(duration: 0.2)) {
          showModal.toggle()
        }
      }, label: {
        Text("Show Glass Modal")
          .font(.largeTitle)
          .foregroundColor(.black)
      })

      if showModal {
        glassModal
      }
    }
  }

  var glassModal: some View {
    VStack{
      Text("ultraThinMaterial")
        .modalRow(material: .ultraThinMaterial)
      Text("thinMaterial")
        .modalRow(material: .thinMaterial)
      Text("regularMaterial")
        .modalRow(material: .regularMaterial)
      Text("thickMaterial")
        .modalRow(material: .thickMaterial)
      Text("thickMaterial")
        .modalRow(material: .ultraThickMaterial)

      Spacer()

      Button(action: {
        showModal.toggle()
      }, label: {
        Text("Close")
          .font(.largeTitle)
          .frame(width: 200, height: 50)
          .background(.regularMaterial)
          .cornerRadius(20)
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct ModalRowModifier: ViewModifier {
  var material: Material
  init(material: Material) {
    self.material = material
  }

  func body(content: Content) -> some View {
    content
      .font(.title3)
      .padding(30)
      .foregroundStyle(.black)
      .frame(width: UIScreen.main.bounds.width - 50, height: 30)
      .background(material)
      .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.white, lineWidth: 0.8))
      .cornerRadius(50)
      .shadow(color: .white, radius: 5)
      .padding(.bottom, 30)
  }
}

extension View {
  func modalRow(material: Material) -> some View {
    self.modifier(ModalRowModifier(material: material))
  }
}
