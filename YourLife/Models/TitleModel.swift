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
        case step1 = " Давай начнем со знакомства, как тебя зовут?"
        case step2 = "Расскажи нам, когда ты появился на свет? Это поможет быстрее посчитать количество прожитых тобой дней"
        case step3 = "Поговорим немного о грустном, когда-нибудь мы все покинем этот дивный мир. Укажи дату, которую считаешь подходящей для своего ухода, выбирай тщательнее, от этого будет зависеть вся твоя жизнь"
    }
    
    
    
    


