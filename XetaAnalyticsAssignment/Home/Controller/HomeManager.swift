//
//  HomeManager.swift
//  XetaAnalyticsAssignment
//
//  Created by Praval Gautam on 02/04/24.
//

import Foundation

class HomeManager: ObservableObject {
    @Published var responseBody: ResponseBody?

    func fetchApi() async throws {
        guard let url = URL(string: "http://52.25.229.242:8000/homepage_v2/?format=json") else {
            throw URLError(.badURL)
        }
        
        print("Fetching data from URL:", url)
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        print("Received response with status code:", httpResponse.statusCode)
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
       // print(decodedData)
        
        DispatchQueue.main.async {
            self.responseBody = decodedData
        }
    }

}

enum NetworkError: Error {
    case invalidResponse
}

