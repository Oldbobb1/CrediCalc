import SwiftUI

struct LoanTypeTip: View {
    @Binding var tip: Bool

    init(_ tip: Binding<Bool>) {
        self._tip = tip
    }

    var body: some View {
        if tip {
            VStack(spacing: 10) {
                Text("hint")
                    .font(.title2)
                Text("annuit")
                    .font(.caption2)
                Text("differentiat")
                    .font(.caption2)
                Button("buttonText") {
                    withAnimation { tip = false }
                }
                .font(.footnote)
                .padding(.top, 6)
            }
            .frame(width: 300, height: 150)
            .padding()
            .neumorphicBackground()
            .transition(.move(edge: .trailing).combined(with: .opacity))
            .padding()
        }
    }
}
