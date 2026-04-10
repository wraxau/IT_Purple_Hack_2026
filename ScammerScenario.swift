import Foundation

struct ScammerScenario: TopicScenario {
    
    func calculateResult(insurance: String, event: String) -> ScenarioResult {
        
        var resultText = ""
        var payout = 0
        var showPayoutDef = false
        
        switch (insurance, event) {

        case ("insurance", "hacker_attack"):
            resultText = """
            Злоумышленники списали с твоей карты 50 000 руб. 
            К счастью, страховая компания полностью возмещает потерю!

            Траты: 1 250 руб
            Выплата: 50 000 руб
            Итог: +48 750 руб
            """
            payout = 50_000
            showPayoutDef = true
            
        case ("insurance", "stolen_money"):
            resultText = """
            Злоумышленники украли 10 000 руб прямо из банкомата! 
            К счастью, страхования компания полностью возмещает потерю!

            Траты: 1 250 руб
            Выплата: 10 000 руб
            Итог: +8 750 руб
            """
            payout = 10_000
            showPayoutDef = true
            
        case ("insurance", "stolen_pin"):
            resultText = """
            ПИН-код был передан тобой мошеннику по неосторожности, из-за чего с карты было украдено 20 000 руб. 
            К сожалению, страховая компания не компенсирует подобные случаи.

            Траты: 1 250 руб
            Выплата: 0 руб
            Итог: -1 250 руб
            """
            payout = 0
            
        case ("none_insurance", "hacker_attack"):
            resultText = """
            Злоумышленники списали с твоей карты 50 000 руб. Ты не получаешь никакой компенсации.
            Траты: 0 руб
            Выплата: 0 руб
            Итог: 0 руб
            """
            payout = 0
            
        case ("none_insurance", "stolen_money"):
            resultText = """
            Злоумышленники украли 
            10 000 руб прямо из банкомата! Ты не получаешь никакой компенсации.

            Траты: 0 руб
            Выплата: 0 руб
            Итог: 0 руб
            """
            payout = 0
            
        case ("none_insurance", "stolen_pin"):
            resultText = """
            ПИН-код был передан тобой мошеннику по неосторожности, из-за чего с карты было украдено 20 000 руб. Ты не получаешь никакой компенсации.

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

