//
//  LocalizeStringProtocol.swift
//  MyTest
//
//  Created by 차종훈 on 25/6/2021.
//

import Foundation

internal protocol LocalizeStringProtocol {
    
    var localized: String { get }
    
    func localize(bundle: Bundle, tableName: String?) -> String
    
    func localize(bundle: Bundle, tableName: String?, arguments: CVarArg...) -> String
    
    func localize(bundle: Bundle, tableName: String?, dictionary: [String:String]) -> String
}
