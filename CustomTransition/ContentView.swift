//
//  ContentView.swift
//  CustomTransition
//
//  Created by Shuhei Kuroda on 2022/05/01.
//

import SwiftUI

struct ContentView: View {
  @State var showModal = false
  @State var bottomSheetShow = false
  @Namespace var namespace
  @State var material: Material = .ultraThinMaterial

  @State private var currentHeight: CGFloat = 0.0
  @State private var movingOffset: CGFloat = 0.0

  var body: some View {
    NavigationView {
      ZStack {
        LinearGradient(colors: [Color.red, Color.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
          .ignoresSafeArea()

        VStack(spacing: 20) {
          modalButton(material: .ultraThinMaterial)

          NavigationLink(destination: {
            CardsStockView()
          }, label: {
            Text("Cards")
              .font(.body)
              .foregroundColor(.white)
              .frame(width: 250, height: 50)
              .background(Color.purple)
              .cornerRadius(20)
          })

          Button(action: {
            withAnimation {
              bottomSheetShow.toggle()
            }
          }, label: {
            Text("Bottom Sheet")
              .font(.body)
              .foregroundColor(.white)
              .frame(width: 250, height: 50)
              .background(Color.mint)
              .cornerRadius(20)
          })

          Spacer()
        }

        CustomBottomSheet(currentHeight: $currentHeight, movingOffset: $movingOffset)

        if showModal {
          glassModal
        }

        if bottomSheetShow {
          Color.black.opacity(0.3)
            .ignoresSafeArea()
          
          BottomSheet(show: $bottomSheetShow)
            .transition(.move(edge: .bottom))
            .zIndex(1)
        }
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
        .background(Color.cyan)
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
          .frame(width: 200, height: 50)
          .background(.regularMaterial)
          .cornerRadius(20)
      })
    }
    .padding()
    .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height - 300)
    .background(material)
    .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.white, lineWidth: 0.8))
    .cornerRadius(50)
    .shadow(color: .white, radius: 5)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .preferredColorScheme(.light)
      ContentView()
        .preferredColorScheme(.dark)
    }
  }
}

// MARK: -

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
