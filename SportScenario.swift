import Foundation

struct SportScenario: TopicScenario {
    
    func calculateResult(insurance: String, event: String) -> ScenarioResult {
        
        var resultText = ""
        var payout = 0
        var showPayoutDef = false
        
        switch (insurance, event) {
            
        case ("basic_insurance", "knee_ache"):
            resultText = """
            Неудачное приземление привело к повреждению мениска. 
            Лечение обошлось в 10 000 руб. 
            Страховая компания выплачивает фиксированную сумму 25 000 руб!
            
            Траты: 10 000 руб
            Выплата: 25 000 руб
            Итог: +15 000 руб
            """
            payout = 25_000
            showPayoutDef = true
            
        case ("full_insurance", "knee_ache"):
            resultText = """
            Неудачное приземление привело к повреждению мениска. 
            Лечение обошлось в 10 000 руб. 
            Страховая компания выплачивает фиксированную сумму 25 000 руб 
            и дополнительно покрывает все расходы на лечение!
            
            Траты: 15 000 руб
            Выплата: 25 000 + 10 000 = 35 000 руб
            Итог: +20 000 руб
            """
            payout = 35_000
            showPayoutDef = true
            
        case ("none_insurance", "knee_ache"):
            resultText = """
            Неудачное приземление привело к повреждению мениска. 
            Лечение обошлось в 10 000 руб. 
            Ты не получаешь никакой компенсации.
            
            Траты: 0 руб
            Выплата: 0 руб
            Итог: 0 руб
            """
            payout = 0

        case (_, "turnik_man_case"):
            let cost = insurance == "none_insurance" ? "0" : (insurance == "basic_insurance" ? "10 000" : "15 000")
            resultText = """
            Самостоятельная уличная тренировка на турниках привела к вывиху кости. 
            Лечение обошлось в 3 000 руб. 
            К сожалению, страховая компания ничего не выплачивает, так как 
            страховой случай не связан со скалолазанием.
            
            Траты: \(cost) руб
            Выплата: 0 руб
            Итог: -\(cost) руб
            """
            payout = 0
      
        case (_, "boots_ache"):
            let cost = insurance == "none_insurance" ? "0" : (insurance == "basic_insurance" ? "10 000" : "15 000")
            resultText = """
            Замена скальных туфель обошлась в 5 000 руб. 
            К сожалению, страховая компания ничего не выплачивает, 
            так как повреждение не считается несчастным случаем.
            
            Траты: \(cost) руб
            Выплата: 0 руб
            Итог: -\(cost) руб
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
