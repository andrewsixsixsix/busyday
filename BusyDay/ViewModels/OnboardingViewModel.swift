//
//  OnboardingViewModel.swift
//  BusyDay
//
//  Created by Andrii Laptiiev on 03.08.2024.
//

import Foundation

extension OnboardingView {
  @Observable
  class ViewModel: ObservableObject {
    let onboardingItems = OnboardingItem.items
    var itemIndex: Int? = 0

    var lastIndex: Int {
      OnboardingItem.items.count - 1
    }

    var isFirstItem: Bool {
      guard let itemIndex else { return false }
      return itemIndex == 0
    }

    var isLastItem: Bool {
      guard let itemIndex else { return true }
      return itemIndex == lastIndex
    }

    func next() {
      guard let index = itemIndex else { return }
      guard index < lastIndex else { return }
      itemIndex = index + 1
    }

    func prev() {
      guard let index = itemIndex else { return }
      guard index >= 1 else { return }
      itemIndex = index - 1
    }
  }
}
