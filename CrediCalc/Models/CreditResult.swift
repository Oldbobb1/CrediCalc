import SwiftUI

struct CreditResult {
    var loanAmount: String = ""
    var formatedLoanAmount: String = ""
    var interestRate: String = ""
    var loanTerm: LoanTerm = .m3
    var loanType: LoanType = .annuity
    var monthlyPayment: String = ""
    var totalPayment: String = ""
    var overpayment: String = ""
    var overpaymentPercentage: String = ""
    var differentiated: [String] = []
    var selectedCurrency: Currency = .USD
    var hasCalculated: Bool = false
}
