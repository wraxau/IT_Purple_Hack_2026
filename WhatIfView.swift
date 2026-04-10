import SwiftUI

struct WhatIfView: View {
    let title: String
    let alternatives: [(label: String, action: () -> Void)]
    let onSkip: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
        
            Text("Мошенники")
                .font(.custom("DelaGothicOne-Regular", size: 17))
                .foregroundColor(.darkBlue)
                .padding(.top, 40)
            
            Spacer()
            
            Text("Как бы было...")
                .font(.custom("DelaGothicOne-Regular", size: 20))
                .foregroundColor(.darkBlue)
                .padding(.bottom, 30)
            
            VStack(spacing: 16) {
                
                ForEach(Array(alternatives.enumerated()), id: \.offset) { index, item in
                    Button(action: item.action) {
                        Text(item.label)
                            .font(.custom("DelaGothicOne-Regular", size: 18))
                    }
                    .appStyle(index == 0 ? .variantAButton : .variantCButton)
                }
            }
            .padding(.horizontal, 40)
            
            Spacer()
            Button(action: onSkip) {
                Text("Пропустить")
                    .font(.custom("DelaGothicOne-Regular", size: 18))
            }
            .appStyle(.variantCButton)
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
        }
        .background(Color(.systemBackground))
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    WhatIfView(
        title: "Как бы было...",
        alternatives: [
            ("Без страховки", {}),
            ("Со франшизой", {})
        ],
        onSkip: {}
    )
}

