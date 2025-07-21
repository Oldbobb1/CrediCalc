import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        ZStack {
            Color("neumorphicFill")
                .ignoresSafeArea()
            VStack {
                Image("LaunchImage")
                    .resizable()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(width: 250, height: 250)
                Text("CrediCalc")
                    .font(.largeTitle)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
}
