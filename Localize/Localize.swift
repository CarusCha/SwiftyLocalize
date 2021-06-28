//
//  Localize.swift
//  MyTest
//
//  Created by 차종훈 on 23/6/2021.
//

import Foundation

public class Localize: LocalizeProtocol {
    
    fileprivate static let CCCurrentLanguageKey = "CCCurrentLanguageKey"

    public static var deviceLanguage: String? {
        return Bundle.main.preferredLocalizations.first
    }
    
    public static func languages(_ bundle: Bundle = .main) -> [String] {
        return bundle.localizations.filter({$0 != "Base"})
    }
    
    public static func setCurrentLanguage(_ language: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(language, forKey: CCCurrentLanguageKey)
        userDefaults.synchronize()
    }
    
    public static func currentLanguage(_ bundle: Bundle = .main) -> String? {
        return (UserDefaults.standard.object(forKey: CCCurrentLanguageKey) as? String) ?? defaultLanguage(bundle)
    }
    
    public static func defaultLanguage(_ bundle: Bundle = .main) -> String? {
        if let deviceLanguage = deviceLanguage, languages(bundle).contains(deviceLanguage) {
            return deviceLanguage
        } else {
            return languages(bundle).first
        }
    }

}
