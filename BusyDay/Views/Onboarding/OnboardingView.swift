//
//  OnboardingView.swift
//  BusyDay
//
//  Created by Andrii Laptiiev on 03.08.2024.
//

import SwiftUI

struct OnboardingView: View {
  @State var vm = ViewModel()

  var body: some View {
    VStack {
      HStack {
        if showSkipButton {
          Button("SKIP") {}
            .foregroundStyle(.gray)
        }

        Spacer()
      }
      .frame(minHeight: 20)
      .padding()
      .transaction { $0.animation = nil }

      ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .top, spacing: 0) {
          ForEach(vm.onboardingItems, id: \.id) { item in
            OnboardingItemView(item: item)
              .containerRelativeFrame(.horizontal, alignment: .center)
          }
        }
      }
      .scrollTargetLayout()
      .scrollTargetBehavior(.paging)
      .scrollPosition(id: $vm.itemIndex, anchor: .center)

      Spacer()

      HStack {
        if showBackButton {
          Button("BACK") {
            withAnimation(.smooth) {
              vm.prev()
            }
          }
          .foregroundStyle(.gray)
        }

        Spacer()

        Button(action: { withAnimation { vm.next() } }) {
          Text("\(nextButtonText)")
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .foregroundStyle(.white)
            .background(.accent)
            .clipShape(RoundedRectangle(cornerRadius: 5.0))
        }
      }
      .padding()
      .transaction { $0.animation = nil }
    }
    .background(.main)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

extension OnboardingView {
  var nextButtonText: String {
    vm.isLastItem ? "GET STARTED" : "NEXT"
  }

  var showBackButton: Bool {
    !vm.isFirstItem
  }

  var showSkipButton: Bool {
    !vm.isLastItem
  }
}

#Preview {
  OnboardingView()
}
