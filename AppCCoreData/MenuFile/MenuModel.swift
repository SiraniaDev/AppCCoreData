//
//  MenuModel.swift
//  AppCCoreData
//
//  Created by Nadia Mettioui on 18/07/2020.
//  Copyright © 2020 Sirania'Dev. All rights reserved.
//

import Foundation


enum MenuModel {
    case form1
    case form2
    case form3
    case form4
}

extension MenuModel {
    var title : String{
        switch self {
        case .form1:
            return "Google My Business"
        case .form2:
            return "Google Analytics"
        case .form3:
            return "Coding Pour les enfants"
        case .form4:
            return "Form4"
        }
    }
    var icon : String{
           switch self {
           case .form1:
               return "waveform.path.ecg"
           case .form2:
               return "heart.fill"
           case .form3:
               return "gamecontroller"
           case .form4:
               return "tv"
           }
       }
}
