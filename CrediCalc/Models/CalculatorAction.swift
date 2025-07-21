import SwiftUI

enum CalculatorAction: String, CaseIterable, Identifiable {
    case calculate = "calculate"
    case clear = "clear"
    
    var id: String { rawValue }
    
    var localiz: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
}
