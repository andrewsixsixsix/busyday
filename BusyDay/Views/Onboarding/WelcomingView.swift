//
//  WelcomingView.swift
//  BusyDay
//
//  Created by Andrii Laptiiev on 04.08.2024.
//

import SwiftUI

struct WelcomingView: View {
  var body: some View {
    VStack(spacing: 64) {
      HStack {
        Button(action: {}) {
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
        Button(action: {}) {
          Text("LOGIN")
            .font(.system())
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(.accent)
            .clipShape(RoundedRectangle(cornerRadius: 5.0))
        }

        Button(action: {}) {
          Text("CREATE ACCOUNT")
            .font(.system())
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .overlay {
              RoundedRectangle(cornerRadius: 5.0)
                .stroke(lineWidth: 1.0)
                .fill(.accent)
            }
        }
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
