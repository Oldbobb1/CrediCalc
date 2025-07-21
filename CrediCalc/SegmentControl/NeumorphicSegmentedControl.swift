import SwiftUI

struct NeumorphicSegmentedControl: View {
    @Binding var selection: LoanType
    @Namespace private var animation
    @State private var showTip = false

    init(_ selection: Binding<LoanType>) {
        self._selection = selection
    }

    var body: some View {
        HStack {
            ForEach(LoanType.allCases, id: \.self) { type in
                NeumorphicSegmentItem(
                    selection: $selection,
                    loanType: type,
                    animation: animation
                )
            }
            ButtonTip($showTip)
        }
        .overlay(alignment: .bottom) {
            LoanTypeTip($showTip)
        }
    }
}
