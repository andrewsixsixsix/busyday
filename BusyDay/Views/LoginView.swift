//
//  LoginView.swift
//  BusyDay
//
//  Created by Andrii Laptiiev on 05.08.2024.
//

import SwiftUI

struct LoginView: View {
  @StateObject private var vm = ViewModel()

  private var loginDisabled: Bool {
    vm.credentials.username.isEmpty || vm.credentials.password.isEmpty
  }

  var body: some View {
    NavigationStack {
      VStack {
        HStack {
          Text("Login")
            .font(.system(size: 32, type: .bold))
            .foregroundStyle(.white)

          Spacer()
        }
        .padding(.top, 36)

        VStack(alignment: .leading) {
          Text("Username")
            .font(.system())
            .foregroundStyle(.text)

          TextField(
            "username",
            text: $vm.credentials.username,
            prompt: Text("Enter your username").foregroundColor(.gray.opacity(0.8)))
          .padding(.horizontal, 12)
          .padding(.vertical, 16)
          .background(.grayDark)
          .clipShape(RoundedRectangle(cornerRadius: 5.0))
          .overlay { RoundedRectangle(cornerRadius: 5.0).stroke(.gray) }

          Text("Password")
            .font(.system())
            .foregroundStyle(.text)
            .padding(.top, 24)

          SecureField(
            "password",
            text: $vm.credentials.password,
            prompt: Text("• • • • • • • • • •")
              .font(.system())
              .foregroundColor(.gray.opacity(0.8)))
          .padding(.horizontal, 12)
          .padding(.vertical, 16)
          .background(.grayDark)
          .clipShape(RoundedRectangle(cornerRadius: 5.0))
          .overlay { RoundedRectangle(cornerRadius: 5.0).stroke(.gray) }
        }
        .foregroundStyle(.white)
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
        .padding(.vertical, 60)

        BDButton("Login", size: .wide, disabled: loginDisabled) {}

        ZStack {
          Divider()
            .frame(height: 1)
            .background(.gray)

          Text("or")
            .font(.system())
            .foregroundStyle(.gray)
            .padding(.bottom, 4)
            .padding(.horizontal, 4)
            .background(.main)
        }
        .padding(.vertical, 28)

        VStack(spacing: 24) {
          Button(action: {}) {
            Label {
              Text("Login with Google")
            } icon: {
              Image("GoogleLogo")
                .resizable()
                .frame(width: 24, height: 24, alignment: .center)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .overlay { RoundedRectangle(cornerRadius: 5.0).stroke(.accent) }
          }

          Button(action: {}) {
            Label("Login with Apple", systemImage: "apple.logo")
              .imageScale(.medium)
              .frame(maxWidth: .infinity)
              .padding(.vertical, 12)
              .overlay { RoundedRectangle(cornerRadius: 5.0).stroke(.accent) }
          }
        }
        .font(.system())
        .foregroundStyle(.white)

        Spacer()

        HStack(spacing: 0) {
          Text("Don't have an account? ")
            .foregroundStyle(.gray)

          Button(action: {}) {
            Text("Sign up")
              .foregroundStyle(.white)
          }
        }
        .font(.system(size: 12))
      }
      .padding()
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(.main)
      .navigationBarBackButtonHidden()
    }
  }
}

#Preview {
  LoginView()
}
