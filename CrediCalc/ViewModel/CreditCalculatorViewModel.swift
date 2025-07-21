import SwiftUI

final class CreditCalculatorViewModel: ObservableObject {
    @Published var result = CreditResult()

    func calculate() {
        guard let principal = FormatterHelper.parseCurrency(result.loanAmount),
            let rate = FormatterHelper.parsePercentage(result.interestRate),
            principal > 0, rate > 0
        else {
            resetResults()
            return
        }
        let months = result.loanTerm.rawValue
        switch result.loanType {
        case .annuity:
            calculateAnnuity(principal: principal, rate: rate, months: months)
        case .differentiated:
            calculateDifferentiated(
                principal: principal,
                rate: rate,
                months: months
            )
        }
        result.hasCalculated = true
    }

    private func calculateAnnuity(principal: Double, rate: Double, months: Int) {
        let monthlyRate = rate / 100 / 12
        let payment = principal * (monthlyRate / (1 - pow(1 + monthlyRate, -Double(months))))
        let total = payment * Double(months)
        let extra = total - principal
        let percent = extra / principal * 100
        result.formatedLoanAmount = FormatterHelper.formatCurrency(
            principal,
            result.selectedCurrency
        )
        result.monthlyPayment = FormatterHelper.formatCurrency(
            payment,
            result.selectedCurrency
        )
        result.totalPayment = FormatterHelper.formatCurrency(
            total,
            result.selectedCurrency
        )
        result.overpayment = FormatterHelper.formatCurrency(
            extra,
            result.selectedCurrency
        )
        result.overpaymentPercentage = FormatterHelper.formatPercent(percent)
        result.differentiated = []
    }

    private func calculateDifferentiated(
        principal: Double,
        rate: Double,
        months: Int
    ) {
        let monthlyRate = rate / 100 / 12
        let principalPart = principal / Double(months)
        let payments = (0..<months).map { month -> Double in
            let remainingPrincipal = principal - principalPart * Double(month)
            let interest = remainingPrincipal * monthlyRate
            return principalPart + interest
        }
        result.differentiated = payments.map {
            FormatterHelper.formatCurrency($0, result.selectedCurrency)
        }
        result.monthlyPayment = FormatterHelper.formatPaymentRange(
            payments,
            result.selectedCurrency
        )
        let total = payments.reduce(0, +)
        let extra = total - principal
        let percent = extra / principal * 100
        result.formatedLoanAmount = FormatterHelper.formatCurrency(
            principal,
            result.selectedCurrency
        )
        result.totalPayment = FormatterHelper.formatCurrency(
            total,
            result.selectedCurrency
        )
        result.overpayment = FormatterHelper.formatCurrency(
            extra,
            result.selectedCurrency
        )
        result.overpaymentPercentage = FormatterHelper.formatPercent(percent)
    }

    func resetResults() {
        result = CreditResult()
    }
}
