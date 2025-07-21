import SwiftUI

enum LoanType: String, CaseIterable, Identifiable  {
    case annuity = "annuity"
    case differentiated =  "differentiated"
    
    var id: String { rawValue }
    
    var localized: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
}
