//
//  ViewController.swift
//  Assignment
//
//  Created by ALINA HAMBARYAN on 6/13/19.
//  Copyright © 2019 ah. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var singleWordLabel: UILabel!
    @IBOutlet private var multipleWordTextView: UITextView!
    @IBOutlet private var wordCounterLabel: UILabel!
    @IBOutlet private var wordTextView: UITextView!

    private let converter = TextConverter(url: "https://en.wikipedia.org/wiki/Mobile_operating_system")

    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    @IBAction private func run(_ sender: Any) {
        singleWordLabel?.text = converter.word(number: 10)
        multipleWordTextView?.text = converter.every(number: 10)
        wordCounterLabel?.text = converter.totalWords()
        wordTextView?.text = converter.wordCounts()
    }
    
    @IBAction private func reset(_ sender: Any) {
        clearAll()
    }
    
    private func clearAll(){
        singleWordLabel?.text = ""
        multipleWordTextView?.text = ""
        wordCounterLabel?.text = ""
        wordTextView?.text = ""
    }
}
