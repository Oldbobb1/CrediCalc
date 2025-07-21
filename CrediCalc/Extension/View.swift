import SwiftUI

extension View {
    func neumorphicBackground() -> some View {
        self
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color("neumorphicFill"))
                    .shadow(
                        color: Color("neumorphicShadowLight"),
                        radius: 3,
                        x: -4,
                        y: -4
                    )
                    .shadow(
                        color: Color("neumorphicShadowDark"),
                        radius: 4,
                        x: 4,
                        y: 4
                    )
            )
    }

    func hideKeyboardOnTap() -> some View {
        self.onTapGesture {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
        }
    }

    func hideKeyboardButton() -> some View {
        self.toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Готово") {
                    UIApplication.shared.sendAction(
                        #selector(UIResponder.resignFirstResponder),
                        to: nil,
                        from: nil,
                        for: nil
                    )
                }
            }
        }
    }
}
