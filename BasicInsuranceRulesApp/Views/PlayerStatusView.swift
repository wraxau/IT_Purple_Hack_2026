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
    private var status: (title: String, description: String, iconName: String, color: Color) {
        if totalResult > 0 {
            return (
                "Финансовый стратег",
                "Сценарии не просто пройдены - ситуации грамотно обыграны и ты остаёшься в выигрыше. Отличный результат!",
                "trophy",  // Или имя твоей картинки "strategist"
                Color(hex: "94A7FF")  // Голубой
            )
        } else if totalResult == 0 {
            return (
                "Балансировщик",
                "Твои траты на страховки и компенсации уравновешены. При этом часть расходов, возможно, пришлось покрывать самостоятельно.",
                "scale",  // Или имя твоей картинки "balancer" (кролик на макете)
                Color(hex: "94A7FF")  // Голубой
            )
        } else {
            return (
                "Исследователь",
                "Несмотря на то, что некоторые ситуации не покрывались страховкой, получены новые знания, которые пригодятся в будущем. Полезный опыт!",
                "magnifyingglass",  // Или имя твоей картинки "researcher"
                Color(hex: "94A7FF")  // Голубой
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
                .font(.custom("DelaGothicOne-Regular", size: 17))
                .foregroundColor(.darkBlue)
                .padding(.top, 40)
            
            Spacer()
            
            // 2. Заголовок статуса
            Text("Ты - \(status.title)!")
                .font(.custom("DelaGothicOne-Regular", size: 24))
                .foregroundColor(.darkBlue)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            
            // 3. Описание статуса
            Text(status.description)
                .font(.custom("DelaGothicOne-Regular", size: 18))
                .foregroundColor(.darkBlue)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
            
            // 4. Картинка статуса
            Image(systemName: status.iconName)
                .font(.system(size: 120))
                .foregroundColor(status.color)
                .frame(height: 200)
                .padding(.bottom, 40)
            
            // Если у тебя есть свои картинки вместо SF Symbols:
            // Image(status.iconName)
            //     .resizable()
            //     .scaledToFit()
            //     .frame(height: 200)
            //     .padding(.bottom, 40)
            
            Spacer()
            
            // 5. Кнопка "К сценариям"
            Button(action: onRestart) {
                Text("К сценариям")
                    .font(.custom("DelaGothicOne-Regular", size: 18))
            }
            .appStyle(.variantAButton)
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
        }
        .background(Color(.systemBackground))
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
