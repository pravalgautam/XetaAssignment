//
//  HomeModel.swift
//  XetaAnalyticsAssignment
//
//  Created by Praval Gautam on 03/04/24.
//

import Foundation


struct ResponseBody: Decodable {
    let success: Bool
    let data: ResponseData
    let message: String
}

struct ResponseData: Decodable {
    let section_1: Section1
    let section_2: Section2
    let section_3: Section3
    let section_4: Section4
}

struct Section1: Decodable {
    let plan_name: String
    let progress: String
}

struct Section2: Decodable {
    let accuracy: String
    let workout_duration: String
    let reps: Int
    let calories_burned: Int
}

struct Section3: Decodable {
    let plan_1: PlanDetail
    let plan_2: PlanDetail
}

struct PlanDetail: Decodable {
    let plan_name: String
    let difficulty: String
}

struct Section4: Decodable {
    let category_1: CategoryDetail
    let category_2: CategoryDetail
}

struct CategoryDetail: Decodable {
    let category_name: String
    let no_of_exercises: String
}
