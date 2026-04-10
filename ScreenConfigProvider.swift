import SwiftUI

struct ScreenConfigProvider {
    
    // MARK: - Public Static Methods

    static func getFirstScreen(for topic: String) -> TextButtonImageScreenConfig {
        switch topic {
        case "phone":
            return TextButtonImageScreenConfig(
                image: "phoneFirst",
                title: "Телефон",
                text: "Ты покупаешь новенький смартфон за 30 000 рублей!",
                buttons: [
                    ButtonConfig(title: "А. Страхую - 4 500 руб", style: .variantAButton, action: "basic_insurance"),
                    ButtonConfig(title: "В. Со франшизой - 3 000 руб", style: .variantBButton, action: "insurance_fr"),
                    ButtonConfig(title: "С. Не страхую - 0 руб", style: .variantCButton, action: "none_insurance")
                ]
            )
        case "sport":
            return TextButtonImageScreenConfig(
                image: "sportFirst",
                title: "Спорт",
                text: "Ты активно занимаешься скалолазанием в зале! \nТебе предлагают оформить страховку на год. Какую выберешь?",
                buttons: [
                    ButtonConfig(title: "А. страховка \nот несчастного случая \n- 10 000 руб", style: .variantAButton, action: "basic_insurance"),
                    ButtonConfig(title: "В. Расширенная страховка \n- 15 000 руб", style: .variantBButton, action: "full_insurance"),
                    ButtonConfig(title: "С. Не страхую ничего - 0 руб", style: .variantCButton, action: "none_insurance")
                ]
            )
        case "event":
            return TextButtonImageScreenConfig(
                image: "eventFirst",
                title: "Мероприятие",
                text: "Ты покупаешь билет на концерт любимой группы за 2 500 руб!",
                buttons: [
                    ButtonConfig(title: "А. Страхую - 150 руб", style: .variantAButton, action: "event_full"),
                    ButtonConfig(title: "В. Не страхую - 0 руб", style: .variantBButton, action: "event_none")
                ]
            )
        case "travel":
            return TextButtonImageScreenConfig(
                image: "travelFirst",
                title: "Путешествие",
                text: "Ты собираешься в поездку за границу (тур + перелёт) за 100 000 руб!",
                buttons: [
                    ButtonConfig(title: "А. Страхую только тур - 5 000 руб", style: .variantAButton, action: "travel_tour"),
                    ButtonConfig(title: "В. Страхую тур и перелёт - 6 000 руб", style: .variantBButton, action: "full_insurance"),
                    ButtonConfig(title: "С. Не страхую ничего - 0 руб", style: .variantCButton, action: "none_insurance")
                ]
            )
        case "pet":
            return TextButtonImageScreenConfig(
                image: "petsFirst",
                title: "Питомцы",
                text: "Твой питомец кот Симба снова залез на шкаф и чуть не свалился! \nМожет, пора застраховать его здоровье на случай экстремальных приключений?",
                buttons: [
                    ButtonConfig(title: "А. Страхую только травмы - 6 000 руб", style: .variantAButton, action: "trauma_insurance"),
                    ButtonConfig(title: "В. Страхую травмы и заболевания - 7 000 руб", style: .variantBButton, action: "full_insurance"),
                    ButtonConfig(title: "С. Не страхую - 0 руб", style: .variantCButton, action: "none_insurance")
                ]
            )
        case "scammer":
            return TextButtonImageScreenConfig(
                image: "scammersFirst",
                title: "Мошенники",
                text: "Твой банк предлагает подключить страхование от мошенничества, которое возмещает ущерб при краже денег со счетов или карт мошенниками.",
                buttons: [
                    ButtonConfig(title: "А. Страхую - 1 250 руб", style: .variantAButton, action: "insurance"),
                    ButtonConfig(title: "В. Не страхую - 0 руб", style: .variantBButton, action: "none_insurance")
                ]
            )
        default:
            return TextButtonImageScreenConfig(image: nil, title: "Тема", text: "Описание...", buttons: [])
        }
    }
    
