import Foundation

struct PhoneScenario: TopicScenario {
    
    func calculateResult(insurance: String, event: String) -> ScenarioResult {
        
        var resultText = ""
        var payout = 0
        var showPayoutDef = false
        
        switch (insurance, event) {
            
            // Cтраховка + телефон сломался
        case ("basic_insurance", "phone_broken"):
            resultText = """
            Ремонт стоит 20 000 руб. Страховая компания всё возмещает! 
            
            Траты: 4 500 руб
            Выплата: 20 000 руб
            Итог: +15 500 руб
            """
            payout = 20_000
            showPayoutDef = true
            
            // Страховка + украли
        case ("basic_insurance", "phone_stolen"):
            resultText = """
            Страховая компания возмещает полную стоимость телефона! 
            
            Траты: 4 500 руб
            Выплата: 30 000 руб
            Итог: +25 500 руб
            """
            payout = 30_000
            showPayoutDef = true
            
        case("basic_insurance", "phone_lost"):
            resultText = """
            К сожалению, страховая компания не покрывает потерю.
            
            Траты: 4 500 руб
            Выплата: 0 руб
            Итог: -4 500 руб
            """
            payout = 0
            
        case("insurance_fr", "phone_broken"):
            resultText = """
            Ремонт стоит 20 000 руб. Франшиза 10% - 2 000 руб ты платишь сам, остальное покрывает страховая компания.
            
            Траты: 3 000 + 2 000 = 5 000 руб
            Выплата: 20 000 руб
            Итог: +15 000 руб
            """
            payout = 20_000
            showPayoutDef = true
            
        case("insurance_fr", "phone_stolen"):
            resultText = """
            Франшиза 10% - страховая компания возмещает 90% стоимости телефона, 
            то есть 27 000 руб.
            
            Траты: 3 000 руб 
            Выплата: 27 000 руб
            Итог: +24 000 руб
            """
            payout = 27_000
            showPayoutDef = true
            
        case("insurance_fr", "phone_lost"):
            resultText = """
            К сожалению, страховая компания не покрывает потерю.
            
            Траты: 3 000 руб
            Выплата: 0 руб
            Итог: -3 000 руб
            """
            payout = 0
            
        case("none_insurance", "phone_broken"):
            resultText = """
            Ремонт стоит 20 000 руб. 
            Ты полностью оплачиваешь его сам.
            
            Траты: 20 000 руб 
            Выплата: 0 руб
            Итог: -20 000 руб
            """
            payout = 0
            
        case("none_insurance", "phone_stolen"):
            resultText = """
            Ты не получаешь никакого возмещения. 
            
            Траты: 0 руб
            Выплата: 0 руб
            Итог: 0 руб
            """
            payout = 0
            
        case("none_insurance", "phone_lost"):
            resultText = """
            Ты не получаешь никакого возмещения. 
            
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
