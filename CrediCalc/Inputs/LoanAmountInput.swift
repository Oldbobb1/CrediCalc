import SwiftUI

struct LoanAmountInput: View {
    @ObservedObject var viewModel: CreditCalculatorViewModel

    init(_ viewModel: CreditCalculatorViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack {
            NeumorphicNumberField(
                NSLocalizedString("loanAmount", comment: "loanAmount"),
                $viewModel.result.loanAmount
            )
            CurrencyPicker($viewModel.result.selectedCurrency)
        }
        .neumorphicBackground()
    }
}
