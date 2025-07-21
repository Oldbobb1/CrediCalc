import SwiftUI

struct CalculationDisclaimer: View {
    @Environment(\.horizontalSizeClass) var size
    
    var body: some View {
        Text("results")
            .font(.title2)
            .bold()
            .frame(alignment: .center)
        HStack {
            Image(systemName: "info.circle.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(.red)
            Text("info")
                .font(size == .compact ? .caption2 : .subheadline)
                .foregroundStyle(.secondary)
                .padding(.trailing)
        }
    }
}
