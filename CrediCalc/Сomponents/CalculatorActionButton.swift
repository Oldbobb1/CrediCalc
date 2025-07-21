import SwiftUI

struct CalculatorActionLabel: View {
    let text: CalculatorAction

    private var label: String { text.localiz }

    init(_ text: CalculatorAction) {
        self.text = text
    }

    var body: some View {
        Text(label)
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .neumorphicBackground()
    }
}

struct CalculatorActionButton: View {
    @ObservedObject var viewModel: CreditCalculatorViewModel

    init(_ viewModel: CreditCalculatorViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Button(action: {
            withAnimation {
                if viewModel.result.hasCalculated {
                    viewModel.resetResults()
                } else {
                    viewModel.calculate()
                }
            }
        }) {
            CalculatorActionLabel(
                viewModel.result.hasCalculated ? .clear : .calculate
            )
        }
        .padding(.top)
    }
}
