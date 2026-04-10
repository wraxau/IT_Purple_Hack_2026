import SwiftUI

struct FinalMoneyView: View {
    let expenses: Int
    let payouts: Int
    let onNext: () -> Void

    private let darkBlue = Color(red: 47/255, green: 54/255, blue: 124/255)
    private let darkGray = Color(red: 47/255, green: 54/255, blue: 124/255)      // #2D3748
    private let pinkLight = Color(red: 255/255, green: 178/255, blue: 247/255)  // #FFB6C1
    private let limeLight = Color(red: 226/255, green: 251/255, blue: 134/255)  // #E0FF94
    private let purpleLight = Color(red: 167/255, green: 148/255, blue: 255/255)
    
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
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(.black)
                .padding(.top, 40)
            
            Spacer()
            
            // 2. Приветствие
            Text("Ура! Вы прошли игру")
                .font(.custom("DelaGothicOne-Regular", size: 24))
                .foregroundColor(darkBlue)
                .padding(.bottom, 40)
            
            VStack(spacing: 16) {
                
                VStack(spacing: 4) {
                    Text("Суммарные траты")
                        .font(.custom("DelaGothicOne-Regular", size: 18))
                    Text(": \(formatNumber(expenses)) руб")
                        .font(.custom("DelaGothicOne-Regular", size: 18))
                }
                .foregroundColor(pinkLight)
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(darkGray)
                .cornerRadius(50)
                
                VStack(spacing: 4) {
                    Text("Суммарная выплата")
                        .font(.custom("DelaGothicOne-Regular", size: 18))
                    Text(": \(formatNumber(payouts)) руб")
                        .font(.custom("DelaGothicOne-Regular", size: 18))
                }
                .foregroundColor(limeLight)
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(pinkLight)
                .cornerRadius(50)
                
                VStack(spacing: 4) {
                    Text("Суммарный итог")
                        .font(.custom("DelaGothicOne-Regular", size: 18))
                    Text(": \(formatNumber(totalResult)) руб")
                        .font(.custom("DelaGothicOne-Regular", size: 18))
                }
                .foregroundColor(limeLight)
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(purpleLight)
                .cornerRadius(50)
                
            }
            .padding(.horizontal, 20)
            
            Spacer()

            Button(action: onNext) {
                Text("Дальше")
                    .font(.custom("DelaGothicOne-Regular", size: 17))
                    .foregroundColor(darkBlue)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(Color(red: 226/255, green: 251/255, blue: 134/255)) // lime
                    .cornerRadius(50)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
            
        }
        .background(Color(.systemBackground))
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
