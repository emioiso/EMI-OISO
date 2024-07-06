//
//  HistoryViewController.swift
//  EMI OISO
//
//  Created by emi oiso on 2024/06/26.
//

import UIKit

class HistoryViewController: UIPageViewController {
    @IBOutlet weak var history32: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        history32.layer.borderWidth = 2
        history32.layer.borderColor = UIColor.black.cgColor
    }
}
