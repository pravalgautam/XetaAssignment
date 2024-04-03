//
//  ActivityView.swift
//  XetaAnalyticsAssignment
//
//  Created by Praval Gautam on 02/04/24.
//
import SwiftUI


struct ActivityView: View {
    @ObservedObject var homeManager = HomeManager()
  
    @State private var isSliderActive = false
     @State private var goalSetted = false
     

     var body: some View {
         ScrollView(showsIndicators: false) {
             VStack(alignment: .center) {
                 if let response = homeManager.responseBody {
                     
                     Text("Today")
                         .bold()
                     Text("Thursday, 22 Oct")
                         .foregroundStyle(.gray)
                     
                     VStack {
                         Spacer()
                         
                         HStack(alignment: .center, spacing: 42) {
                             ZStack {
                                 if !isSliderActive {
                                     Circle()
                                         .stroke(style: StrokeStyle(lineWidth: 9, lineCap: .round, lineJoin: .round))
                                         .foregroundColor(.ring1)
                                         .opacity(0.5)
                                         .frame(height: 221)
                                         .opacity(isSliderActive ? 0 : 1)
                                         
                                         .overlay{
                                             Circle()
                                                 .foregroundColor(.ring1)
                                             
                                                 .frame(width: 9)
                                                 .offset(y:-110)
                                         }
                                                    
                                     
                                     Circle()
                                         .stroke(style: StrokeStyle(lineWidth: 9, lineCap: .round, lineJoin: .round))
                                         .foregroundColor(.ring2)
                                         .opacity(0.5)
                                         .frame(height: 177)
                                         .overlay{
                                             Circle()
                                                 .foregroundColor(.ring2)
                                                 .frame(width: 9)
                                                 .offset(y:-89)
                                         }
                                         .overlay {
                                             Text("SET GOAL!")
                                                 .font(.system(size: 23))
                                                 .bold()
                                                 .opacity(isSliderActive ? 0 : 1)
                                         }
                                     
                                     HStack {
                                         Spacer()
                                         if goalSetted {
                                             Image(systemName: "chevron.backward")
                                                 .background(.ring1)
                                                 .onTapGesture {
                                                     withAnimation {
                                                         isSliderActive.toggle()
                                                         goalSetted = false
                                                     }
                                                 }
                                         } else {
                                             Image(systemName: "chevron.forward")
                                                 .onTapGesture {
                                                     withAnimation {
                                                         isSliderActive.toggle()
                                                         goalSetted = true
                                                  
                                                     }
                                                 }
                                         }
                                     }
                                 } else {
                                     if goalSetted {
                                         Text("No Data To Preview")
                                             .font(.system(size: 23))
                                             .bold()
                                             .transition(.slide)
                                             .animation(.default)
                                     }
                                 }
                             }.padding()
                             
                             if isSliderActive {
                                 Spacer()
                             }
                         }
                         
                         
                         
                         if !isSliderActive {
                             HStack {
                                 Image("Path 3065")
                                 Text("Diet Pts")
                                 Image("ic_fitness_center_24px")
                                 Text("Exercise Pts")
                             }
                             .transition(.opacity)
                             
                             HStack(spacing: 40) {
                                 VStack {
                                     Text("1500")
                                         .foregroundColor(.logo)
                                     Text("Cal")
                                 }
                                 VStack {
                                     Text("3/5")
                                         .foregroundColor(.logo)
                                     Text("Days")
                                 }
                                 VStack {
                                     Text("88")
                                         .foregroundColor(.logo)
                                     Text("Health Score")
                                 }
                             }
                             .transition(.opacity)
                         }
                     }
                     
                     HStack{
                         Circle()
                             .frame(height: 10)
                             .foregroundColor(!isSliderActive ? .logo : .gray)
                         Circle()
                             .frame(height: 10)
                             .foregroundColor(!isSliderActive ? .gray : .logo)
                     }
                     .padding()
                     HStack(spacing:30){
                         Text("Your Goals")
                             .bold()
                         Spacer()
                     }
                     VStack(alignment:.leading){
                         HStack(spacing:20){
                             Image("▪︎ Bitmap")
                             VStack(alignment:.leading){
                                 Text(response.data.section_1.plan_name)
                                     .foregroundStyle(Color(UIColor.label))
                                 Text("Curren Major Goal")
                                     .foregroundStyle(.gray)
                             }
                             Spacer()
                             ZStack {
                                 Circle()
                                     .trim(from: 0.0, to: calculateEndTrim(response.data.section_1.progress))
                                     .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                                     .foregroundColor(.ring1)
                                     .frame(width: 43, height: 43)
                                     .overlay{
                                         Text(response.data.section_1.progress)
                                         
                                             .font(.caption2)
                                     }
                                 
                             }
                         } .padding(20)
                             .background(.bg1)
                             .cornerRadius(10)
                         
                     }
                       
                     
                     .padding(.vertical,20)
                     HStack(spacing:30){
                         Text("Explore")
                             .bold()
                         Spacer()
                     }
                     VStack(alignment:.leading){
                         HStack(spacing:20){
                             Image("Group 4051")
                             VStack(alignment:.leading){
                                 Text("Find Diets")
                                 Text("Find premade diets according to your cuisine")
                                     .foregroundStyle(.gray)
                             }
                             
                         }
                         HStack(spacing:20){
                             Image("Group 4053")
                             VStack(alignment:.leading){
                                 Text("Find Nutritionist")
                                 Text("Get customized diets to achieve your health goal")
                                     .foregroundStyle(.gray)
                             }
                             
                         }
                     }
                     
                     
                     
                     
                 }
             }.padding(10)
                 .onAppear{
                     Task {
                         
                         do {
                             try await homeManager.fetchApi()
                         } catch {
                             print("Error initializing HomeManager: \(error.localizedDescription)")
                         }
                     }
                 }
         }
        
    }
    
}
private func calculateEndTrim(_ progress: String) -> CGFloat {
    let progressWithoutPercentage = progress.replacingOccurrences(of: "%", with: "")
    
    guard let progressValue = Double(progressWithoutPercentage) else {
        return 0
    }
    return CGFloat(progressValue / 100)
}



#Preview {
    ActivityView()
}
