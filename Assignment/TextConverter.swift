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
        guard sourceArray.count > number && number > 0
            else { return ""}
        var newString = ""
        for (index, value) in sourceArray.enumerated() {
            if index != 0 && index % number == 0 {
                newString.append("\(value)\n")
            }
        }
        return newString
    }
    
    func totalWords() -> String {
        return String(sourceArray.count)
    }
    
    func wordCounts() -> String {
        let dictionary = sourceArray.reduce(into: [:]) { counts, number in
            counts[number, default: 0] += 1
        }.sorted{ $0.value > $1.value }
        
        var printableString = ""
        for (key, counter) in dictionary {
            printableString.append("\(key) - \(counter) \n")
        }
        return printableString
    }
}
