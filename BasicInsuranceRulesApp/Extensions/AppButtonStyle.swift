import SwiftUI

enum AppTypography {
    static let delaTitleLarge = Font.custom("DelaGothicOne-Regular", size: 28)
    static let delaTitle = Font.custom("DelaGothicOne-Regular", size: 24)
    static let delaSubtitle = Font.custom("DelaGothicOne-Regular", size: 20)
    static let delaBody = Font.custom("DelaGothicOne-Regular", size: 18)
    static let delaButton = Font.custom("DelaGothicOne-Regular", size: 17)
    static let delaButtonSmall = Font.custom("DelaGothicOne-Regular", size: 15)
    static let systemBody = Font.system(size: 17, weight: .regular)
    static let systemButton = Font.system(size: 17, weight: .medium)
    static let systemTitle = Font.system(size: 20, weight: .medium)
    static let systemCaption = Font.system(size: 16, weight: .regular)
}

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
            return .onLight
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
            return AppTypography.systemButton
        default:
            return AppTypography.delaButton
        }
    }
    
}
