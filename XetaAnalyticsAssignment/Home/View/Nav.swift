//
//  NavigationView.swift
//  XetaAnalyticsAssignment
//
//  Created by Praval Gautam on 02/04/24.
//

import SwiftUI

struct Nav: View {
    var body: some View {
        VStack {
            HStack(spacing: 23.21) {
                Text("Dietsnap")
                    .font(.system(size: 20))
                    .foregroundColor(Color.logo)
                    .padding(.leading, 21)
                Spacer()
                Image("Path 3476-2")
                    .resizable()
                    .frame(width: 14.56, height: 21.84)
                Image("633914-2")
                    .resizable()
                    .frame(width: 17.92, height: 21.84)
                Image("Path 3478-2")
                    .resizable()
                    .frame(width: 29.05, height: 29.05)
                    .padding(.trailing, 9)
            }
            .padding(.vertical, 10)
            
         
            ZStack {
                Divider()
                    .background(Color.black)
            
                    .shadow(color: Color.gray.opacity(0.9), radius: 2, x: 0, y: 1)
                    .blur(radius: 1)

            }
            
            Spacer()
            ActivityView()
        }
    }
}

#Preview {
    Nav()
}

