import SwiftUI
import Foundation

@Observable // property wrapper @Observable означает, что за этим объектом идет наблюдение и если что-то здесь будет меняться - View будет перерисовываться, отображая новое состояние
class GameViewModel {
    
    
    // MARK: Properties
    // State
    var currentScreen: AppScreen = .welcomeScreen
    var activePopup: PopUpWindowConfig? // накладываю popUp поверх основного окна
    var pendingPopup: PopUpWindowConfig?
    var pendingPopupAction: (() -> Void)?  //
    
    //Context
    var selectedTopic: String?
    var userChoises: [String] = []
    var totalExpenses: Int = 0           // Сумма всех трат
    var totalPayouts: Int = 0            // Сумма всех выплат
    var shownDefinitions: Set<String> = []
    private enum PopupID {
        // Определения при выборе страховки (показываются 1 раз при первом выборе)
        static let franchise = "def_franchise"                    // "Франшиза..."
        static let sportCoverage = "def_sport_coverage"           // "Страховка от несчастного случая..."
        static let travelFlexible = "def_travel_flexible"         // "Страховку часто разрешается..."
        static let petFull = "def_pet_full"                       // "Полная страховка покрывает..."
        
        static let insuranceCase = "def_insurance_case"
        static let insurancePayout = "def_insurance_payout"
    }
    
    private var onPopupClosed: (() -> Void)? // закрываю popUp
    
    // MARK: Navigation
    func startGame() {
        currentScreen = .choosePlotScreen
    }
    
    func startTopic(_ topicName: String) {
        selectedTopic = topicName
        userChoises = []
        //totalExpenses = 0
        //totalPayouts = 0
        
        // первый экран выбранной темы
        currentScreen = .basicScreen(ScreenConfigProvider.getFirstScreen(for: topicName))
    }
    
    private func getDefinitionConfig(for actionID: String) -> (id: String, config: PopUpWindowConfig)? {
        
        switch actionID {
            
        // ТЕЛЕФОН: Франшиза
        case "phone_franchise":
            return (
                PopupID.franchise,
                PopUpWindowConfig(
                    title: .definition,
                    text: "Франшиза - это часть, которую ты платишь сам. Остальное покрывает страховая.",
                    buttonTitle: "Понятно",
                    imageName: nil,
                    isResult: false
                )
            )
            
        // ПУТЕШЕСТВИЕ: Гибкость покупки
        case "travel_tour", "travel_full":
            return (
                PopupID.travelFlexible,
                PopUpWindowConfig(
                    title: .info,
                    text: "Страховку часто разрешается приобрести в течение недели после оплаты поездки.",
                    buttonTitle: "Понятно",
                    imageName: nil,
                    isResult: false
                )
            )
            
        // СПОРТ: Покрытие страховки
        case "sport_basic", "sport_extended":
            return (
                PopupID.sportCoverage,
                PopUpWindowConfig(
                    title: .info,
                    text: "Страховка от несчастного случая выплачивает фиксированную сумму в зависимости от тяжести травмы. Расширенная страховка дополнительно покрывает расходы на лечение и восстановление.",
                    buttonTitle: "Понятно",
                    imageName: nil,
                    isResult: false
                )
            )
            
        // ПИТОМЦЫ: Полная страховка
        case "pet_full":
            return (
                PopupID.petFull,
                PopUpWindowConfig(
                    title: .info,
                    text: "Полная страховка покрывает не только травмы, но и внезапные заболевания питомца.",
                    buttonTitle: "Понятно",
                    imageName: nil,
                    isResult: false
                )
            )
            
        default:
            return nil
        }
    }
    
    func handleButtonAction(_ actionID: String) {
        
        // 1. Навигационные кнопки
        switch actionID {
        case "show_how_it_works": showHowItWorks(); return
        case "go_to_ending_menu": goToThemeEndingMenu(); return
        case "back_to_menu": backToMenu(); return
        case "finish_game": finishGame(); return
        default: break
        }
        
        // 2. ПРОВЕРКА: это кнопка первого экрана?
        let isFirstScreenButton = ["basic_insurance", "insurance_fr", "none_insurance",
                                   "sport_basic", "full_insurance",
                                   "travel_tour", "travel_full",
                                   "trauma_insurance", "pet_full",
                                   "event_full", "insurance"].contains(actionID)
        
        if isFirstScreenButton, let definition = getDefinitionConfig(for: actionID) {
            // Показываем определение СРАЗУ (на первом экране)
            showPopupOnce(
                id: definition.id,
                config: definition.config
            ) {
                self.userChoises.append(actionID)
                self.updateMoney(for: actionID)
                // После закрытия — переходим на второй экран
                self.proceedWithLogic(actionID: actionID)
            }
            return
        }
        
        // 3. Для кнопок второго экрана — сразу логика (вызов show...Result)
        userChoises.append(actionID)
        updateMoney(for: actionID)
        proceedWithLogic(actionID: actionID)
    }
    
