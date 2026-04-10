import Foundation

struct PopUpWindowConfig {
    let title: PopUpWindowLabelType
    let text: String
    let buttonTitle: String
    let imageName: String?
    
    // Опциональные поля для экрана результата
    let expenses: Int
    let payout: Int
    let isResult: Bool
    
    init(title: PopUpWindowLabelType, text: String, buttonTitle: String, imageName: String? = nil, expenses: Int = 0, payout: Int = 0, isResult: Bool = false) {
        self.title = title
        self.text = text
        self.buttonTitle = buttonTitle
        self.imageName = imageName
        self.expenses = expenses
        self.payout = payout
        self.isResult = isResult
    }
}

enum PopUpWindowLabelType {
    case result, info, definition
    
    var titleLabelText: String {
        switch self {
        case .result: return "Результат"
        case .info: return "Информация"
        case .definition: return "Определение"
        }
    }
}
