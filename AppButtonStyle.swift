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
    case forFirstScreenButton
    case sportMenu
    case petMenu
    case phoneMenu
    case eventMenu
    case travelMenu
    case scammersMenu
    
    // цвет кнопки
    var backgroundColor: Color {
        switch self {
        case .variantAButton, .firstButton, .eventMenu:
            return Color.lightBlue
        case .variantBButton, .secondButton, .phoneMenu:
            return Color.indigoBlue
        case .variantCButton, .skipButton, .travelMenu:
            return Color.pinkCust
        case .howItWorksButton, .chooseAnotherTopicButton, .understandButton, .forFirstScreenButton, .petMenu:
            return Color.lime
        case .nextButton, .stopGameButton, .scammersMenu:
            return Color.purpleCust
        case .sportMenu:
            return .darkBlue
        }
    }
    
    // цвет текста на кнопке
    
    var titleColor: Color {
        switch self {
        case .understandButton:
            return Color.black
        case .chooseAnotherTopicButton, .variantAButton, .firstButton, .howItWorksButton, .eventMenu:
            return .indigoBlue
        case .skipButton, .forFirstScreenButton, .petMenu:
            return .darkBlue
        case .secondButton, .variantCButton, .phoneMenu, .travelMenu:
            return .lime
        case .nextButton, .stopGameButton, .variantBButton, .sportMenu:
            return Color.pinkCust
        case .scammersMenu:
            return .lightBlue
        }
    }
    
    // на самом деле это ширина
    var height: CGFloat {
        switch self {
        case .chooseAnotherTopicButton, .stopGameButton, .variantAButton, .variantBButton, .variantCButton, .firstButton, .secondButton, .petMenu, .phoneMenu, .eventMenu, .scammersMenu, .sportMenu, .travelMenu:
            return 97
        case .understandButton:
            return 48
        case .skipButton, .howItWorksButton, .nextButton, .forFirstScreenButton:
            return 54
        }
    }
    
    
    // на смаом деле это высота
    var width: CGFloat {
        switch self {
        case .forFirstScreenButton:
            return 246
        case .understandButton:
            return 270
        case .petMenu, .phoneMenu, .eventMenu, .scammersMenu, .sportMenu, .travelMenu:
            return 172
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
