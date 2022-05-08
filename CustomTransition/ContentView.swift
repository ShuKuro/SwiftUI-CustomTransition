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
  @State var material: Material = .ultraThinMaterial

  var body: some View {
    ZStack {
      LinearGradient(colors: [Color.red, Color.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea()

      VStack(spacing: 20) {
        modalButton(material: .ultraThinMaterial)
        modalButton(material: .thinMaterial)
        modalButton(material: .regularMaterial)
        modalButton(material: .thickMaterial)
        modalButton(material: .ultraThickMaterial)
      }

      if showModal {
        glassModal
      }
    }
  }

  func modalButton(material: Material) -> some View {
    Button(action: {
      withAnimation(.easeOut(duration: 0.2)) {
        self.material = material
        showModal.toggle()
      }
    }, label: {
      Text("Show Glass Modal")
        .font(.body)
        .foregroundColor(.black)
        .frame(width: 250, height: 50)
        .background(Color.cyan.opacity(0.5))
        .cornerRadius(20)
    })
  }

  var glassModal: some View {
    VStack{
      Spacer()
      Text("Material")
        .font(.largeTitle)
      Spacer()
      Button(action: {
        showModal.toggle()
        self.material = material
      }, label: {
        Text("Close")
          .font(.title)
          .foregroundColor(.black)
          .frame(width: 200, height: 50)
          .background(.regularMaterial)
          .cornerRadius(20)
      })
    }
    .padding()
    .foregroundStyle(.black)
    .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height - 300)
    .background(material)
    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.white, lineWidth: 0.8))
    .cornerRadius(50)
    .shadow(color: .white, radius: 5)
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
      .frame(width: UIScreen.main.bounds.width - 50, height: 50)
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
