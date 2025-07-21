import SwiftUI

struct LoanTermPicker: View {
    @Binding var type: LoanTerm

    init(_ type: Binding<LoanTerm>) {
        self._type = type
    }

    var body: some View {
        Picker("LoanTerm", selection: $type) {
            ForEach(LoanTerm.allCases) { type in
                Text(type.displayName).tag(type)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .frame(height: 50)
        .neumorphicBackground()
    }
}
