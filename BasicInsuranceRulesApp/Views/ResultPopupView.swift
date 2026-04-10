import SwiftUI

struct ResultPopupView: View {
    let resultText: String
    let expenses: Int
    let payout: Int
    let total: Int
    let imageName: String?
    let onClose: () -> Void
    

    private let darkBlue = Color(red: 47/255, green: 54/255, blue: 124/255)
    private let lime = Color(red: 226/255, green: 251/255, blue: 134/255)
    private let pinkCust = Color(red: 255/255, green: 178/255, blue: 247/255)
    private let indigoBlue = Color(red: 136/255, green: 162/255, blue: 255/255)
    private let blackColor = Color(red: 0, green: 0, blue: 0)
    
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
            Color.black.opacity(0.4)
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
                    .font(.system(size: 16, weight: .regular))
                       .foregroundColor(.black)
                
                Text(resultText)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(blackColor)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                
                // Блок с цифрами
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Траты:")
                            .font(.system(size: 16, weight: .regular))
                               .foregroundColor(.black)
                            
                        Text("\(formatNumber(expenses)) руб")
                            .font(.system(size: 16, weight: .regular))
                               .foregroundColor(.black)
                    }
                    
                    HStack {
                        Text("Выплата:")
                            .font(.system(size: 16, weight: .regular))
                               .foregroundColor(.black)
                        Text("\(formatNumber(payout)) руб")
                            .font(.system(size: 16, weight: .regular))
                               .foregroundColor(.black)
                    }
                    
                    HStack {
                        Text("Итог:")
                            .font(.system(size: 16, weight: .regular))
                               .foregroundColor(.black)
                        Text("\(formatNumber(total)) руб")
                            .font(.system(size: 16, weight: .regular))
                               .foregroundColor(.black)
                    }
                }
                .padding(12)
                .background(Color(.systemBackground).opacity(0.95))
                .cornerRadius(12)
                .padding(.horizontal, 10)
                
                // Кнопка "Понятно" (лаймовая)
                Button(action: onClose) {
                    Text("Понятно")
                        .font(.system(size: 16, weight: .regular))
                           .foregroundColor(.black)   
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(lime)
                        .cornerRadius(20)
                }
                .padding(.top, 10)
                
            }
            .padding(24)
            .background(Color(.systemBackground))
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
