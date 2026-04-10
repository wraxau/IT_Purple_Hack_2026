enum AppScreen {
    case welcomeScreen
    case choosePlotScreen
    case basicScreen(TextButtonImageScreenConfig)
    case howItWorksScreen(HowItWorksScreen)
    case finalMoneyScreen
    case playerStatusScreen
    case themeEndingMenu(String)
    
    // ❌ УДАЛИ ЭТИ (если не используешь):
    // case thirdScreen
    // case firstScreen
    // case finalScreen
    // case resultScreen(ResultConfig)
    // case whatIfScreen(WhatIfConfig)
}

struct HowItWorksScreen {
    let title: String
    let steps: [String]
}
