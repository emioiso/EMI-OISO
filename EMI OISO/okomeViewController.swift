//
//  okomeViewController.swift
//  EMI OISO
//
//  Created by emi oiso on 2026/02/14.
//

import UIKit
import GoogleMobileAds

class okomeViewController: UIViewController {
    
    var bannerView:GADBannerView!
    
    @IBAction func openNihonNougyouShinbun(_ sender: UIButton) {
        if let url = URL(string: "https://www.agrinews.co.jp/news/index/353665") {
            UIApplication.shared.open(url)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-7923877881339580/8419542650"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)
    }
    func addBannerViewToView(_ bannerView: GADBannerView){
                bannerView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(bannerView)
                view.addConstraints(
                    [NSLayoutConstraint(item: bannerView,
                                        attribute: .bottom,
                                        relatedBy: .equal,
                                        toItem: view.safeAreaLayoutGuide,
                                        attribute: .bottom,
                                        multiplier: 1,
                                        constant: 0),
                     NSLayoutConstraint(item: bannerView,
                                        attribute: .centerX,
                                        relatedBy: .equal,
                                        toItem: view,
                                        attribute: .centerX,
                                        multiplier: 1,
                                        constant: 0)
                    ])
            }
}
