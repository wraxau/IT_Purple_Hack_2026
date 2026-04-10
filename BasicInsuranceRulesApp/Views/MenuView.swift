import SwiftUI

struct MenuView: View {
    let onSelect: (String) -> Void
    
    // Явные цвета из твоего AppButtonStyle
    private let lightBlue = Color(red: 192/255, green: 224/255, blue: 255/255)    // #C0E0FF
    private let indigoBlue = Color(red: 136/255, green: 162/255, blue: 255/255)    // #88A2FF
    private let pinkCust = Color(red: 255/255, green: 178/255, blue: 247/255)      // #FFB2F7
    private let lime = Color(red: 226/255, green: 251/255, blue: 134/255)          // #E2FB86
    private let darkBlue = Color(red: 37/255, green: 58/255, blue: 130/255)        // #253A82
    private let purpleCust = Color(red: 167/255, green: 148/255, blue: 255/255)    // #A794FF
    
    var body: some View {
        VStack(spacing: 0) {
            
            // 1. Заголовок "Сценарии"
            Text("Сценарии")
                .font(.custom("DelaGothicOne-Regular", size: 17))
                .foregroundColor(darkBlue)
                .padding(.top, 40)
            
            // 2. Заголовок "Выбери тему"
            Text("Выбери тему")
                .font(.custom("DelaGothicOne-Regular", size: 24))
                .foregroundColor(darkBlue)
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
                            .font(.custom("DelaGothicOne-Regular", size: 17))
                            .foregroundColor(lime)
                            .frame(width: 172, height: 97)
                            .background(indigoBlue)
                            .cornerRadius(50)
                    }
                    
                    // 🐾 Питомцы (.petMenu)
                    // Фон: lime, Текст: darkBlue, Высота: 97, Ширина: 172
                    Button(action: {
                        print("Питомцы")
                        onSelect("pet")
                    }) {
                        Text("Питомцы")
                            .font(.custom("DelaGothicOne-Regular", size: 17))
                            .foregroundColor(darkBlue)
                            .frame(width: 172, height: 97)
                            .background(lime)
                            .cornerRadius(50)
                    }
                    
                    // 🧗 Спорт (.sportMenu)
                    // Фон: darkBlue, Текст: pinkCust, Высота: 97, Ширина: 172
                    Button(action: {
                        print("Спорт")
                        onSelect("sport")
                    }) {
                        Text("Спорт")
                            .font(.custom("DelaGothicOne-Regular", size: 17))
                            .foregroundColor(pinkCust)
                            .frame(width: 172, height: 97)
                            .background(darkBlue)
                            .cornerRadius(50)
                    }
                    
                    // ✈️ Путешествие (.travelMenu)
                    // Фон: pinkCust, Текст: lime, Высота: 97, Ширина: 172
                    Button(action: {
                        print("Путешествие")
                        onSelect("travel")
                    }) {
                        Text("Путешествие")
                            .font(.custom("DelaGothicOne-Regular", size: 17))
                            .foregroundColor(lime)
                            .frame(width: 172, height: 97)
                            .background(pinkCust)
                            .cornerRadius(50)
                    }
                    
                    // 🎫 Мероприятие (.eventMenu)
                    // Фон: lightBlue, Текст: indigoBlue, Высота: 97, Ширина: 172
                    Button(action: {
                        print("Мероприятие")
                        onSelect("event")
                    }) {
                        Text("Мероприятие")
                            .font(.custom("DelaGothicOne-Regular", size: 17))
                            .foregroundColor(indigoBlue)
                            .frame(width: 172, height: 97)
                            .background(lightBlue)
                            .cornerRadius(50)
                    }
                    
                    // 🔐 Мошенники (.scammersMenu)
                    // Фон: purpleCust, Текст: lightBlue, Высота: 97, Ширина: 172
                    Button(action: {
                        print("Мошенники")
                        onSelect("scammer")
                    }) {
                        Text("Мошенники")
                            .font(.custom("DelaGothicOne-Regular", size: 17))
                            .foregroundColor(lightBlue)
                            .frame(width: 172, height: 97)
                            .background(purpleCust)
                            .cornerRadius(50)
                    }
                    
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
            
            Spacer()
        }
        .background(Color.white)
    }
}

#Preview {
    MenuView(onSelect: { _ in })
}
