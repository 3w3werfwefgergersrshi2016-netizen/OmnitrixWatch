import SwiftUI

struct ContentView: View {
    @State private var selection = 0.0
    // List your image filenames here (without .png)
    let aliens = ["heatblast", "fourarms", "xlr8", "diamondhead"]

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Image(aliens[Int(selection) % aliens.count])
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 140)
            }
        }
        .focusable()
        .digitalCrownRotation($selection, from: 0, through: 100, by: 1, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true)
    }
}
