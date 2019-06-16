//
//  String+Extension.swift
//  Assignment
//
//  Created by ALINA HAMBARYAN on 6/13/19.
//  Copyright © 2019 ah. All rights reserved.
//

import Foundation

extension String {
    func stripOutHtmlAndMarkup() -> String? {
        do {
            guard let data = self.data(using: .unicode) else {
                return nil
            }
            let attributed = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html,
                                                                          .characterEncoding: String.Encoding.utf8.rawValue],
                                                    documentAttributes: nil)
            let removedChars = attributed.string.replacingOccurrences(of: "[0-9-_.%,\n\t\r\\\"\'()]", with: "", options: .regularExpression, range: nil)
            return removedChars
        } catch {
            return nil
        }
    }
}
