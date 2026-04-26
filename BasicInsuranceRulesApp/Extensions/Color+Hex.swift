import SwiftUI

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red: Double
        let green: Double
        let blue: Double
        let alpha: Double

        switch hexSanitized.count {
        case 6:
            red = Double((rgb & 0xFF0000) >> 16) / 255.0
            green = Double((rgb & 0x00FF00) >> 8) / 255.0
            blue = Double(rgb & 0x0000FF) / 255.0
            alpha = 1.0
        case 8:
            alpha = Double((rgb & 0xFF000000) >> 24) / 255.0
            red = Double((rgb & 0x00FF0000) >> 16) / 255.0
            green = Double((rgb & 0x0000FF00) >> 8) / 255.0
            blue = Double(rgb & 0x000000FF) / 255.0
        default:
            red = 0
            green = 0
            blue = 0
            alpha = 1.0
        }

        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }

    static let lightBlue: Color = Color(hex: "C0E0FF")
    static let lightBlueSoft: Color = Color(hex: "E6F0FF")
    static let purpleCust: Color = Color(hex: "A794FF")
    static let pinkCust: Color = Color(hex: "FFB2F7")
    static let lime: Color = Color(hex: "E2FB86")
    static let darkBlue: Color = Color(hex: "253A82")
    static let indigoBlue: Color = Color(hex: "88A2FF")
    static let textPrimary: Color = .darkBlue
    static let appBackground: Color = .white
    static let overlay: Color = .black
    static let popupCardBackground: Color = Color.white.opacity(0.85)
    static let surface: Color = Color(.systemBackground)
    static let surfaceMuted: Color = .gray.opacity(0.1)
    static let onLight: Color = .black
    static let outline: Color = .white
}
