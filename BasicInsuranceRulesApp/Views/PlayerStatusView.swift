import SwiftUI

struct PlayerStatusView: View {
    let expenses: Int
    let payouts: Int
    let onRestart: () -> Void
    
    // Вычисляем результат
    private var totalResult: Int {
        payouts - expenses
    }
    
    // Определяем статус
    private var status: (title: String, description: String, imageName: String) {
        if totalResult > 0 {
            return (
                "Финансовый стратег",
                "Сценарии не просто пройдены - ситуации грамотно обыграны и ты остаёшься в выигрыше. Отличный результат!",
                "happy"  // Имя картинки для стратега
            )
        } else if totalResult == 0 {
            return (
                "Балансировщик",
                "Твои траты на страховки и компенсации уравновешены. При этом часть расходов, возможно, пришлось покрывать самостоятельно.",
                "thinker"  // Имя картинки для балансировщика
            )
        } else {
            return (
                "Исследователь",
                "Несмотря на то, что некоторые ситуации не покрывались страховкой, получены новые знания, которые пригодятся в будущем. Полезный опыт!",
                "sad"  // Имя картинки для исследователя
            )
        }
    }
    
    // Форматируем число
    private func formatNumber(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            // 1. Заголовок "Финал"
            Text("Финал")
                .font(AppTypography.delaButton)
                .foregroundColor(.textPrimary)
                .padding(.top, 40)
            
            Spacer()
            
            // 2. Заголовок статуса
            Text("Ты - \(status.title)!")
                .font(AppTypography.delaTitle)
                .foregroundColor(.textPrimary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
                .padding(.bottom, 20)
            
            // 3. Описание статуса
            Text(status.description)
                .font(AppTypography.delaBody)
                .foregroundColor(.textPrimary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
            
            // 4. Картинка статуса
            Image(status.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 250)
                .padding(.bottom, 40)
            
            Spacer()
            
            // 5. Кнопка "К сценариям"
            Button(action: onRestart) {
                Text("К сценариям")
                    // 🔹 Явные стили вместо .appButtonStyle
                    .font(AppTypography.delaBody)
                    .foregroundColor(.textPrimary)
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.lightBlue)
                    .cornerRadius(50)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
            
        }
        .background(Color.surface)
        .ignoresSafeArea(.keyboard)
    }
}

// Превью для всех трех статусов
#Preview("Стратег (>0)") {
    PlayerStatusView(expenses: 30_000, payouts: 65_000, onRestart: {})
}

#Preview("Балансировщик (=0)") {
    PlayerStatusView(expenses: 45_000, payouts: 45_000, onRestart: {})
}

#Preview("Исследователь (<0)") {
    PlayerStatusView(expenses: 50_000, payouts: 20_000, onRestart: {})
}
