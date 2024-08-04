//
//  OnboardingItem.swift
//  BusyDay
//
//  Created by Andrii Laptiiev on 03.08.2024.
//

import Foundation

struct OnboardingItem: Identifiable {
  let id: Int
  let image: String
  let title: String
  let description: String
}

extension OnboardingItem {
  static let items = [
    OnboardingItem(
      id: 0,
      image: "OnboardingOne",
      title: "Manage your tasks",
      description: "You can easily manage all of your daily\ntasks in BusyDay for free"),
    OnboardingItem(
      id: 1,
      image: "OnboardingTwo",
      title: "Create daily routine",
      description: "In BusyDay you can create your\npersonalized routine to stay productive"),
    OnboardingItem(
      id: 2,
      image: "OnboardingThree",
      title: "Organize your tasks",
      description: "You can organize your daily tasks by\nadding your tasks into separate categories")
  ]
}