    /// Создаёт конфигурацию ВТОРОГО экрана (что случилось?)
    static func getSecondScreen(for topic: String) -> TextButtonImageScreenConfig {
        switch topic {
        case "phone":
            return TextButtonImageScreenConfig(
                image: nil,
                title: "Телефон",
                text: "Ой! Кажется с телефоном что-то случилось…",
                buttons: [
                    ButtonConfig(title: "А. Разбился", style: .variantAButton, action: "phone_broken"),
                    ButtonConfig(title: "В. Был украден", style: .variantBButton, action: "phone_stolen"),
                    ButtonConfig(title: "С. Потерялся", style: .variantCButton, action: "phone_lost")
                ]
            )
        case "sport":
            return TextButtonImageScreenConfig(
                image: nil,
                title: "Спорт",
                text: "Произошло непредвиденное событие… \nЧто случилось?",
                buttons: [
                    ButtonConfig(title: "А. Повреждение мениска \nна тренировке", style: .variantAButton, action: "knee_ache"),
                    ButtonConfig(title: "В. Вывих на турниках улице", style: .variantBButton, action: "turnik_man_case"),
                    ButtonConfig(title: "С. Повреждение скальных туфель", style: .variantCButton, action: "boots_ache")
                ]
            )
        case "event":
            return TextButtonImageScreenConfig(
                image: nil,
                title: "Мероприятие",
                text: "К сожалению, произошел форс-мажор, и ты не сможешь пойти на концерт… Что случилось?",
                buttons: [
                    ButtonConfig(title: "А. Концерт отменили", style: .variantAButton, action: "cancelled"),
                    ButtonConfig(title: "В. Не хочу идти", style: .variantBButton, action: "no_vibe"),
                    ButtonConfig(title: "С. Плохое самочувствие", style: .variantCButton, action: "feel_bad")
                ]
            )
        case "pet":
            return TextButtonImageScreenConfig(
                image: nil,
                title: "Питомцы",
                text: "Симбочка попал в неприятность… \nЧто случилось?",
                buttons: [
                    ButtonConfig(title: "А. Сломал лапку", style: .variantAButton, action: "broken_leg"),
                    ButtonConfig(title: "В. Отравился", style: .variantBButton, action: "poison"),
                    ButtonConfig(title: "С. Оглох", style: .variantCButton, action: "def")
                ]
            )
        case "travel":
            return TextButtonImageScreenConfig(
                image: nil,
                title: "Путешествие",
                text: "Кажется, путешествие пошло не по плану… \nЧто случилось?",
                buttons: [
                    ButtonConfig(title: "A.  Отравление после дегустации местной кухни", style: .variantAButton, action: "travel_poison"),
                    ButtonConfig(title: "B.  Потеря багажа в аэропорте", style: .variantBButton, action: "laggage_lost"),
                    ButtonConfig(title: "C.  Паспорт остался дома", style: .variantCButton, action: "forgot_passport")
                ]
            )
        case "scammer":
            return TextButtonImageScreenConfig(
                image: nil,
                title: "Мошенники",
                text: "Произошла крайне неприятная ситуация... \nЧто случилось?",
                buttons: [
                    ButtonConfig(title: "А. Взлом твоего банковского приложения", style: .variantAButton, action: "hacker_attack"),
                    ButtonConfig(title: "В. Хищение наличных в банкомате", style: .variantBButton, action: "stolen_money"),
                    ButtonConfig(title: "С. Передача ПИН-кода мошеннику", style: .variantCButton, action: "stolen_pin")
                ]
            )
        default:
            return TextButtonImageScreenConfig(image: nil, title: "Вопрос", text: "...", buttons: [])
        }
    }
    
    static func getThemeOutroInfo(for topic: String) -> TextButtonImageScreenConfig {
        var descriptionText = ""
        
        switch topic {
        case "sport":
            descriptionText = "Скалолазание, катание на скейтборде и другие спортивные активности могут быть весёлыми, но иногда случаются непредвиденные ситуации..."
        case "phone":
            descriptionText = "Поломка или кража смартфона - одна из главных причин покупки нового устройства..."
        case "event":
            descriptionText = "Иногда планы меняются. Страховка культурно-массовых мероприятий поможет вернуть деньги..."
        case "travel":
            descriptionText = "Путешествия всегда могут идти не по плану: задержки рейсов, потеря багажа..."
        case "pet":
            descriptionText = "Домашние питомцы могут попадать в разные неприятности: травмы, болезни, отравления..."
        case "scammer":
            descriptionText = "Мошенничество с банковскими картами и счетами - частая неприятность..."
        default:
            descriptionText = "Информация о теме будет здесь."
        }
        
        return TextButtonImageScreenConfig(
            image: nil,
            title: getTopicTitle(for: topic),
            text: descriptionText,
            buttons: [
                ButtonConfig(title: "Как это работает?", style: .howItWorksButton, action: "show_how_it_works"),
                ButtonConfig(title: "Дальше", style: .nextButton, action: "go_to_ending_menu")
            ]
        )
    }
    
