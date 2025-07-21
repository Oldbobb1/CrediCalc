import SwiftUI

struct NeumorphicSegmentBackground: View {
    let animation: Namespace.ID

    init(_ animation: Namespace.ID) {
        self.animation = animation
    }

    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color("neumorphicFill"))
            .matchedGeometryEffect(id: "indicator", in: animation)
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
    }
}
