//
//  TriviaQuestion.swift
//  livetrivia
//
//  Created by macbook on 20/01/2020.
//  Copyright © 2020 macbook. All rights reserved.
//

import Foundation

class TriviaQuestion {
    
    let question: String
    let possibleAnswers: [String]
    
    
    init(question: String, possibleAnswers: [String]) {
        self.question = question
        self.possibleAnswers = possibleAnswers
    }
    
}