    //Показывает попап с результатом сценария
    // @escaping ставлю, чтобы функция дожила до момента, когда порльзователь нажмет закрыть popUp окно
    func showPopup(_ config: PopUpWindowConfig, onClosed: @escaping () -> Void) {
        activePopup = config
        onPopupClosed = onClosed
    }
    
    func closePopup() {
        onPopupClosed?()
        onPopupClosed = nil
        activePopup = nil
    }
    
    // MARK: Popup window for info
    
    func showPopupOnce(
        id: String,
        config: PopUpWindowConfig,
        nextAction: @escaping () -> Void)
    {
        if shownDefinitions.contains(id) {
            nextAction()
        } else {
            shownDefinitions.insert(id)
            showPopup(config, onClosed: nextAction)
        }
    }
    
    func restartGame() {
        selectedTopic = nil
        userChoises = []
        totalPayouts = 0
        totalExpenses = 0
        shownDefinitions.removeAll()
        currentScreen = .welcomeScreen
    }
    
    
    // MARK: Popup window for result
    
    func showResult(config: PopUpWindowConfig, nextAction: @escaping () -> Void) {
        showPopup(config, onClosed: nextAction)
    }
    
    // MARK: Helpers methods
    
    private func updateMoney(for actionID: String) {
        switch actionID {
            
        // ТЕЛЕФОН
        case "basic_insurance":  // А. Страхую - 4 500 руб
            totalExpenses += 4_500
        case "insurance_fr":     // В. Со франшизой - 3 000 руб
            totalExpenses += 3_000
            
        case "sport_basic":      // А. страховка от несчастного случая - 10 000 руб
            totalExpenses += 10_000
        case "full_insurance":   // В. Расширенная страховка - 15 000 руб
            totalExpenses += 15_000
            
        // МЕРОПРИЯТИЕ
        case "event_full":       // А. Страхую - 150 руб
            totalExpenses += 150
        case "event_none":
            break
            
        // ПУТЕШЕСТВИЕ
        case "travel_tour":      // А. Страхую только тур - 5 000 руб
            totalExpenses += 5_000
        case "travel_full":      // В. Страхую тур и перелёт - 6 000 руб
            totalExpenses += 6_000
            
        // ПИТОМЦЫ
        case "trauma_insurance": // А. Страхую только травмы - 6 000 руб
            totalExpenses += 6_000
        // case "full_insurance" - УЖЕ ЕСТЬ!
        case "pet_full":         // В. Страхую травмы и заболевания - 7 000 руб
            totalExpenses += 7_000
            
        // МОШЕННИКИ
        case "insurance":        // А. Страхую - 1 250 руб
            totalExpenses += 1_250
            
        // Универсальный
        case "none_insurance":   // С. Не страхую
            break
            
        default:
            break
        }
    }
    
    // MARK: Game logic
    
    private func proceedWithLogic(actionID: String) {
        guard let topic = selectedTopic else { return }
        
        switch topic {
        case "phone":
            handlePhoneLogic(actionID: actionID)
        case "event":
            handleEventLogic(actionID: actionID)
        case "travel":
            handleTravelLogic(actionID: actionID)
        case "sport":
            handleSportLogic(actionID: actionID)
        case "pet":
            handlePetLogic(actionID: actionID)
        case "scammer":
            handleScammerLogic(actionID: actionID)
        default:
            currentScreen = .finalMoneyScreen
        }
    }
    func getPlayerStatus() -> (title: String, description: String, iconName: String) {
        let result = totalPayouts - totalExpenses
        
        if result > 0 {
            return ("Финансовый стратег",
                    "Сценарии не просто пройдены - ситуации грамотно обыграны и ты остаёшься в выигрыше. Отличный результат!",
                    "trophy")
        } else if result == 0 {
            return ("Балансировщик",
                    "Твои траты на страховки и компенсации уравновешены. При этом часть расходов, возможно, пришлось покрывать самостоятельно.",
                    "scale")
        } else {
            return ("Исследователь",
                    "Несмотря на то, что некоторые ситуации не покрывались страховкой, получены новые знания, которые пригодятся в будущем. Полезный опыт!",
                    "magnifyingglass")
        }
    }
    

    func goToThemeOutro() {
        guard let topic = selectedTopic else {
            currentScreen = .choosePlotScreen
            return
        }
        
        let outroConfig = ScreenConfigProvider.getThemeOutroInfo(for: topic)
        currentScreen = .basicScreen(outroConfig)
    }
    
