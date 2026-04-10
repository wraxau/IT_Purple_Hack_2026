
// MARK: Logic of Event Topic

private func showEventResult(event: String) {
    let insurance = userChoises.first ?? "event_none"
    var resultText = ""
    var payout = 0
    var showPayoutDef = false
    
    if event == "event_cancelled" {
        // Концерт отменили - возврат от организаторов
        if insurance == "event_full" {
            resultText = "Организаторы возвращают полную стоимость билета - 2 500 руб. Страховка не понадобилась."
            payout = 0 // Возврат от организаторов, не от страховой
        } else {
            resultText = "Организаторы возвращают полную стоимость билета - 2 500 руб. Страховка не понадобилась."
            payout = 0
        }
    }
    else if event == "event_dont_want" {
        // Не хочу идти - неуважительная причина
        if insurance == "event_full" {
            resultText = "Страховая компания ничего не возмещает. Билет полностью сгорает."
            payout = 0
        } else {
            resultText = "Страховая компания ничего не возмещает. Билет полностью сгорает."
            payout = 0
        }
    }
    else if event == "event_sick" {
        // Плохое самочувствие - уважительная причина!
        if insurance == "event_full" {
            resultText = "Страховая компания возмещает полную стоимость билета!"
            payout = 2_500
            showPayoutDef = true // Показать определение "страховая выплата"
        } else {
            resultText = "Страховая компания ничего не возмещает. Билет полностью сгорает."
            payout = 0
        }
    }
    
    
    totalPayouts += payout
    showResultPopup(text: resultText, showPayoutDef: showPayoutDef)
}
