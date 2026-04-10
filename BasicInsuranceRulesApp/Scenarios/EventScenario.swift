import Foundation

struct EventScenario: TopicScenario {
    
    func calculateResult(insurance: String, event: String) -> ScenarioResult {
        
        var resultText = ""
        var payout = 0
        var showPayoutDef = false
        
        switch (insurance, event) {
            
        case ("insurance", "cancelled"):
            resultText = """
            Организаторы возвращают полную стоимость билета - 2 500 руб. Страховка не понадобилась.

            Траты: 150 руб
            Выплата: 0 руб
            Итог: -150 руб
            """
            payout = 0
            
        case ("insurance", "no_vibe"):
            resultText = """
            Страховая компания ничего не возмещает. Билет полностью сгорает.

            Траты: 150 руб
            Выплата: 0 руб
            Итог: -150 руб
            """
            payout = 0
            
        case ("insurance", "feel_bad"):
            resultText = """
            Страховая компания возмещает полную стоимость билета!

            Траты: 150 руб
            Выплата: 2 500 руб
            Итог: +2 350 руб
            """
            payout = 2_500
            showPayoutDef = true
            
            
        case ("none_insurance", "cancelled"):
            resultText = """
            Организаторы возвращают полную стоимость билета - 2 500 руб. Страховка не понадобилась.

            Траты: 0 руб
            Выплата: 0 руб
            Итог: 0 руб
            """
            payout = 0
            
        case ("none_insurance", "no_vibe"):
            resultText = """
            Страховая компания ничего не возмещает. Билет полностью сгорает.

            Траты: 0 руб
            Выплата: 0 руб
            Итог: 0 руб
            """
            payout = 0
            
        case ("none_insurance", "feel_bad"):
            resultText = """
            Страховая компания ничего не возмещает. Билет полностью сгорает.

            Траты: 0 руб
            Выплата: 0 руб
            Итог: 0 руб
            """
            payout = 0
           
        default:
            resultText = "Произошла непредвиденная ситуация."
            payout = 0
        }
        
        return ScenarioResult(
            text: resultText,
            payout: payout,
            showDefinition: showPayoutDef
        )
    }
}


