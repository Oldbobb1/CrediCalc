import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            Image("LaunchImage")
                .resizable()
                .frame(
                    maxWidth: .infinity,
                    alignment: .center
                )
                .frame(
                    width: 250,
                    height: 250
                )
            Text("CrediCalc")
                .font(.largeTitle)
                .padding()
                .frame(
                    maxWidth: .infinity,
                    alignment: .center
                )
        }
    }
}

#Preview() {
    LaunchScreenView()
}
