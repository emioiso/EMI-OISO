//
//  sentoViewController.swift
//  EMI OISO
//
//  Created by emi oiso on 2026/02/14.
//

import UIKit
import GoogleMobileAds

class sentoViewController: UIViewController {
    
    var bannerView:GADBannerView!
    
    @IBAction func openAmidayu(_ sender: UIButton) {
        if let url = URL(string: "https://www.amidayu-suzu.com/") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func openAmidayuInsta(_ sender: UIButton) {
        if let url = URL(string: "https://www.instagram.com/amidayu.suzu/") {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func openAmdayuLine(_ sender: UIButton) {
        if let url = URL(string: "https://line.me/R/ti/p/@649gnlar?from=page&searchId=649gnlar") {
            UIApplication.shared.open(url)
        }
    }
    @IBAction func openGoogleMaps(_ sender: UIButton) {
        if let url = URL(string: "https://www.google.com/maps/place/%E6%B5%B7%E6%B5%9C%E3%81%82%E3%81%BF%E3%81%A0%E6%B9%AF/@37.4397783,137.270896,744m/data=!3m2!1e3!4b1!4m6!3m5!1s0x5ff6b4e957fe41bb:0xd9ef21027756ef79!8m2!3d37.4397741!4d137.2734709!16s%2Fg%2F1thk8lpx?entry=ttu&g_ep=EgoyMDI2MDIxMS4wIKXMDSoASAFQAw%3D%3D") {
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
