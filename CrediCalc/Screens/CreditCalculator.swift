import SwiftUI

struct CreditCalculator: View {
    @StateObject private var viewModel = CreditCalculatorViewModel()

    var body: some View {
        BaseScreen {
            VStack(spacing: 15) {
                Text("titleApp")
                    .font(.title2.bold())
                LoanAmountInput(viewModel)
                NeumorphicNumberField(
                    NSLocalizedString("bet", comment: "bet"),
                    $viewModel.result.interestRate
                )
                .neumorphicBackground()
                .hideKeyboardButton()
                LoanTermPicker($viewModel.result.loanTerm)
                NeumorphicSegmentedControl($viewModel.result.loanType)
                CalculatorActionButton(viewModel)
                ResultSection(viewModel)
            }
            .padding()
        }
    }
}
