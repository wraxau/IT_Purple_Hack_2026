import SwiftUI

extension Color {
    
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
            
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
            
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        let alpha = Double((rgb & 0xFF000000) >> 24) / 255.0
            
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
    
    static let lightBlue: Color = Color(hex: "C0E0FF")
    static let purpleCust: Color = Color(hex: "88A2FF")
    static let pinkCust: Color = Color(hex: "FFB2F7")
    static let lime: Color = Color(hex: "E2FB86")
    static let darkBlue: Color = Color(hex: "253A82")
    static let indigoBlue: Color = Color(hex: "88A2FF")
    
    
}
