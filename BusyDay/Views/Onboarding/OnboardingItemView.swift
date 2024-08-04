//
//  OnboardingItemView.swift
//  BusyDay
//
//  Created by Andrii Laptiiev on 03.08.2024.
//

import SwiftUI

struct OnboardingItemView: View {
  let item: OnboardingItem

  var body: some View {
    VStack(alignment: .center, spacing: 36) {
      Image(item.image)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .padding(.horizontal, 60)

      HStack {
        ForEach(0..<3) {
          RoundedRectangle(cornerRadius: 4.0)
            .fill($0 == item.id ? .text : .gray)
            .frame(maxWidth: 28, maxHeight: 4)
        }
      }

      Text(item.title)
        .font(.system(size: 32, type: .bold))
        .foregroundStyle(.text)

      Text(item.description)
        .font(.system(size: 16))
        .foregroundStyle(.text)
        .multilineTextAlignment(.center)
    }
  }
}

#Preview {
  OnboardingItemView(item: OnboardingItem.items[0])
    .background(.main)
}
