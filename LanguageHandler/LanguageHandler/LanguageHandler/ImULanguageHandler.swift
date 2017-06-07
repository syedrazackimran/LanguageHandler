//
//  ImULanguageHandler.swift
//  ImuLanguageHandler
//
//  Created by Imu on 6/6/17.
//  Copyright © 2017 2ntkh. All rights reserved.
//

import Foundation

// MARK: - Notification
public let ApplicationLanguageDidChangeNotification = "ImranApplicationLanguageDidChangeNotification"

// MARK: - Constants

let EnglishUSLanguageShortName = "en"
let KhmerLanguageShortName = "km"
let FrenchLanguageShortName = "fr"
let JapaneseLanguageShortName = "ja"
let KoreanLanguageShortName = "ko"
let SpanishLanguageShortName = "es"
let TamilLanguageShortName = "ta"


let EnglishUSLanguageLongName = "English(US)"
let KhmerLanguageLongName = "Khmer"
let FrenchLanguageLongName = "French"
let JapaneseLanguageLongName = "Japanese"
let KoreanLanguageLongName = "Korean"
let SpanishLanguageLongName = "Spanish"
let TamilLanguageLongName = "Tamil"

var _languagesLong : Any?  = nil

// MARK: - Bundle
var _localizedBundle: Bundle? = nil

func localizedBundle() -> Bundle {
    if (_localizedBundle == nil)
    {
        _localizedBundle = Bundle(path: (Bundle.main.path(forResource: applicationLanguage() as String, ofType: "lproj"))!)
    }
    return _localizedBundle!;
}
func applicationLanguage() -> String
{
    let languages: [Any]? = UserDefaults.standard.object(forKey: "AppleLanguages") as? [Any]
    return languages?.first as! String
}

// MARK: - Language
func setApplicationLanguage(language:String) {
    let oldLanguage: String = applicationLanguage()
    if (oldLanguage != language)  {
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()
        _localizedBundle =  Bundle(path: (Bundle.main.path(forResource: applicationLanguage() as String, ofType: "lproj"))!)
        NotificationCenter.default.post(name: NSNotification.Name(ApplicationLanguageDidChangeNotification), object: nil, userInfo: nil)
    }
}
func applicationLanguagesLong() -> Any
{
    if _languagesLong == nil {
        _languagesLong = [EnglishUSLanguageLongName,KhmerLanguageLongName]
    }
    return _languagesLong as Any
}
// MARK: - LocalizedString
func ImranLocalizedString (key:String,comment:String) -> String
{
    return localizedBundle().localizedString(forKey: key, value: "", table: nil)
}

func applicationLanguageLong() -> String{
    let language: String = applicationLanguage()
    return shortLanguageToLong(shortLanguage: language)
}

func shortLanguageToLong(shortLanguage:String) -> String {
    switch shortLanguage {
    case EnglishUSLanguageShortName:
        return EnglishUSLanguageLongName
        
    case KhmerLanguageShortName :
          return KhmerLanguageLongName
        
    case FrenchLanguageShortName :
        return FrenchLanguageLongName
        
    case JapaneseLanguageShortName :
        return JapaneseLanguageLongName
        
    case SpanishLanguageShortName :
        return SpanishLanguageLongName
        
    case TamilLanguageShortName :
        return TamilLanguageLongName
        
    default:
        return EnglishUSLanguageLongName
    }
}



