import SwiftUI

struct ResultSection: View {
    @ObservedObject var viewModel: CreditCalculatorViewModel

    init(_ viewModel: CreditCalculatorViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        if !viewModel.result.monthlyPayment.isEmpty {
            ResultCard(viewModel)
                .padding(.top, 8)
        }
        Spacer()
    }
}
