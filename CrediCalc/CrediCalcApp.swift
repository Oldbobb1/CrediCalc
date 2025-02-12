import SwiftUI

@main
struct CrediCalcApp: App {
    @State private var showLaunchScreen = true
    
    var body: some Scene {
        WindowGroup {
            if showLaunchScreen {
                LaunchScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            showLaunchScreen = false
                        }
                    }
            } else {
                ContentView()
            }
        }
    }
}
