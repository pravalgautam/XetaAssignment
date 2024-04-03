//
//  FoodInfoManager.swift
//  XetaAnalyticsAssignment
//
//  Created by Praval Gautam on 03/04/24.
//
import Foundation

class FoodInfoManager: ObservableObject {
    @Published var foodresponseBody: FoodResponseBody?
    
    func fetchApi() async {
        guard let url = URL(string: "http://52.25.229.242:8000/food_info/?format=json") else {
            print("Invalid URL")
            return
        }
        
        print("Fetching data from URL:", url)
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response:", response)
                return
            }
            
            print("Received response with status code:", httpResponse.statusCode)
            print("Data received:", String(data: data, encoding: .utf8) ?? "")
            
            let decodedData = try JSONDecoder().decode(FoodResponseBody.self, from: data)
            print("Decoded Data:", decodedData)
            
            DispatchQueue.main.async {
                self.foodresponseBody = decodedData
            }
        } catch {
            print("Error fetching API:", error.localizedDescription)
        }
    }
}
