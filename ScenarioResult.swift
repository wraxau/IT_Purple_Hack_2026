import Foundation

struct ScenarioResult {
    let resultText: String      // Текст для попапа
    let payout: Int             // Сумма выплаты
    let showPayoutDefinition: Bool  // Показывать ли определение "выплата"
    
    init(text: String, payout: Int, showDefinition: Bool = false) {
        self.resultText = text
        self.payout = payout
        self.showPayoutDefinition = showDefinition
    }
}
