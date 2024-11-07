import SwiftUI

extension Color {
    static var randomColor: Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color.init(red: red, green: green, blue: blue)
    }
}
