//
//  ImULanguageHandler.swift
//  ImuLanguageHandler
//
//  Created by Imu on 6/6/17.
//  Copyright © 2017 2ntkh. All rights reserved.
//

import Foundation

// MARK: - Notification
public let ApplicationLanguageDidChangeNotification: String = "ImranApplicationLanguageDidChangeNotification"

// MARK: - Constants

let EnglishUSLanguageShortName: String = "en"
let KhmerLanguageShortName: String = "km"
let FrenchLanguageShortName: String = "fr"
let JapaneseLanguageShortName: String = "ja"
let KoreanLanguageShortName: String = "ko"
let SpanishLanguageShortName: String = "es"
let TamilLanguageShortName: String = "ta"


let EnglishUSLanguageLongName: String = "English(US)"
let KhmerLanguageLongName: String = "Khmer"
let FrenchLanguageLongName: String = "French"
let JapaneseLanguageLongName: String = "Japanese"
let KoreanLanguageLongName: String = "Korean"
let SpanishLanguageLongName: String = "Spanish"
let TamilLanguageLongName: String = "Tamil"

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
    if shortLanguage == EnglishUSLanguageShortName {
        return EnglishUSLanguageLongName
    }else if  shortLanguage == KhmerLanguageShortName {
        return KhmerLanguageLongName
    }
    else{
        return ""
    }
}



