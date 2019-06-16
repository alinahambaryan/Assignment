//
//  TextEditor.swift
//  Assignment
//
//  Created by ALINA HAMBARYAN on 6/13/19.
//  Copyright © 2019 ah. All rights reserved.
//

import Foundation

final class TextConverter {
    private var sourceArray = [String]()

    init(url: String) {
        if let url = URL(string: url){
            do {
                let contents = try String(contentsOf: url)
                let stringWithoutHtml = contents.stripOutHtmlAndMarkup()!
                sourceArray = stringWithoutHtml.components(separatedBy: " ").filter({ $0 != ""})

            } catch let error {
                // contents could not be loaded
                print(error.localizedDescription)
            }
        }
    }
    
    func word(number: Int) -> String {
        guard sourceArray.count > number
            else { return ""}
        return sourceArray[number]
    }
    
    func every(number: Int) -> String {
        guard sourceArray.count > number
            else { return ""}
        var newString = ""
        for (index, value) in sourceArray.enumerated() {
            if index != 0 && index % number == 0 {
                newString.append(value.trimmingCharacters(in: .whitespaces))
                newString.append("\n")
            }
        }
        return newString
    }
    
    func totalWords() -> String {
        return String(sourceArray.count)
    }
}
