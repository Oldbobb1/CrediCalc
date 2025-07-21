import SwiftUI

struct ResultRow: View {
    let title: String, value: String

    init(_ title: String, _ value: String) {
        self.title = title
        self.value = value
    }

    var body: some View {
        HStack {
            Text(title)
                .bold()
                .minimumScaleFactor(0.2)
            Spacer()
            Text(value)
                .minimumScaleFactor(0.5)
        }
    }
}