    func showHowItWorks() {
        guard let topic = selectedTopic else { return }
        let howItWorksContent = ScreenConfigProvider.getHowItWorksContent(for: topic)
        
        // Переключаемся на специальный экран инструкции
        currentScreen = .howItWorksScreen(howItWorksContent)
    }

    func goToThemeEndingMenu() {

        let endingMenu = ScreenConfigProvider.getThemeEndingMenu()
        
        currentScreen = .basicScreen(endingMenu)
    }

    func finishGame() {
        currentScreen = .finalMoneyScreen
    }
  
    func backToMenu() {
        selectedTopic = nil

        currentScreen = .choosePlotScreen
    }
    
    // ТЕЛЕФОН
    private func showPhoneResult(event: String) {
        let insurance = userChoises.first ?? "none_insurance"
        let scenario = PhoneScenario()
        let result = scenario.calculateResult(insurance: insurance, event: event)
        totalPayouts += result.payout
        
        showPopupOnce(
            id: PopupID.insuranceCase,
            config: PopUpWindowConfig(
                title: .info,
                text: "В страховании такое событие называется страховой случай.",
                buttonTitle: "Понятно",
                imageName: nil,
                isResult: false
            ),
            nextAction: {
                self.pendingPopup = PopUpWindowConfig(
                    title: .result,
                    text: result.resultText,
                    buttonTitle: "Понятно",
                    imageName: nil,
                    expenses: self.totalExpenses,
                    payout: result.payout,
                    isResult: true
                )
                self.pendingPopupAction = {
                    self.goToThemeOutro()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.screenDidAppear()
                }
            }
        )
    }

    // СПОРТ
    private func showSportResult(event: String) {
        let insurance = userChoises.first ?? "none_insurance"
        let scenario = SportScenario()
        let result = scenario.calculateResult(insurance: insurance, event: event)
        totalPayouts += result.payout
        
        showPopupOnce(
            id: PopupID.insuranceCase,
            config: PopUpWindowConfig(
                title: .info,
                text: "В страховании такое событие называется страховой случай.",
                buttonTitle: "Понятно",
                imageName: nil,
                isResult: false
            ),
            nextAction: {
                self.pendingPopup = PopUpWindowConfig(
                    title: .result,
                    text: result.resultText,
                    buttonTitle: "Понятно",
                    imageName: nil,
                    expenses: self.totalExpenses,
                    payout: result.payout,
                    isResult: true
                )
                self.pendingPopupAction = {
                    self.goToThemeOutro()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.screenDidAppear()
                }
            }
        )
    }

    // МЕРОПРИЯТИЕ
    private func showEventResult(event: String) {
        let insurance = userChoises.first ?? "event_none"
        let scenario = EventScenario()
        let result = scenario.calculateResult(insurance: insurance, event: event)
        totalPayouts += result.payout
        
        showPopupOnce(
            id: PopupID.insuranceCase,
            config: PopUpWindowConfig(
                title: .info,
                text: "В страховании такое событие называется страховой случай.",
                buttonTitle: "Понятно",
                imageName: nil,
                isResult: false
            ),
            nextAction: {
                self.pendingPopup = PopUpWindowConfig(
                    title: .result,
                    text: result.resultText,
                    buttonTitle: "Понятно",
                    imageName: nil,
                    expenses: self.totalExpenses,
                    payout: result.payout,
                    isResult: true
                )
                self.pendingPopupAction = {
                    self.goToThemeOutro()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.screenDidAppear()
                }
            }
        )
    }

    // ПУТЕШЕСТВИЕ
    private func showTravelResult(event: String) {
        let insurance = userChoises.first ?? "none_insurance"
        let scenario = TravelScenario()
        let result = scenario.calculateResult(insurance: insurance, event: event)
        totalPayouts += result.payout
        
        showPopupOnce(
            id: PopupID.insuranceCase,
            config: PopUpWindowConfig(
                title: .info,
                text: "В страховании такое событие называется страховой случай.",
                buttonTitle: "Понятно",
                imageName: nil,
                isResult: false
            ),
            nextAction: {
                self.pendingPopup = PopUpWindowConfig(
                    title: .result,
                    text: result.resultText,
                    buttonTitle: "Понятно",
                    imageName: nil,
                    expenses: self.totalExpenses,
                    payout: result.payout,
                    isResult: true
                )
                self.pendingPopupAction = {
                    self.goToThemeOutro()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.screenDidAppear()
                }
            }
        )
    }

