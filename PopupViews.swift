import SwiftUI

struct PopupView: View {
    let config: PopUpWindowConfig
    let onClose: () -> Void
    
    // Явные цвета для надёжности
    private let darkBlue = Color(red: 47/255, green: 54/255, blue: 124/255)
    private let lime = Color(red: 226/255, green: 251/255, blue: 134/255)
    private let lightBlueBg = Color(red: 230/255, green: 240/255, blue: 255/255)
    
    var body: some View {
        ZStack {
            // Затемнение фона
            Color.black.opacity(0.4).ignoresSafeArea()
            
            // Карточка попапа
            VStack(spacing: 16) {
                
                // 1. Картинка (только для результатов)
                if let imageName = config.imageName, !imageName.isEmpty {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .padding(.top, 10)
                }
                
                // 2. Заголовок
                Text(config.title.titleLabelText)
                    .font(.custom("DelaGothicOne-Regular", size: 20))
                    .foregroundColor(darkBlue)
                    .padding(.top, config.imageName != nil ? 0 : 10)
                
                // 3. Основной текст
                Text(config.text)
                    .font(.custom("DelaGothicOne-Regular", size: 16))
                    .foregroundColor(darkBlue)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                
                // 4. Финансовый блок (появляется только если isResult = true)
                if config.isResult {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Траты: \(format(config.expenses)) руб")
                            .font(.custom("DelaGothicOne-Regular", size: 15))
                            .foregroundColor(darkBlue)
                        Text("Выплата: \(format(config.payout)) руб")
                            .font(.custom("DelaGothicOne-Regular", size: 15))
                            .foregroundColor(darkBlue)
                        
                        let total = config.payout - config.expenses
                        Text("Итог: \(total >= 0 ? "+" : "")\(format(total)) руб")
                            .font(.custom("DelaGothicOne-Regular", size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(total >= 0 ? .green : .red)
                    }
                    .padding(12)
                    .background(lightBlueBg)
                    .cornerRadius(12)
                    .padding(.horizontal, 10)
                }
                
                // 5. Кнопка "Понятно" / "Далее"
                Button(action: onClose) {
                    Text(config.buttonTitle)
                        .font(.custom("DelaGothicOne-Regular", size: 18))
                        .foregroundColor(darkBlue)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(lime)
                .cornerRadius(27)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }
            .padding(24)
            .background(Color.white)
            .cornerRadius(24)
            .shadow(color: .black.opacity(0.15), radius: 10, y: 5)
            .padding(.horizontal, 30)
            .transition(.scale.combined(with: .opacity))
        }
    }
    
    private func format(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
}

#Preview {
    PopupView(
        config: PopUpWindowConfig(
            title: .result,
            text: "Потребовалось лечение у ветеринара: рентген, наложение шины и обезболивание. Приём обошёлся в 12 000 руб. Страховая компания полностью покрывает расходы!",
            buttonTitle: "Понятно",
            imageName: "welcome", // Замени на имя твоей картинки
            expenses: 6000,
            payout: 12000,
            isResult: true
        ),
        onClose: {}
    )
}
