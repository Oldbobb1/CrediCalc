import SwiftUI

struct CurrencyPicker: View {
    @Binding var selectedCurrency: Currency
    
    init(_ selectedCurrency: Binding<Currency>) {
        self._selectedCurrency = selectedCurrency
    }
    
    var body: some View {
        Picker("Currency", selection: $selectedCurrency) {
            ForEach(Currency.allCases) { type in
                Text(type.rawValue).tag(type)
            }
        }
    }
}
