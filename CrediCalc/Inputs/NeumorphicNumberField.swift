import SwiftUI

struct NeumorphicNumberField: View {
    let placeholder: String
    @Binding var text: String

    init(_ placeholder: String, _ text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }

    var body: some View {
        TextField(placeholder, text: $text)
            .keyboardType(.decimalPad)
            .onChange(of: text) { _, newValue in
                text = FormatterHelper.formatNumber(newValue)
            }
            .font(.system(.body, design: .rounded).monospacedDigit())
            .padding()
    }
}
