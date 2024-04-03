//
//  FoodInfoModel.swift
//  XetaAnalyticsAssignment
//
//  Created by Praval Gautam on 03/04/24.
//

import Foundation


struct FoodResponseBody: Decodable {
    let success: Bool
    let data: RecipeData
    let message: String
}

struct RecipeData: Decodable {
    let _id: String
    let api_name: [String]
    let badge_indicator: String
    let credits_url: String
    let cuisine: String
    let description: String
    let generic_facts: [String]
    let health_rating: Double
    let image: String
    let image_url: String
    let ingredients: [Ingredient]
    let itemtype: String
    let name: String
    let no_of_servings: Double
    let nutrition_facts: String
    let nutrition_info_scaled: [NutritionInfoScaled]
    let serving_sizes: [ServingSize]
    let similar_items: [SimilarItem]
    let type: String
    let default_unit_serving: String
}

struct Ingredient: Decodable {
    let ingid: String
    let name: String
    let value: Double
}

struct NutritionInfoScaled: Decodable {
    let name: String
    let value: Double
    let units: String
}

struct ServingSize: Decodable,Hashable {
    let units: String
    let name: String
    let value: Double
}

struct SimilarItem: Decodable {
    let _id: String
    let name: String
    let image: String
}
