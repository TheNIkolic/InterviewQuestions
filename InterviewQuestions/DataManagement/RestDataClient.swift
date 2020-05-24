//
//  RestDataClient.swift
//  InterviewQuestions
//

import Alamofire

struct HTTPStatusCodes {
    public static let ok: Int = 200
    public static let badRequest: Int = 400
    public static let unathorizedRequest: Int = 401
    public static let notFound: Int = 404
    public static let internalServerError: Int = 500
    public static let serviceUnavailable: Int = 503
}

struct HTTPHeaderFields {
    public static let contentType = "Content-Type"
    public static let contentLength = "Content-Length"
    public static let authorization = "Authorization"
}

struct MIMETypes {
    public static let json = "application/json"
    public static let jpeg = "image/jpeg"
    public static let text = "text/plain"
}

struct ResponseKeys {
    static let DataKey: String = "data"
    static let ErrorsKey: String = "errors"
    static let MessageKey: String = "message"
}

class RestDataClient {
    
    private var baseUrl: String = "https://desolate-bayou-50540.herokuapp.com/api"
    
    private var headers: HTTPHeaders {
        return [
            HTTPHeaderFields.contentType: MIMETypes.json
        ]
    }
    
    func createQuestion(request: QuestionRequest, successHandler: ((Question) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = "\(baseUrl)/questions"
        
        AF.request(url.url!, method: .post, parameters: request.dictionary, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Question.self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let question = response.value else { return }
                    
                    successHandler?(question)
                    return
                }
                else {
                    errorResponse.message = "Server error - \(code)"
                }
            }
            else {
                errorResponse.error = "Server error - no response"
            }

            failHandler?(errorResponse)
        }
    }
    
    func getAllQuestions(successHandler: (([Question]) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = "\(baseUrl)/questions"
        
        AF.request(url.url!, method: .get, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: [Question].self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let questions = response.value else { return }
                    
                    successHandler?(questions)
                    return
                }
                else {
                    errorResponse.message = "Server error - \(code)"
                }
            }
            else {
                errorResponse.error = "Server error - no response"
            }

            failHandler?(errorResponse)
        }
    }
    
    func getQuestionByID(questionID: Int, successHandler: ((Question) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = "\(baseUrl)/questions/\(questionID)"
        
        AF.request(url.url!, method: .get, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Question.self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let question = response.value else { return }
                    
                    successHandler?(question)
                    return
                }
                else {
                    errorResponse.message = "Server error - \(code)"
                }
            }
            else {
                errorResponse.error = "Server error - no response"
            }

            failHandler?(errorResponse)
        }
    }
    
    func editQuestion(request: Question, successHandler: ((Question) -> Void)? = nil, failHandler: ((ErrorResponse) -> Void)? = nil) {
        
        let url: String = "\(baseUrl)/questions"
        
        AF.request(url.url!, method: .post, parameters: request.dictionary, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Question.self) { (response) in
            let errorResponse: ErrorResponse = ErrorResponse()
            if let code = response.response?.statusCode {
                if code >= 200 && code < 300 {
                    
                    guard let question = response.value else { return }
                    
                    successHandler?(question)
                    return
                }
                else {
                    errorResponse.message = "Server error - \(code)"
                }
            }
            else {
                errorResponse.error = "Server error - no response"
            }

            failHandler?(errorResponse)
        }
    }
    
    func deleteQuestion() {
        
    }
}
