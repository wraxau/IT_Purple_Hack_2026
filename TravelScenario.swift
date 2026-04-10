struct TravelScenario: TopicScenario {
    
    
    func calculateResult(insurance: String, event: String) -> ScenarioResult {
        var resultText = ""
        var payout = 0
        var showPayoutDef = false
        
        switch (insurance, event) {
            
        case ("travel_tour", "travel_poison"):
            resultText = """
            Госпитализация и лечение обошлись в 15 000 руб. К счастью, страховая компания покрывает все медицинские расходы!
            
            Траты: 5 000 руб
            Выплата: 15 000 руб
            Итог: +10 000 руб
            """
            payout = 15_000
            showPayoutDef = true
            
        case ("travel_tour", "laggage_lost"):
            resultText = """
            Багаж стоил примерно 20 000 руб. Но, к сожалению, страховая компания не покрывает потерю, так как ты застраховал только тур.

            Траты: 5 000 руб
            Выплата: 0 руб
            Итог: -5 000 руб
            """
            payout = 0
            
        case ("travel_tour", "forgot_passport"):
            resultText = """
            К сожалению, страховая компания не покрывает случаи, связанные с забытым паспортом. 

            Траты: 5 000 руб
            Выплата: 0 руб
            Итог: -5 000 руб
            """
            payout = 0
            
        case ("full_insurance", "travel_poison"):
            resultText = """
            Госпитализация и лечение обошлись в 15 000 руб. К счастью, страховая компания покрывает все медицинские расходы! 

            Траты: 6 000 руб
            Выплата: 15 000 руб
            Итог: +9 000 руб
            """
            payout = 15_000
            showPayoutDef = true
            
        case ("full_insurance", "laggage_lost"):
            resultText = """
            Багаж стоил примерно 20 000 руб. К счастью, страховая компания полностью компенсирует его стоимость!

            Траты: 6 000 руб
            Выплата: 20 000 руб
            Итог: +14 000 руб
            """
            payout = 20_000
            showPayoutDef = true
            
        case ("full_insurance", "forgot_passport"):
            resultText = """
            К сожалению, страховая компания не покрывает случаи, связанные с забытым паспортом.

            Траты: 6 000 руб
            Выплата: 0 руб
            Итог: -6 000 руб
            """
            payout = 0
            
        case ("none_insurance", "travel_poison"):
            resultText = """
            Госпитализация и лечение обошлись в 15 000 руб. Ты оплачиваешь все расходы на лечение самостоятельно.

            Траты: 0 руб
            Выплата: 0 руб
            Итог: 0 руб
            """
            payout = 0
            
        case ("none_insurance", "laggage_lost"):
            resultText = """
            Багаж стоил примерно 20 000 руб. Ты не получаешь никакой компенсации.

            Траты: 0 руб
            Выплата: 0 руб
            Итог: 0 руб
            """
            payout = 0
            
        case ("none_insurance", "forgot_passport"):
            resultText = """
            Ты не получаешь никакой компенсации.

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
