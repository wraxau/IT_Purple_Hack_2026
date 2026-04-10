import SwiftUI

struct ButtonConfig: Identifiable {
    let id = UUID() // функция, которая генерирует уникальный номер для объекта
    let title: String
    let style: AppButtonStyle
    let action: String
    
    init(title: String, style: AppButtonStyle, action: String) {
           self.title = title
           self.style = style
           self.action = action
    }
    
    static func == (lhs: ButtonConfig, rhs: ButtonConfig) -> Bool {
            lhs.id == rhs.id &&
            lhs.title == rhs.title &&
            lhs.action == rhs.action
        }
}
