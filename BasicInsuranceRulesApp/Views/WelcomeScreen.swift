import SwiftUI

struct WelcomeView: View {
    let onStart: () -> Void
    
    var body: some View {
        VStack(spacing: 24) {
            

            Image("welcome")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 287, maxHeight: 287)
                .padding(.top, 60)

            Text("Привет!")
                .font(.custom("DelaGothicOne-Regular", size: 28))
        
                .foregroundColor(Color(red: 47/255, green: 54/255, blue: 124/255))
                .padding(.top, 20)
            
            VStack(spacing: 16) {
                Text("Иногда в жизни случаются\nнеприятные ситуации.")
                    .multilineTextAlignment(.center)
                    .font(.custom("DelaGothicOne-Regular", size: 20))
                    .foregroundColor(Color(red: 47/255, green: 54/255, blue: 124/255))
                
                Text("Риск - это вероятность,\nчто такая ситуация\nпроизойдёт.")
                    .multilineTextAlignment(.center)
                    .font(.custom("DelaGothicOne-Regular", size: 20))
                    .foregroundColor(Color(red: 47/255, green: 54/255, blue: 124/255))
                
                Text("Давай посмотрим, какие\nбывают риски и как их\nможно предусмотреть.")
                    .multilineTextAlignment(.center)
                    .font(.custom("DelaGothicOne-Regular", size: 20))
                    .foregroundColor(Color(red: 47/255, green: 54/255, blue: 124/255))
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            Button(action: onStart) {
                Text("К темам")
                    .font(.custom("DelaGothicOne-Regular", size: 20))
                    .foregroundColor(Color(red: 47/255, green: 54/255, blue: 124/255))
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color(red: 224/255, green: 255/255, blue: 148/255))
            .cornerRadius(30)
            .shadow(color: .black.opacity(0.1), radius: 5, y: 5)
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
        }
        .background(Color.white)
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    WelcomeView(onStart: {})
}
