import SwiftUI

extension Button where Label == Text {

    func appStyle(_ style: AppButtonStyle) -> some View {
        self
            .font(style.font)
            .foregroundColor(style.titleColor)
            .frame(maxWidth: .infinity)
            .frame(height: style.height)
            .background(style.backgroundColor)
            .cornerRadius(style.cornerRadius)
            .shadow(color: .black.opacity(0.1), radius: 4, y: 2)
    }
}
