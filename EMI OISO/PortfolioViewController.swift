//
//  PortfolioViewController.swift
//  EMI OISO
//
//  Created by emi oiso on 2024/07/13.
//

import UIKit

//class PortfolioViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//    
//    @IBAction func openAppLink(_ sender: UIButton) {
//            if let url = URL(string: "https://apps.apple.com/jp/app/bmicheck/id6477571347") {
//                if UIApplication.shared.canOpenURL(url) {
//                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
//                }
//            }
//        }
//    
//}

class PortfolioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openAppLink(_ sender: UIButton) {
        guard let url = URL(string: "https://apps.apple.com/jp/app/bmicheck/id6477571347") else {
            // URLが無効である場合のエラー処理
            print("Invalid URL")
            return
        }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            // URLを開けない場合のユーザーフィードバック
            showAlert(message: "このURLは開けません。")
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "エラー", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
