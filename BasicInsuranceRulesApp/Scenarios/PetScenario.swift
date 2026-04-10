import Foundation

struct PetScenario: TopicScenario {

    func calculateResult(insurance: String, event: String) -> ScenarioResult {
        
        var resultText = ""
        var payout = 0
        var showPayoutDef = false
        
        switch (insurance, event) {
            
        case ("trauma_insurance", "broken_leg"):
            resultText = """
            Потребовалось лечение у ветеринара: рентген, наложение шины и обезболивание. Приём обошёлся в 12 000 руб. Страховая компания полностью покрывает расходы!

            Траты: 6 000 руб
            Выплата: 12 000 руб
            Итог: +6 000 руб
            """
            payout = 12_000
            showPayoutDef = true
            
        case ("trauma_insurance", "poison"):
            resultText = """
            Потребовалось лечение у ветеринара: капельницы, лекарства и наблюдение. Прием обошёля в 15 000 руб. Страховая компания не покрывает заболевания, поэтому все расходы оплачиваешь самостоятельно.

            Траты: 6 000 руб
            Выплата: 0 руб
            Итог: -6 000 руб
            """
            payout = 0
            
        case ("trauma_insurance", "def"):
            resultText = """
            Симбочка оглох! К сожалению, страховая компания не покрывает потерю слуха или зрения.

            Траты: 6 000 руб
            Выплата: 0 руб
            Итог: -6 000 руб
            """
            payout = 0
            showPayoutDef = true
            
            
        case ("full_insurance", "broken_leg"):
            resultText = """
            Потребовалось лечение у ветеринара: рентген, наложение шины и обезболивание. Приём обошёлся в 12 000 руб. Страховая компания полностью покрывает расходы!

            Траты: 7 000 руб
            Выплата: 12 000 руб
            Итог: +5 000 руб
            """
            payout = 12_000
            showPayoutDef = true
            
        case ("full_insurance", "poison"):
            resultText = """
            Потребовалось лечение у ветеринара: капельницы, лекарства и наблюдение. Прием обошёля в 15 000 руб. Страховая компания покрывает все расходы!

            Траты: 7 000 руб
            Выплата: 15 000 руб
            Итог: +8 000 руб
            """
            payout = 15_000
            showPayoutDef = true
            
        case ("full_insurance", "def"):
            resultText = """
            Симбочка оглох! К сожалению, страховая компания не покрывает потерю слуха или зрения.

            Траты: 7 000 руб
            Выплата: 0 руб
            Итог: -7 000 руб
            """
            payout = 0
            
        
        case ("none_insurance", "broken_leg"):
            resultText = """
            Потребовалось лечение у ветеринара: рентген, наложение шины и обезболивание. 
            Приём обошёлся в 12 000 руб. Ты оплачиваешь лечение самостоятельно.

            Траты: 0 руб
            Выплата: 0 руб
            Итог: 0 руб
            """
            payout = 0
            
        case ("none_insurance", "poison"):
            resultText = """
            Потребовалось лечение у ветеринара: капельницы, лекарства и наблюдение. Прием обошёля в 15 000 руб. Ты оплачиваешь лечение самостоятельно.

            Траты: 0 руб
            Выплата: 0 руб
            Итог: 0 руб
            """
            payout = 0
            
        case ("none_insurance", "def"):
            resultText = """
            Симбочка оглох! 
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

