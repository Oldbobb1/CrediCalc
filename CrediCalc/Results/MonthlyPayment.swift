import SwiftUI

struct MonthlyPayment: View {
    @ObservedObject var viewModel: CreditCalculatorViewModel

    init(_ viewModel: CreditCalculatorViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(spacing: 5) {
            Text("monthPayment")
                .frame(alignment: .center)
            Text(viewModel.result.monthlyPayment)
                .frame(alignment: .center)
        }
    }
}
