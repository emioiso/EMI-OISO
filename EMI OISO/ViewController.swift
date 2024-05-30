//
//  ViewController.swift
//  EMI OISO
//
//  Created by emi oiso on 2024/05/30.
//

import UIKit
import GoogleMobileAds

var bannerView:GADBannerView!

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-7923877881339580/8419542650"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)
        // Do any additional setup after loading the view.
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

