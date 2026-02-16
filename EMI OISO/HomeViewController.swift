//
//  HomeViewController.swift
//  EMI OISO
//
//  Created by emi oiso on 2026/02/14.
//

import UIKit
import GoogleMobileAds


class HomeViewController: UIViewController {
    
    
    
    var bannerView:GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()

        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-7923877881339580/8419542650"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)
    }

    private var galBottomToAdTop: NSLayoutConstraint?

    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        
        NSLayoutConstraint.activate([
            bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

//import UIKit
//import GoogleMobileAds
//
//class HomeViewController: UIViewController {
//
//    @IBOutlet weak var gal: UIImageView!   // ← Storyboardで接続してね
//
//    var bannerView: GADBannerView!
//
//    // gal の bottom 制約を保持して切り替える
//    private var galBottomToSafeArea: NSLayoutConstraint?
//    private var galBottomToAdTop: NSLayoutConstraint?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // ① まず gal を safeArea の下まで貼る制約を「コード側で」用意して保持
//        // （Storyboard側に bottom 制約が残っていると二重になるので、本来はStoryboardのgal.bottomは消すのが理想）
//        gal.translatesAutoresizingMaskIntoConstraints = false
//        galBottomToSafeArea = gal.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        galBottomToSafeArea?.isActive = true
//
//        // ② banner
//        bannerView = GADBannerView(adSize: GADAdSizeBanner)
//        bannerView.adUnitID = "ca-app-pub-7923877881339580/8419542650"
//        bannerView.rootViewController = self
//
//        addBannerViewToView(bannerView)
//
//        // ③ load
//        bannerView.load(GADRequest())
//    }
//
//    func addBannerViewToView(_ bannerView: GADBannerView) {
//        bannerView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(bannerView)
//
//        NSLayoutConstraint.activate([
//            bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            bannerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        ])
//
//        // ✅ ここで「gal.bottom = banner.top」に切り替える
//        // まず safeArea への bottom をOFF
//        galBottomToSafeArea?.isActive = false
//
//        // 次に banner.top への bottom をON
//        galBottomToAdTop?.isActive = false
//        galBottomToAdTop = gal.bottomAnchor.constraint(equalTo: bannerView.topAnchor, constant: 0)
//        galBottomToAdTop?.isActive = true
//    }
//}
