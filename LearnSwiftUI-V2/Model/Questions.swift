//
//  Questions.swift
//  LearnSwiftUI-V2
//
//  Created by admin on 4/9/21.
//

import Foundation

struct QuestionsResponse : Codable{
    var data : [DataQuestions?]
//    var meta : MetaQuestions
}

struct MetaQuestions : Codable {
    var code : Int
    var message : [String]
    var pagination : PaginationQuestions
}

struct PaginationQuestions : Codable {
    var exam_time, total_data, item_per_page : Int?
    var links : [String]?
}

struct DataQuestions : Codable, Identifiable {
    var id = UUID()
    var question_number, question_id : Int?
    var question_type, question_text, question_image : String?
    var answers : [AnswerQuestions?]
    
    enum CodingKeys: CodingKey {
        case question_number, question_id, question_type, question_text, question_image, answers
    }
}

struct AnswerQuestions: Codable, Identifiable {
    var id = UUID()
    var answer_number, answer_id : Int?
    var answer_text,answer_image : String?
    
    enum CodingKeys: CodingKey {
        case answer_number, answer_id, answer_text, answer_image
    }
}
