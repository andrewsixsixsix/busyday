//
//  Font.swift
//  BusyDay
//
//  Created by Andrii Laptiiev on 04.08.2024.
//

import SwiftUI

extension Font {
  static func system(size: CGFloat = 16, type: LatoFont = .regular) -> Font {
    self.custom(type.rawValue, size: size)
  }
}

enum LatoFont: String {
  case bold = "Lato-Bold"
  case regular = "Lato-Regular"
}
