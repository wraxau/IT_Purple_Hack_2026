import SwiftUI

struct ResultPopupView: View {
    let resultText: String
    let expenses: Int
    let payout: Int
    let total: Int
    let imageName: String?
    let onClose: () -> Void
    

    private var resultImageName: String {
        if total > 0 {
            return "happy"      // Выиграл
        } else if total == 0 {
            return "thinker"    // В ноль
        } else {
            return "sad"        // Проиграл
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
        ZStack {
            // Затемнение фона
            Color.overlay.opacity(0.4)
                .ignoresSafeArea()
                .onTapGesture {
                    onClose()
                }
            
            // Карточка результата
            VStack(spacing: 20) {
                
                Image(resultImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding(.top, 10)
                
                // Заголовок
                Text("Результат")
                    .font(AppTypography.systemBody)
                    .foregroundColor(.onLight)
                
                Text(resultText)
                    .font(AppTypography.systemBody)
                    .foregroundColor(.onLight)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                
                // Блок с цифрами
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Траты:")
                            .font(AppTypography.systemBody)
                            .foregroundColor(.onLight)
                            
                        Text("\(formatNumber(expenses)) руб")
                            .font(AppTypography.systemBody)
                            .foregroundColor(.onLight)
                    }
                    
                    HStack {
                        Text("Выплата:")
                            .font(AppTypography.systemBody)
                            .foregroundColor(.onLight)
                        Text("\(formatNumber(payout)) руб")
                            .font(AppTypography.systemBody)
                            .foregroundColor(.onLight)
                    }
                    
                    HStack {
                        Text("Итог:")
                            .font(AppTypography.systemBody)
                            .foregroundColor(.onLight)
                        Text("\(formatNumber(total)) руб")
                            .font(AppTypography.systemBody)
                            .foregroundColor(.onLight)
                    }
                }
                .padding(12)
                .background(Color.surface.opacity(0.95))
                .cornerRadius(12)
                .padding(.horizontal, 10)
                
                // Кнопка "Понятно" (лаймовая)
                Button(action: onClose) {
                    Text("Понятно")
                        .font(AppTypography.systemBody)
                        .foregroundColor(.onLight)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(Color.lime)
                        .cornerRadius(20)
                }
                .padding(.top, 10)
                
            }
            .padding(24)
            .background(Color.surface)
            .cornerRadius(24)
            .shadow(color: .black.opacity(0.2), radius: 20, y: 10)
            .padding(.horizontal, 30)
            .transition(.scale.combined(with: .opacity))
        }
    }
}

#Preview {
    ResultPopupView(
        resultText: "Госпитализация и лечение обошлись в 15 000 руб. К счастью, страховая компания покрывает все медицинские расходы!",
        expenses: 5_000,
        payout: 15_000,
        total: 10_000,
        imageName: nil,
        onClose: {}
    )
}
