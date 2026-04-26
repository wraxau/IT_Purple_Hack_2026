import SwiftUI

struct PopupView: View {
    let config: PopUpWindowConfig
    let onClose: () -> Void
    
    var body: some View {
        ZStack {
            // Затемнение фона
            Color.overlay.opacity(0.2).ignoresSafeArea()
            
            // Карточка попапа
            VStack(spacing: 16) {
                
                // 1. Картинка (только для результатов) — сверху, как и было
                if let imageName = config.imageName, !imageName.isEmpty {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .padding(.top, 10)
                }
                
                // 2. Заголовок
                Text(config.title.titleLabelText)
                    .font(AppTypography.systemBody)
                    .foregroundColor(.onLight)
                    .padding(.top, config.imageName != nil ? 0 : 10)
                
                // 3. Основной текст
                Text(config.text)
                    .font(AppTypography.systemBody)
                    .foregroundColor(.onLight)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                
                // 4. Финансовый блок (появляется только если isResult = true)
                if config.isResult {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Траты: \(format(config.expenses)) руб")
                            .font(AppTypography.systemBody)
                            .foregroundColor(.onLight)
                        Text("Выплата: \(format(config.payout)) руб")
                            .font(AppTypography.systemBody)
                            .foregroundColor(.onLight)
                        
                        let total = config.payout - config.expenses
                        Text("Итог: \(total >= 0 ? "+" : "")\(format(total)) руб")
                            .font(AppTypography.systemBody)
                            //.foregroundColor(total >= 0 ? .green : .red)
                    }
                    .padding(12)
                    //.background(lightBlueBg)
                    .cornerRadius(12)
                    .padding(.horizontal, 10)
                }
                
                // 5. Кнопка "Понятно" / "Далее" — текст кнопки тоже обновил
                Button(action: onClose) {
                    Text(config.buttonTitle)
                        .font(AppTypography.systemBody)
                        .foregroundColor(.onLight)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(Color.lime)
                .cornerRadius(27)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }
            .padding(24)
            .background(Color.popupCardBackground)
            .cornerRadius(24)
            //.shadow(color: .black.opacity(0.15), radius: 10, y: 5)
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
            imageName: "welcome",
            expenses: 6000,
            payout: 12000,
            isResult: true
        ),
        onClose: {}
    )
}
