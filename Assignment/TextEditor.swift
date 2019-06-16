//
//  TextEditor.swift
//  Assignment
//
//  Created by ALINA HAMBARYAN on 6/13/19.
//  Copyright © 2019 ah. All rights reserved.
//

import Foundation

final class TextEditor {
    var sourceArray = [String]()

    init(url: String) {
        if let url = URL(string: url){
            do {
                let contents = try String(contentsOf: url)
                let stringWithoutHtml = contents.stripOutHtml()!
                let stringWithoutN = stringWithoutHtml.replacingOccurrences(of: "\n", with: " ")
                let stringWithoutT = stringWithoutN.replacingOccurrences(of: "\t", with: " ")
                sourceArray = stringWithoutT.components(separatedBy: " ").filter({ $0 != ""})
            } catch let error {
                // contents could not be loaded
                print(error.localizedDescription)
            }
        }
    }
    
    func word(number: Int) -> String {
        if sourceArray.count > number {
            return sourceArray[number]
        }
        return ""
    }
    
    func every(number: Int) -> String {
        if sourceArray.count > number {
            var newString = ""
            for (index, value) in sourceArray.enumerated() {
                if index % number == 0 {
                    newString.append(value)
                    newString.append(", ")
                }
            }
            return newString
        }
        return ""
    }
}
