import SwiftUI

struct ResultCard: View {
    @ObservedObject var viewModel: CreditCalculatorViewModel

    init(_ viewModel: CreditCalculatorViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            CalculationDisclaimer()
            MonthlyPayment(viewModel)
                .padding(5)
            VStack(alignment: .leading, spacing: 10) {
                ResultRow(
                    NSLocalizedString("loanAmount", comment: "loanAmount"),
                    viewModel.result.formatedLoanAmount
                )
                ResultRow(
                    NSLocalizedString("overpayment", comment: "overpayment"),
                    viewModel.result.overpayment
                )
                ResultRow(
                    NSLocalizedString("totalPayment", comment: "totalPayment"),
                    viewModel.result.totalPayment
                )
                ResultRow(
                    NSLocalizedString(
                        "overpaymentPercentage",
                        comment: "overpaymentPercentage"
                    ),
                    viewModel.result.overpaymentPercentage
                )
            }
        }
        .padding()
        .neumorphicBackground()
    }
}
