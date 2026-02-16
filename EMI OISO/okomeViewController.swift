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
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)

        NSLayoutConstraint.activate([
            bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            // これ大事：左右いっぱい（Adaptive banner でも安定）
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}
