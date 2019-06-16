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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    @IBAction private func run(_ sender: Any) {
        let editor = TextEditor(url: "https://en.wikipedia.org/wiki/Mobile_operating_system")
        
        let single = editor.word(number: 10)
        let word = editor.every(number: 10)

        singleWordLabel?.text = single
        multipleWordTextView?.text = word
    }
    
    @IBAction private func reset(_ sender: Any) {
        clearAll()
    }
    
    private func clearAll(){
        singleWordLabel?.text = ""
        multipleWordTextView?.text = ""
        wordCounterLabel?.text = ""
    }
}
