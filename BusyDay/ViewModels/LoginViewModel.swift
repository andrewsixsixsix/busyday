//
//  LoginViewModel.swift
//  BusyDay
//
//  Created by Andrii Laptiiev on 07.08.2024.
//

import Foundation

extension LoginView {
  @Observable
  class ViewModel: ObservableObject {
    var credentials = LoginCredentials()
  }
}