    /// Создаёт конфигурацию Экрана 2: Инструкция "Как это работает"
    static func getHowItWorksContent(for topic: String) -> HowItWorksScreen {
        var steps: [String] = []
        
        switch topic {
        case "sport":
            steps = [
                "Оформляешь страховку: Выбираешь один или несколько видов спорта и подключаешь обычную или расширенную защиту.",
                "Если что-то случилось: Несчастный случай во время занятий или соревнований по выбранному виду спорту - сообщаешь об этом на сайте страховой компании.",
                "Подаёшь заявку: Описываешь ситуацию и при необходимости прикладываешь фотографии и документы.",
                "Получаешь решение: Страховая компания проверяет заявку.",
                "Компенсация: Если случай признан страховым, страховая компания выплачивает фиксированную сумму. При подключении расширенной страховки она также покрывает расходы на лечение и восстановление."
            ]
        case "phone":
            steps = [
                "Оформляешь страховку: Выбираешь тариф и подключаешь защиту для своего смартфона.",
                "Если что-то случилось: Телефон сломался, разбился или его украли - сообщаешь об этом на сайте страховой компании.",
                "Подаёшь заявку: Описываешь ситуацию и при необходимости прикладываешь фото или документы.",
                "Получаешь решение: Страховая компания проверяет заявку.",
                "Ремонт или компенсация: Тебе оплачивают ремонт или выплачивают компенсацию."
            ]
        case "event":
            steps = [
                "Оформляешь страховку: При покупке билета можно добавить защиту - тогда страховая будет готова компенсировать расходы в случае уважительной причины.",
                "Если что-то случилось: Внезапное заболевание, травма, потеря имущества - сообщаешь об этом на сайте страховой компании.",
                "Подаёшь заявку: Описываешь ситуацию и при необходимости прикладываешь документы.",
                "Получаешь решение: Страховая компания проверяет заявку.",
                "Компенсация: Если случай признан страховым, тебе возвращают стоимость билета."
            ]
        case "travel":
            steps = [
                "Оформляешь страховку: Выбираешь тур, перелёт или полный пакет и подключаешь защиту для своей поездки. Часто страховку разрешается приобрести в течение недели после оплаты поездки.",
                "Если что-то случилось: Внезапное заболевание, травма, потеря имущества, отмена перелёта - сообщаешь об этом на сайте страховой компании.",
                "Подаёшь заявку: Описываешь ситуацию и при необходимости прикладываешь фотографии и документы.",
                "Получаешь решение: Страховая компания проверяет заявку.",
                "Компенсация: Если случай признан страховым, страховая компания возмещает расходы полностью либо частично с учётом установленной франшизы."
            ]
        case "pet":
            steps = [
                "Оформляешь страховку: Выбираешь покрытие: только травмы или травмы + заболевания, и подключаешь защиту для питомца.",
                "Если что-то случилось: Питомец травмировался или заболел - сообщаешь об этом на сайте страховой компании.",
                "Подаёшь заявку: Описываешь ситуацию и при необходимости прикладываешь фотографии и документы.",
                "Получаешь решение: Страховая компания проверяет заявку.",
                "Компенсация: Если случай признан страховым, страховая компания возмещает лечение питомца в любой ветклинике на территории РФ."
            ]
        case "scammer":
            steps = [
                "Оформляешь страховку: Подключаешь защиту - выбираешь страховку от мошенничества на сайте или в приложении своего или чужого банка.",
                "Если что-то случилось: Сообщаешь о происшествии на сайте страховой компании.",
                "Подаёшь заявку: Описываешь ситуацию и при необходимости прикладываешь фотографии и документы.",
                "Получаешь решение: Страховая компания проверяет заявку.",
                "Компенсация: Если случай признан страховым, страховая компания компенсирует украденные деньги."
            ]
        default:
            steps = ["Шаг 1", "Шаг 2", "Шаг 3"]
        }
        
        return HowItWorksScreen(title: "Как это работает?", steps: steps)
    }

    static func getThemeEndingMenu() -> TextButtonImageScreenConfig {
        return TextButtonImageScreenConfig(
            image: nil,
            title: "Что делаем дальше?",
            text: nil,
            buttons: [
                ButtonConfig(title: "Выбрать другую тему", style: .chooseAnotherTopicButton, action: "back_to_menu"),
                ButtonConfig(title: "Закончить", style: .stopGameButton, action: "finish_game")
            ]
        )
    }
    
    // ========================================================================
    // MARK: - Private Static Helpers
    // ========================================================================
    
    private static func getTopicTitle(for topic: String) -> String {
        switch topic {
        case "sport": return "Спорт"
        case "phone": return "Телефон"
        case "event": return "Мероприятие"
        case "travel": return "Путешествие"
        case "pet": return "Питомцы"
        case "scammer": return "Мошенники"
        default: return "Тема"
        }
    }
}
