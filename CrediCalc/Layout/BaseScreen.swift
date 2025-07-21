import SwiftUI

struct BaseScreen<Content: View>: View {
    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        ZStack {
            Color("neumorphicFill")
                .ignoresSafeArea()
            ScrollView {
                content()
            }
            .scrollIndicators(.hidden)
            .ignoresSafeArea(.keyboard)
            .hideKeyboardOnTap()
        }
    }
}
