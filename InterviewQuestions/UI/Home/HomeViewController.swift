//
//  HomeViewController.swift
//  InterviewQuestions
//

import UIKit

class HomeViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemTeal
        
//        /// get all question
//        dataProvider.getAllQuestions(successHandler: { (questions) in
//            for question in questions {
//                print(question.text)
//            }
//        }) { (Error) in
//            //
//        }
//
//        /// get single question by ID
//        dataProvider.getQuestionByID(questionID: 2, successHandler: { (question) in
//            print(question.text)
//        }) { (_) in
//            //
//        }
//
//        /// create new question
//        var questionToCreate: QuestionRequest = QuestionRequest()
//        questionToCreate.text = "from iOS 1"
//        questionToCreate.reasonForAking = "reason from iOS 1"
//
//        dataProvider.createQuestion(request: questionToCreate, successHandler: { (question) in
//            print(question.text, question.reasonForAking)
//        }) { (_) in
//            //
//        }
        
        /// edit exsiting question
        let questionToEdit: Question = Question()
        questionToEdit.id = 3
        questionToEdit.text = "edited from iOS second time"
        questionToEdit.reasonForAking = "edited from iOS"
        
        dataProvider.editQuestion(request: questionToEdit, successHandler: { (question) in
            print(question.id, question.text)
        }) { (_) in
            //
        }
    }
}
