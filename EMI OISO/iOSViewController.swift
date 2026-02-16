//
//  iOSViewController.swift
//  EMI OISO
//
//  Created by emi oiso on 2026/02/14.
//

import UIKit
import SafariServices
import GoogleMobileAds

class iOSViewController: UIViewController {
    
    var bannerView:GADBannerView!

    //実機でテストする2026/02/14のえみから未来のえみへ
    @IBAction func openbmi(_ sender: UIButton) {
        let appStoreURL = URL(string: "itms-apps://apps.apple.com/jp/app/id6477571347")!
        let webURL      = URL(string: "https://apps.apple.com/jp/app/id6477571347")!

        if UIApplication.shared.canOpenURL(appStoreURL) {
            UIApplication.shared.open(appStoreURL)
        } else {
            UIApplication.shared.open(webURL)
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
