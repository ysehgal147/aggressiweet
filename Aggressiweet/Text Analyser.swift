//
//  Text Analyser.swift
//  Aggressiweet
//
//  Created by Yogesh Sehgal on 30/07/20.
//  Copyright © 2020 Yogesh Sehgal. All rights reserved.
//

import Foundation
import CoreML

let textClassifier = TweetAnalyser()

func text_analyse(analyse: String)->String{
    var result: String = ""
    do{
        if analyse == ""{
            result = "Enter Some Keywords"
        }
        else{
        let input_text = TweetAnalyserInput(text: analyse)
        let predict = try textClassifier.prediction(input: input_text)
        print(predict.label)
        if predict.label == "CAG"{
            result="Covertly-Aggressive"
        }
        else if predict.label == "OAG"{
            result="Overtly-Aggressive"
        }
        else if predict.label == "NAG"{
            result="Non-Aggressive"
            }
        }
    }
    catch{
        print("Analysis Error \(error)")
        result = "Error Occured"
    }
    return result
}