    // ПИТОМЦЫ
    private func showPetResult(event: String) {
        let insurance = userChoises.first ?? "none_insurance"
        let scenario = PetScenario()
        let result = scenario.calculateResult(insurance: insurance, event: event)
        totalPayouts += result.payout
        
        showPopupOnce(
            id: PopupID.insuranceCase,
            config: PopUpWindowConfig(
                title: .info,
                text: "В страховании такое событие называется страховой случай.",
                buttonTitle: "Понятно",
                imageName: nil,
                isResult: false
            ),
            nextAction: {
                self.pendingPopup = PopUpWindowConfig(
                    title: .result,
                    text: result.resultText,
                    buttonTitle: "Понятно",
                    imageName: nil,
                    expenses: self.totalExpenses,
                    payout: result.payout,
                    isResult: true
                )
                self.pendingPopupAction = {
                    self.goToThemeOutro()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.screenDidAppear()
                }
            }
        )
    }

    // МОШЕННИКИ
    private func showScammerResult(event: String) {
        let insurance = userChoises.first ?? "none_insurance"
        let scenario = ScammerScenario()
        let result = scenario.calculateResult(insurance: insurance, event: event)
        totalPayouts += result.payout
        
        showPopupOnce(
            id: PopupID.insuranceCase,
            config: PopUpWindowConfig(
                title: .info,
                text: "В страховании такое событие называется страховой случай.",
                buttonTitle: "Понятно",
                imageName: nil,
                isResult: false
            ),
            nextAction: {
                self.pendingPopup = PopUpWindowConfig(
                    title: .result,
                    text: result.resultText,
                    buttonTitle: "Понятно",
                    imageName: nil,
                    expenses: self.totalExpenses,
                    payout: result.payout,
                    isResult: true
                )
                self.pendingPopupAction = {
                    self.goToThemeOutro()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.screenDidAppear()
                }
            }
        )
    }
    
    // ТЕЛЕФОН
    private func handlePhoneLogic(actionID: String) {
        // Экран 1: Выбор страховки
        if ["basic_insurance", "insurance_fr", "none_insurance"].contains(actionID) {
            // Устанавливаем отложенный попап для второго экран
            // Переключаем на второй экран
            currentScreen = .basicScreen(ScreenConfigProvider.getSecondScreen(for: "phone"))
        }
        // Экран 2: Событие
        else if ["phone_broken", "phone_stolen", "phone_lost"].contains(actionID) {
            showPhoneResult(event: actionID)
        }
    }

    // СПОРТ
    private func handleSportLogic(actionID: String) {
        if ["basic_insurance", "full_insurance", "none_insurance"].contains(actionID) {
            
            currentScreen = .basicScreen(ScreenConfigProvider.getSecondScreen(for: "sport"))
        }
        else if ["knee_ache", "turnik_man_case", "boots_ache"].contains(actionID) {
            showSportResult(event: actionID)
        }
    }

    // МЕРОПРИЯТИЕ
    private func handleEventLogic(actionID: String) {
        if ["event_full", "event_none"].contains(actionID) {
            
            currentScreen = .basicScreen(ScreenConfigProvider.getSecondScreen(for: "event"))
        }
        else if ["cancelled", "no_vibe", "feel_bad"].contains(actionID) {
            showEventResult(event: actionID)
        }
    }

    // ПУТЕШЕСТВИЕ
    private func handleTravelLogic(actionID: String) {
        if ["travel_tour", "full_insurance", "none_insurance"].contains(actionID) {
            
            currentScreen = .basicScreen(ScreenConfigProvider.getSecondScreen(for: "travel"))
        }
        else if ["travel_poison", "laggage_lost", "forgot_passport"].contains(actionID) {
            showTravelResult(event: actionID)
        }
    }

    // ПИТОМЦЫ
    private func handlePetLogic(actionID: String) {
        if ["trauma_insurance", "full_insurance", "none_insurance"].contains(actionID) {
            
            currentScreen = .basicScreen(ScreenConfigProvider.getSecondScreen(for: "pet"))
        }
        else if ["broken_leg", "poison", "def"].contains(actionID) {
            showPetResult(event: actionID)
        }
    }

    // МОШЕННИКИ
    private func handleScammerLogic(actionID: String) {
        if ["insurance", "none_insurance"].contains(actionID) {
            pendingPopup = PopUpWindowConfig(
                title: .info,
                text: "В страховании такое событие называется страховой случай.",
                buttonTitle: "Понятно",
                imageName: nil,
                isResult: false
            )
            currentScreen = .basicScreen(ScreenConfigProvider.getSecondScreen(for: "scammer"))
        }
        else if ["hacker_attack", "stolen_money", "stolen_pin"].contains(actionID) {
            showScammerResult(event: actionID)
        }
    }
    // MARK: - Screen Lifecycle
    //Вызывается из View.onAppear, чтобы показать отложенный попап
    func screenDidAppear() {
        if let popup = pendingPopup {
            pendingPopup = nil
            let action = pendingPopupAction
            pendingPopupAction = nil
            
            showPopup(popup, onClosed: {
                action?()
            })
        }
    }
    
}
