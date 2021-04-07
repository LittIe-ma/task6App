//
//  ViewController.swift
//  task6App
//
//  Created by yasudamasato on 2021/04/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var slider: UISlider!
    private var questionValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        resetGame()
    }

    private func resetGame() {

        questionValue = Int.random(in: 1...100)

        questionLabel.text = "\(questionValue)"

        slider.value = 50
    }

    private func alert(title:String, message:String) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: { [weak self] action in self?.resetGame() }))

        present(alertController, animated: true)
    }

    @IBAction private func decisionButton(_ sender: Any) {

        let number = Int(slider.value)

        let firstLine: String

        if questionValue == number {
            firstLine = "当たり!"
        }else{
            firstLine = "はずれ!"
        }

        alert(title: "結果", message: "\(firstLine)\nあなたの値: \(number)")
    }
}

