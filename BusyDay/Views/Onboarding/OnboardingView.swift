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
    NavigationStack {
      VStack {
        HStack {
          if showSkipButton {
            NavigationLink {
              WelcomingView()
                .navigationBarBackButtonHidden()
            } label: {
              Text("SKIP")
                .font(.system())
                .foregroundStyle(.gray)
            }
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
            .font(.system())
            .foregroundStyle(.gray)
          }

          Spacer()

          if lastItem {
            NavigationLink { WelcomingView() } label: {
              Text("GET STARTED")
                .font(.system())
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .foregroundStyle(.white)
                .background(.accent)
                .clipShape(RoundedRectangle(cornerRadius: 5.0))
            }
          } else {
            BDButton("NEXT") {
              withAnimation {
                vm.next()
              }
            }
          }
        }
        .padding()
        .transaction { $0.animation = nil }
      }
      .background(.main)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
}

extension OnboardingView {
  var lastItem: Bool {
    vm.isLastItem
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
