//
//  DataProvider.swift
//  InterviewQuestions
//

import Foundation

let dataProvider = DataProvider()

class DataProvider {
    
    public let restDataClient: RestDataClient = RestDataClient()
    
    func createQuestion(request: QuestionRequest, successHandler: ((Question) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.createQuestion(request: request, successHandler: successHandler, failHandler: failHandler)
    }
    
    func getAllQuestions(successHandler: (([Question]) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.getAllQuestions(successHandler: successHandler, failHandler: failHandler)
    }
    
    func getQuestionByID(questionID: Int, successHandler: ((Question) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.getQuestionByID(questionID: questionID, successHandler: successHandler, failHandler: failHandler)
    }
    
    func editQuestion(request: Question, successHandler: ((Question) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        restDataClient.editQuestion(request: request, successHandler: successHandler, failHandler: failHandler)
    }
}
