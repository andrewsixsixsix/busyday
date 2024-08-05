//
//  WelcomingView.swift
//  BusyDay
//
//  Created by Andrii Laptiiev on 04.08.2024.
//

import SwiftUI

struct WelcomingView: View {
  @Environment(\.dismiss)
  private var dismiss

  var body: some View {
    VStack(spacing: 64) {
      HStack {
        Button {
          dismiss()
        } label: {
          Image(systemName: "chevron.left")
            .imageScale(.large)
            .foregroundStyle(.white)
        }
        Spacer()
      }

      VStack(spacing: 24) {
        Text("Welcome to BusyDay")
          .font(.system(size: 32.0, type: .bold))
          .foregroundStyle(.text)

        Text("Please login to your account or create\nnew account to continue")
          .font(.system())
          .foregroundStyle(.gray)
          .multilineTextAlignment(.center)
      }

      Spacer()

      VStack(spacing: 24) {
        BDButton("login", size: .wide) {}
        BDButton("create account", size: .wide, style: .withBorder) {}
      }
      .foregroundStyle(.white)
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.main)
  }
}

#Preview {
  WelcomingView()
}
