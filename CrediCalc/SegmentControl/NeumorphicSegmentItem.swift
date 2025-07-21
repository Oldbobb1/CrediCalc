import SwiftUI

struct NeumorphicSegmentItem: View {
    @Binding var selection: LoanType
    let loanType: LoanType
    let animation: Namespace.ID

    private var isSelected: Bool { selection == loanType }
    private var label: String { loanType.localized }

    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                selection = loanType
            }
        }) {
            ZStack {
                if isSelected {
                    NeumorphicSegmentBackground(animation)
                }
                Text(label)
                    .font(.caption2)
                    .foregroundStyle(
                        selection == loanType ? .primary : .secondary
                    )
                    .scaleEffect(selection == loanType ? 1.5 : 0.7)
                    .animation(
                        .spring(response: 0.5, dampingFraction: 0.7),
                        value: selection
                    )
            }
        }
    }
}
