import SwiftUI

enum LoanTerm: Int, CaseIterable, Identifiable {
    case m3 = 3
    case m6 = 6
    case m9 = 9
    case m18 = 18
    case y1 = 12
    case y2 = 24
    case y3 = 36
    case y4 = 48
    case y5 = 60
    case y6 = 72
    case y7 = 84
    case y8 = 96
    case y9 = 108
    case y10 = 120
    case y11 = 132
    case y12 = 144
    case y13 = 156
    case y14 = 168
    case y15 = 180
    case y16 = 192
    case y17 = 204
    case y18 = 216
    case y19 = 228
    case y20 = 240

    var id: Int { rawValue }
    
    var displayName: String {
        if Locale.current.language.languageCode?.identifier == "ru" && rawValue == 3{
            return NSLocalizedString("loanTermThreeMonths", comment: "")
        }
        switch self {
            case .m3, .m6, .m9, .m18:
            return String.localizedStringWithFormat(
                NSLocalizedString("loanTermMonths", comment: ""),
                rawValue
            )
        case .y1:
            return NSLocalizedString("loanTermYear_1", comment: "")
        default:
                let years = rawValue / 12
            let key =
                (Locale.current.language.languageCode?.identifier == "ru"
                    && (2...4).contains(years))
                ? "loanTermYears"
                : "loanTermYearsGeneric"
            return String.localizedStringWithFormat(
                NSLocalizedString(key, comment: ""),
                years
            )
        }
    }
    var monthsCount: Double { Double(rawValue) }
}

