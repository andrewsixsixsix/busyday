//
//  BDButton.swift
//  BusyDay
//
//  Created by Andrii Laptiiev on 05.08.2024.
//

import SwiftUI

struct BDButton: View {
  let text: String
  let size: Size
  let style: Style
  let action: () -> Void

  init(_ text: String, size: Size = .compact, style: Style = .filled, action: @escaping () -> Void) {
    self.text = text
    self.size = size
    self.style = style
    self.action = action
  }

  private var baseLabel: some View {
    let maxWidth: CGFloat? = switch size {
    case .compact:
      .none
    case .wide:
      .infinity
    }

    return Text(text.uppercased())
      .font(.system())
      .foregroundStyle(.white)
      .frame(maxWidth: maxWidth)
      .padding(.horizontal, 24)
      .padding(.vertical, 12)
  }

  var body: some View {
    Button {
      action()
    } label: {
      switch style {
      case .filled:
        filled()
      case .withBorder:
        withBorder()
      }
    }
  }
}

extension BDButton {
  func filled() -> some View {
    baseLabel
      .background(.accent)
      .clipShape(RoundedRectangle(cornerRadius: 5.0))
  }

  func withBorder() -> some View {
    baseLabel
      .overlay {
        RoundedRectangle(cornerRadius: 5.0)
          .stroke(lineWidth: 1.0)
          .fill(.accent)
      }
  }
}

extension BDButton {
  enum Size {
    case compact
    case wide
  }

  enum Style {
    case filled
    case withBorder
  }
}

#Preview {
  BDButton("button") {}
}
