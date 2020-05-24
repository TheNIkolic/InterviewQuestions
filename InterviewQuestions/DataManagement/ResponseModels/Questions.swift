//
//  Questions.swift
//  InterviewQuestions
//

import Foundation

class Question: Codable {
    
    var id: Int = 0
    var text: String = ""
    var reasonForAking: String = ""
}

extension Question {
    enum CodingKeys: String, CodingKey {
        case id
        case text
        case reasonForAking
    }
}
