//
//  LocalizeProtocol.swift
//  MyTest
//
//  Created by 차종훈 on 25/6/2021.
//

import Foundation

internal protocol LocalizeProtocol {
    
    static var deviceLanguage: String? { get }
    
    static func languages(_ bundle: Bundle) -> [String]
        
    static func currentLanguage(_ bundle: Bundle) -> String?
    
    static func setCurrentLanguage(_ language: String)
        
    static func defaultLanguage(_ bundle: Bundle) -> String?

}
