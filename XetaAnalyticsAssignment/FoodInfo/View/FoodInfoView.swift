//
//  FoodInfoView.swift
//  XetaAnalyticsAssignment
//
//  Created by Praval Gautam on 03/04/24.
//

import SwiftUI

struct FoodInfoView: View {
    @StateObject var foodInfoManager = FoodInfoManager()
var img = ["img1","img2","img3"]
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment:.leading){
                if let foodData = foodInfoManager.foodresponseBody?.data {
                    ZStack {
                        Image("chicken_fried_resized")
                            .resizable()
                            .frame(height: 317)
                        Spacer()
                        HStack {
                            VStack(alignment:.leading) {
                                Text("Food Information")
                                    .bold()
                                    .font(.system(size: 18))
                                    .foregroundStyle(.white)
                                Text(foodData.name)
                                    .font(.system(size: 28, weight: .heavy))
                                    .foregroundStyle(.white)
                            }
                            Spacer()
                            VStack {
                                Text(String(format: "%.0f", foodData.health_rating))
                                    .foregroundStyle(.white)
                                    .font(.system(size: 24))
                                Text(" out of 100")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 10))
                            }
                            .frame(width: 100, height: 100)
                            .background(.gray)
                            .opacity(0.8)
                            .cornerRadius(10)
                        }
                        .padding(.top, 180)
                        .padding()
                    }
                    
                    Text("Description")
                        .bold()
                        .foregroundStyle(Color(UIColor.label))
                        .font(.system(size: 27))
                        .padding(.horizontal, 16)
                    Text(foodData.description)
                        .padding()
                    Text("Macro Nutrients")
                        .bold()
                        .font(.system(size: 27))
                        .padding(.horizontal, 16)
                    MacroNutrition(servingSizes: foodData.nutrition_info_scaled)
         
                    Text("Facts")
                        .bold()
                        .font(.system(size: 27))
                        .padding(.horizontal, 16)
                    FactsCard(genericFacts: foodData.generic_facts)
                    
                 Text("Similar Items")
                        .bold()
                        .font(.system(size: 27))
                        .padding(.horizontal, 16)
                    ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(img.indices, id: \.self) { index in
                                        ZStack{
                                            Image(img[index])
                                                .resizable()
                                                .frame(width: 157, height: 113)
                                                .cornerRadius(10)
                                            VStack{
                                                Spacer()
                                                Text(foodData.similar_items[index].name)
                                                    .font(.system(size: 16,weight:.heavy ))
                                                    .foregroundStyle(.white)
                                                    
                                                    .padding(10)
                                            }
                                        }
                                    }
                                }
                                .padding(.horizontal,17)
                    }
                    
                } else {
                    Text("Loading...")
                }
            }
        }
        .onAppear {
            Task {
                await foodInfoManager.fetchApi()
            }
        }  
        .ignoresSafeArea()
    }
}

#Preview(body: {
    FoodInfoView()
})
struct MacroNutrition: View {
    var servingSizes: [NutritionInfoScaled]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 1)
                .background(RoundedRectangle(cornerRadius: 5).fill(Color.table))
            
            VStack(alignment: .leading) {
                HStack() {
                    Spacer()
                    Text("Per Serve")
                        .font(.system(size: 12))
                        .padding(.horizontal,20)
                        .padding(.vertical,10)
                   
                }

                   Rectangle()
                    .frame(width: 300,height: 1)
                ForEach(servingSizes.prefix(6), id: \.self.name) { servingSize in
                    ServingSizeCard(servingSize: servingSize)
                    
                }
            }
   
        }
        .padding(.horizontal,48)
    }
}

struct ServingSizeCard: View {
    var servingSize: NutritionInfoScaled
    
    var body: some View {
        HStack {
            Text(servingSize.name)
                .font(.headline)
                .padding(.horizontal, 20)
            Spacer()
            Text(String(format: "%.1f \(servingSize.units)", servingSize.value))
                .font(.system(size: 12))
                .padding(.trailing, 20)
        }
        .padding(.vertical, 3)
      
    }
}


struct FactsCard: View {
    var genericFacts: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(0..<genericFacts.count, id: \.self) { index in
                    FactCard(fact: genericFacts[index], cardColor: .facts)
                        .foregroundStyle(.white)
                }
            }
            .padding(.horizontal, 17)
        }
    }
}

struct FactCard: View {
    var fact: String
    var cardColor : Color
    
    var body: some View {
        VStack {
            Text("Did you know?")
                .foregroundStyle(.white)
                .font(.headline)
                .padding(.horizontal,10)
            Text(fact)
        }
        .padding()
        .frame(width: 343, height: 184)
        .background(cardColor)
        .cornerRadius(10)
    }
}
