import SwiftUI

struct MenuView: View {
    let onSelect: (String) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            
            // 1. Заголовок "Сценарии"
            Text("Сценарии")
                .font(AppTypography.delaButton)
                .foregroundColor(.textPrimary)
                .padding(.top, 40)
            
            // 2. Заголовок "Выбери тему"
            Text("Выбери тему")
                .font(AppTypography.delaTitle)
                .foregroundColor(.textPrimary)
                .padding(.top, 184)
            
            // 3. Сетка кнопок (2 колонки)
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16) {
                    
                    // 📱 Телефон (.phoneMenu)
                    // Фон: indigoBlue, Текст: lime, Высота: 97, Ширина: 172
                    Button(action: {
                        print("Телефон")
                        onSelect("phone")
                    }) {
                        Text("Телефон")
                            .font(AppTypography.delaButton)
                            .foregroundColor(.lime)
                            .frame(width: 172, height: 97)
                            .background(Color.indigoBlue)
                            .cornerRadius(50)
                    }
                    
                    // 🐾 Питомцы (.petMenu)
                    // Фон: lime, Текст: darkBlue, Высота: 97, Ширина: 172
                    Button(action: {
                        print("Питомцы")
                        onSelect("pet")
                    }) {
                        Text("Питомцы")
                            .font(AppTypography.delaButton)
                            .foregroundColor(.textPrimary)
                            .frame(width: 172, height: 97)
                            .background(Color.lime)
                            .cornerRadius(50)
                    }
                    
                    // 🧗 Спорт (.sportMenu)
                    // Фон: darkBlue, Текст: pinkCust, Высота: 97, Ширина: 172
                    Button(action: {
                        print("Спорт")
                        onSelect("sport")
                    }) {
                        Text("Спорт")
                            .font(AppTypography.delaButton)
                            .foregroundColor(.pinkCust)
                            .frame(width: 172, height: 97)
                            .background(Color.darkBlue)
                            .cornerRadius(50)
                    }
                    
                    // ✈️ Путешествие (.travelMenu)
                    // Фон: pinkCust, Текст: lime, Высота: 97, Ширина: 172
                    Button(action: {
                        print("Путешествие")
                        onSelect("travel")
                    }) {
                        Text("Путешествие")
                            .font(AppTypography.delaButton)
                            .foregroundColor(.lime)
                            .frame(width: 172, height: 97)
                            .background(Color.pinkCust)
                            .cornerRadius(50)
                    }
                    
                    // 🎫 Мероприятие (.eventMenu)
                    // Фон: lightBlue, Текст: indigoBlue, Высота: 97, Ширина: 172
                    Button(action: {
                        print("Мероприятие")
                        onSelect("event")
                    }) {
                        Text("Мероприятие")
                            .font(AppTypography.delaButton)
                            .foregroundColor(.indigoBlue)
                            .frame(width: 172, height: 97)
                            .background(Color.lightBlue)
                            .cornerRadius(50)
                    }
                    
                    // 🔐 Мошенники (.scammersMenu)
                    // Фон: purpleCust, Текст: lightBlue, Высота: 97, Ширина: 172
                    Button(action: {
                        print("Мошенники")
                        onSelect("scammer")
                    }) {
                        Text("Мошенники")
                            .font(AppTypography.delaButton)
                            .foregroundColor(.lightBlue)
                            .frame(width: 172, height: 97)
                            .background(Color.purpleCust)
                            .cornerRadius(50)
                    }
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
            
            Spacer()
        }
        .background(Color.appBackground)
    }
}

#Preview {
    MenuView(onSelect: { _ in })
}
