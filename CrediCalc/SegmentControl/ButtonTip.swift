import SwiftUI

struct ButtonTip: View {
    @Binding var showTip: Bool

    init(_ showTip: Binding<Bool>) {
        self._showTip = showTip
    }

    var body: some View {
        Button(action: {
            withAnimation {
                showTip.toggle()
            }
        }) {
            Image(systemName: "questionmark")
                .padding()
                .frame(width: 30, height: 30)
                .neumorphicBackground()
        }
    }
}
