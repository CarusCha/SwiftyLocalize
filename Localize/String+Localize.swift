//
//  String+Localize.swift
//  MyTest
//
//  Created by 차종훈 on 25/6/2021.
//

import Foundation

extension String: LocalizeStringProtocol {
    
    public var localized: String {
        return localize()
    }
    
    public func localize(bundle: Bundle = .main, tableName: String? = nil) -> String {
        if let currentLanguage = Localize.currentLanguage(bundle) {
            let currentLangPath = bundle.path(forResource: currentLanguage, ofType: "lproj")
            if let localizedLanguage = Bundle(path: currentLangPath ?? "")?.localizedString(forKey: self, value: nil, table: tableName), localizedLanguage != self {
                return localizedLanguage
            }
        }
        return self
    }
    
    public func localize(bundle: Bundle = .main, tableName: String? = nil, arguments: CVarArg...) -> String {
        return String(format: localize(bundle: bundle, tableName: tableName), arguments: arguments)
    }
    

    public func localize(bundle: Bundle = .main, tableName: String? = nil, dictionary: [String : String]) -> String {
        var localizedString = localize(bundle: bundle, tableName: tableName)
        for (key, value) in dictionary {
            localizedString = localizedString.replacingOccurrences(of: key, with: value)
        }

        return localizedString
    }

}
