import SwiftUI

struct FinalMoneyView: View {
    let expenses: Int
    let payouts: Int
    let onNext: () -> Void

    // Вычисляем итог
    private var totalResult: Int {
        payouts - expenses
    }
    
    // Форматируем число с пробелами
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
                .font(AppTypography.systemCaption)
                .foregroundColor(.onLight)
                .padding(.top, 40)
            
            Spacer()
            
            // 2. Приветствие
            Text("Ура! Вы прошли игру")
                .font(AppTypography.delaTitle)
                .foregroundColor(.textPrimary)
                .padding(.bottom, 40)
            
            VStack(spacing: 16) {
                
                VStack(spacing: 4) {
                    Text("Суммарные траты")
                        .font(AppTypography.delaBody)
                    Text(": \(formatNumber(expenses)) руб")
                        .font(AppTypography.delaBody)
                }
                .foregroundColor(.pinkCust)
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(Color.darkBlue)
                .cornerRadius(50)
                
                VStack(spacing: 4) {
                    Text("Суммарная выплата")
                        .font(AppTypography.delaBody)
                    Text(": \(formatNumber(payouts)) руб")
                        .font(AppTypography.delaBody)
                }
                .foregroundColor(.lime)
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(Color.pinkCust)
                .cornerRadius(50)
                
                VStack(spacing: 4) {
                    Text("Суммарный итог")
                        .font(AppTypography.delaBody)
                    Text(": \(formatNumber(totalResult)) руб")
                        .font(AppTypography.delaBody)
                }
                .foregroundColor(.lime)
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(Color.purpleCust)
                .cornerRadius(50)
                
            }
            .padding(.horizontal, 20)
            
            Spacer()

            Button(action: onNext) {
                Text("Дальше")
                    .font(AppTypography.delaButton)
                    .foregroundColor(.textPrimary)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(Color.lime)
                    .cornerRadius(50)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
            
        }
        .background(Color.surface)
        .ignoresSafeArea(.keyboard)
    }
}

// Превью
#Preview {
    FinalMoneyView(
        expenses: 45_500,
        payouts: 72_000,
        onNext: {}
    )
}
