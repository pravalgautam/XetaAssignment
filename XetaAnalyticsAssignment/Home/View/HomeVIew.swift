//
//  TabBarView.swift
//  XetaAnalyticsAssignment
//
//  Created by Praval Gautam on 02/04/24.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        
        TabView{
            NavigationView{
          Nav()
            }
                .tabItem {
                    Image("ActivityIcon")
                    Text("Activity")
                        .font(.system(size: 12))
                        .foregroundStyle(Color(UIColor.label))
                }
            Text("Goals")
                .tabItem {
                    Image("GoalsIcon")
                    Text("Goals")
                        .font(.system(size: 12))
                        .foregroundStyle(Color(UIColor.label))
                }
            Text("Camera")
                .tabItem {
                    Image("CameraIcon")
                    Text("Camera")
                        .font(.system(size: 12))
                        .foregroundStyle(Color(UIColor.label))
                }
            Text("Feed")
                .tabItem {
                    Image( "FeedIcon")
                    Text("Feed")
                        .font(.system(size: 12))
                        .foregroundStyle(Color(UIColor.label))
                }
            Text("Profile")
                .tabItem {
                    Image("ProfileIcon")
                    Text("Profile")
                        .font(.system(size: 12))
                        .foregroundStyle(Color(UIColor.label))
                }
        
        }

        
    }
}

#Preview {
    HomeView()
}
