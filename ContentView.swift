import SwiftUI

struct ContentView: View {
    @State private var model = GameViewModel()
    
    var body: some View {
        ZStack {
            Group {
                switch model.currentScreen {
                    
                case .welcomeScreen:
                    WelcomeView(onStart: { model.startGame() })
                    
                case .choosePlotScreen:
                    MenuView(onSelect: { topic in
                        model.startTopic(topic)
                    })
                    
                case .basicScreen(let config):
                    BasicScreenView(config: config) { action in
                        model.handleButtonAction(action)
                    }
                
                    .onAppear {
                        model.screenDidAppear()
                    }
                    
                case .howItWorksScreen(let config):
                    HowItWorksView(config: config) {
                     
                        model.goToThemeEndingMenu()
                    }
                    .onAppear {
                        model.screenDidAppear()
                    }
                    
                case .finalMoneyScreen:
                    FinalMoneyView(
                                            expenses: model.totalExpenses,
                                            payouts: model.totalPayouts,
                                            onNext: {
                                                model.currentScreen = .playerStatusScreen
                                            }
                                        )
                    
                case .playerStatusScreen:
                    PlayerStatusView(
                        expenses: model.totalExpenses,
                        payouts: model.totalPayouts,
                        onRestart: {
                            model.restartGame()
                        }
                    )
                    
                case .themeEndingMenu(let topic):
                    ThemeEndingMenuView(
                        topicName: topic,
                        onSelectAnother: { model.backToMenu() },
                        onFinish: { model.finishGame() }
                    )
                }
            }
            
            if let popupConfig = model.activePopup {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                
                PopupView(config: popupConfig) {
                    model.closePopup()
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
        .animation(.easeInOut(duration: 0.3), value: model.activePopup != nil)
    }
}

#Preview {
    ContentView()
}
