import SwiftUI

struct FormatterHelper {
    static let percentFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        formatter.multiplier = 1
        return formatter
    }()

    static func formatNumber(_ input: String) -> String {
        let clean = input.replacingOccurrences(of: " ", with: "")
        guard let number = Double(clean) else { return input }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = ","
        formatter.minimumFractionDigits = 0
        return formatter.string(from: NSNumber(value: number)) ?? input
    }

    static func parseCurrency(_ input: String) -> Double? {
        let clean = input.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: ",", with: ".")
        return Double(clean)
    }

    static func parsePercentage(_ input: String) -> Double? {
        parseCurrency(input)
    }

    static func formatCurrency(_ value: Double, _ currency: Currency) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currency.rawValue
        formatter.currencySymbol = currency.symbol + " "
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = ","
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }

    static func formatPercent(_ value: Double) -> String {
        percentFormatter.string(from: NSNumber(value: value)) ?? "\(value) %"
    }

    static func formatPaymentRange(_ payments: [Double], _ currency: Currency) -> String {
        guard let max = payments.first, let min = payments.last else { return "" }
        return "\(formatCurrency(max, currency)) → \(formatCurrency(min, currency))"
    }
}
