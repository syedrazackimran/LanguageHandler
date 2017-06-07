//
//  Theme.swift
//  ImuLanguageHandler
//
//  Created by Imu on 6/6/17.
//  Copyright © 2017 2ntkh. All rights reserved.
//

import UIKit

class Theme: NSObject {
    
    class func saveLanguage(str:String)  {
        var lng = ""
        switch (str) {
        case "en":
            lng = "en"
        case "km" :
            lng = "km"
        case "fr" :
            lng = "fr"
        case "ja" :
                lng = "ja"
        case "ko" :
            lng = "ko"
        case "es" :
            lng = "es"
        case "ta" :
            lng = "ta"
        default:
            lng = "en"
        }
        UserDefaults.standard.set(lng, forKey: "ImuLanguage")
        UserDefaults.standard.synchronize()
    }
    
    class  func getCurrentLanguage() -> String {
        return UserDefaults.standard.string(forKey: "ImuLanguage")!
    }
    class  func SetLanguageToApp()  {
        let savedValue = UserDefaults.standard.string(forKey: "ImuLanguage")!
        
        switch (savedValue) {
        case "en":
            setApplicationLanguage(language: EnglishUSLanguageShortName)
        case "km" :
           setApplicationLanguage(language: KhmerLanguageShortName)
        case "fr" :
          setApplicationLanguage(language: FrenchLanguageShortName)
        case "ja" :
           setApplicationLanguage(language: JapaneseLanguageShortName)
        case "ko" :
           setApplicationLanguage(language: KoreanLanguageShortName)
        case "es" :
          setApplicationLanguage(language: SpanishLanguageShortName)
        case "ta" :
            setApplicationLanguage(language: TamilLanguageShortName)
        default:
           setApplicationLanguage(language: EnglishUSLanguageShortName)
        }

    }
    
    
}
