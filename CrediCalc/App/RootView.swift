import SwiftUI

struct RootView: View {
    @State private var showLaunchScreen = true

    var body: some View {
        if showLaunchScreen {
            LaunchScreen()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                        showLaunchScreen = false
                    }
                }
        } else {
            CreditCalculator()
        }
    }
}
