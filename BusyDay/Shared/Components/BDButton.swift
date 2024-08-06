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
  let disabled: Bool
  let action: () -> Void

  init(_ text: String, size: Size = .compact, style: Style = .filled, disabled: Bool = false, action: @escaping () -> Void) {
    self.text = text
    self.size = size
    self.style = style
    self.disabled = disabled
    self.action = action
  }

  private var baseLabel: some View {
    let maxWidth: CGFloat? = switch size {
    case .compact:
      .none
    case .wide:
      .infinity
    }
    let color: Color = disabled ? .textDisabled : .text

    return Text(text)
      .font(.system())
      .foregroundStyle(color)
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
        filled(disabled)
      case .withBorder:
        withBorder()
      }
    }
    .disabled(disabled)
  }
}

extension BDButton {
  func filled(_ disabled: Bool) -> some View {
    baseLabel
      .background(disabled ? .accent.opacity(0.5) : .accent)
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
  BDButton("BUTTON") {}
}
