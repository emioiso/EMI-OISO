//
//  hatenaAtsumeViewController.swift
//  EMI OISO
//
//  Created by emi oiso on 2026/02/14.
//

import UIKit
import GoogleMobileAds

final class hatenaAtsumeViewController: UIViewController {

    // ===== AdMob =====
    private var bannerView: GADBannerView!

    // ===== Marquee =====
    // Storyboardで「アイコン5個をまとめたコンテナView」を用意して接続してね
    @IBOutlet weak var marqueeContainer: UIView!

    private var isMarqueeRunning = false

    // 速度（pt/sec）好みで調整
    private let marqueeSpeed: CGFloat = 30

    // CADisplayLink（transformアニメ中のヒットテストズレを回避する）
    private var displayLink: CADisplayLink?
    private var lastTimestamp: CFTimeInterval = 0
    private var marqueeX: CGFloat = 0

    // =====================
    // URL open
    // =====================
    @IBAction func openQiita(_ sender: UIButton) {
        print("Qiita tapped")
        openURL("https://qiita.com/emioiso")
    }

    @IBAction func openGithub(_ sender: UIButton) {
        print("Github tapped")
        openURL("https://github.com/emioiso")
    }

    @IBAction func openAtCoder(_ sender: UIButton) {
        print("AtCoder tapped")
        openURL("https://atcoder.jp/users/eoiso")
    }

    @IBAction func openNote(_ sender: UIButton) {
        print("note tapped")
        openURL("https://note.com/mild_bobcat5379")
    }

    @IBAction func openInsta(_ sender: UIButton) {
        print("instagram tapped")
        openURL("https://www.instagram.com/emi_oiso.official/")
    }

    private func openURL(_ string: String) {
        guard let url = URL(string: string) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    // =====================
    // Lifecycle
    // =====================
    override func viewDidLoad() {
        super.viewDidLoad()

        // ----- AdMob -----
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-7923877881339580/8419542650"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)

        // 念のため（無効化事故対策）
        marqueeContainer.isUserInteractionEnabled = true
        marqueeContainer.subviews.forEach { $0.isUserInteractionEnabled = true }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startMarqueeIfNeeded()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopMarquee()
    }

    // 端末回転/サイズ変更時に再計算（iPad等対策）
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if isMarqueeRunning {
            // 画面幅が変わるとループ位置がズレるので、右端からやり直す
            marqueeContainer.layoutIfNeeded()
        }
    }

    // =====================
    // AdMob layout
    // =====================
    private func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)

        NSLayoutConstraint.activate([
            bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }

    // =====================
    // Marquee (CADisplayLink)
    // =====================
    private func startMarqueeIfNeeded() {
        guard !isMarqueeRunning else { return }
        isMarqueeRunning = true

        // AutoLayoutの計算後にサイズ確定させる
        view.layoutIfNeeded()
        marqueeContainer.layoutIfNeeded()

        // 初期位置：右端の外から
        marqueeX = view.bounds.width
        marqueeContainer.transform = CGAffineTransform(translationX: marqueeX, y: 0)

        lastTimestamp = 0
        displayLink?.invalidate()
        displayLink = CADisplayLink(target: self, selector: #selector(stepMarquee(_:)))
        displayLink?.add(to: .main, forMode: .common) // UI操作中も止まりにくい
    }

    private func stopMarquee() {
        isMarqueeRunning = false
        displayLink?.invalidate()
        displayLink = nil
    }

    @objc private func stepMarquee(_ link: CADisplayLink) {
        guard isMarqueeRunning else { return }

        let contentWidth = marqueeContainer.bounds.width
        guard contentWidth > 1 else { return }

        // delta time
        if lastTimestamp == 0 { lastTimestamp = link.timestamp }
        let dt = link.timestamp - lastTimestamp
        lastTimestamp = link.timestamp

        // 左へ進める（pt/sec）
        marqueeX -= marqueeSpeed * CGFloat(dt)

        // 左端の外まで行ったら右端へ戻す
        if marqueeX <= -contentWidth {
            marqueeX = view.bounds.width
        }

        // model layer を更新（見えてる位置＝当たり判定になる）
        marqueeContainer.transform = CGAffineTransform(translationX: marqueeX, y: 0)
    }
}
