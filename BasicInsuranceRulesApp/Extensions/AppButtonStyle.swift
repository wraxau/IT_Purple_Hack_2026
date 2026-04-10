import SwiftUI

enum AppButtonStyle: CaseIterable {
    case understandButton
    case variantAButton
    case variantBButton
    case variantCButton
    case firstButton // для экрана "как бы было.."
    case secondButton // для экрана "как бы было.."
    case skipButton
    case howItWorksButton
    case nextButton
    case chooseAnotherTopicButton
    case stopGameButton
    
    // цвет кнопки
    var backgroundColor: Color {
        switch self {
        case .variantAButton, .firstButton:
            return Color.lightBlue
        case .variantBButton, .secondButton:
            return Color.indigoBlue
        case .variantCButton, .skipButton:
            return Color.pinkCust
        case .howItWorksButton, .chooseAnotherTopicButton, .understandButton:
            return Color.lime
        case .nextButton, .stopGameButton:
            return Color.purpleCust
        }
    }
    
    // цвет текста на кнопке
    
    var titleColor: Color {
        switch self {
        case .understandButton:
            return Color.black
        case .chooseAnotherTopicButton, .variantAButton, .firstButton, .howItWorksButton:
            return .indigoBlue
        case .skipButton:
            return .darkBlue
        case .secondButton, .variantCButton:
            return .lime
        case .nextButton, .stopGameButton, .variantBButton:
            return Color.pinkCust
        }
    }
    
    var height: CGFloat {
        switch self {
        case .chooseAnotherTopicButton, .stopGameButton, .variantAButton, .variantBButton, .variantCButton, .firstButton, .secondButton:
            return 325
        case .understandButton:
            return 48
        case .skipButton, .howItWorksButton, .nextButton:
            return 54
        }
    }
    
    var width: CGFloat {
        switch self {
        case .understandButton:
            return 270
        default:
            return 325
        }
    }
    
    var cornerRadius: CGFloat {
            return 20
    }
    
    var font: Font {
        switch self {
        case .understandButton:
            return Font.system(size: 17, weight: .medium)
        default:
            return Font.custom("DelaGothicOne-Regular", size: 17)
        }
    }
    
}
