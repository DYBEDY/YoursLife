//
//  TitleModel.swift
//  YourLife
//
//  Created by Roman on 03.01.2022.
//

import Foundation

struct LoginSteps {
var steps: Steps

    static func takeAStep() -> [LoginSteps] {
        [LoginSteps(steps: Steps.step1),
         LoginSteps(steps: Steps.step2),
         LoginSteps(steps: Steps.step3)
        ]
        
        
        
    }
}

    enum Steps: String {
        case step1 = "Мы верим, что с помощью нашего приложения, ты поймешь ценность каждого отведенного тебе дня, давай начнем со знакомства, как тебя зовут?"
        case step2 = " dkvodskvobobkfo"
        case step3 = "dvdvmd"
    }
    
    
    
    


