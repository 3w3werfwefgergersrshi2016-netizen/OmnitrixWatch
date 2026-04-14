import SwiftUI

@main
struct OmnitrixApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var rotation = 0.0
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            // THE OUTER GREEN GLOW
            Circle()
                .stroke(Color.green.opacity(0.3), lineWidth: 8)
                .blur(radius: 4)
                .frame(width: 152, height: 152)
            
            // THE GREEN RIM
            Circle()
                .stroke(Color.green, lineWidth: 3)
                .frame(width: 145, height: 145)
            
            // THE GEOMETRIC ELEMENTS (No Files)
            Group {
                HourglassPiece()
                    .fill(Color.green)
                    .rotationEffect(.degrees(rotation))
                
                HourglassPiece()
                    .fill(Color.green)
                    .rotationEffect(.degrees(rotation + 180))
            }
            .frame(width: 110, height: 110)
            
            // THE 4 ROTATING BOLTS
            ForEach(0..<4) { i in
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.green)
                    .frame(width: 8, height: 16)
                    .offset(y: -72)
                    .rotationEffect(.degrees(Double(i) * 90 + rotation))
            }
        }
        // DIGITAL CROWN HOOK
        .focusable()
        .digitalCrownRotation($rotation, from: 0, through: 360, by: 10, sensitivity: .medium, isContinuous: true, isHapticFeedbackEnabled: true)
    }
}

// THE SHAPE DRAWING LOGIC
struct HourglassPiece: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}
