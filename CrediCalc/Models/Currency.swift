import SwiftUI

enum Currency: String, CaseIterable, Identifiable {
    case USD, EUR, RUB, BYN

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .USD: return "$"
        case .EUR: return "€"
        case .RUB: return "₽"
        case .BYN: return "BYN"
        }
    }
}
