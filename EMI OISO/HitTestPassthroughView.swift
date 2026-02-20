//
//  HitTestPassthroughView.swift
//  EMI OISO
//
//  Created by emi oiso on 2026/02/17.
//
//

//
//  HitTestPassthroughView.swift
//  EMI OISO
//
//  Created by emi oiso on 2026/02/17.
//

import UIKit

final class HitTestPassthroughView: UIView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hit = super.hitTest(point, with: event)

        guard let hit else { return nil }

        // 自分自身がヒットした場合は通過させる
        if hit === self { return nil }

        // ヒットしたViewがUIControlならそれを返す（UIButtonなど）
        if let control = hit as? UIControl { return control }

        // 親を辿ってUIControlがあれば返す（画像やラベルをタップしてもボタンに届く）
        var v: UIView? = hit
        while let current = v {
            if let control = current as? UIControl { return control }
            if current === self { break }
            v = current.superview
        }

        // UIControlが無ければ通過
        return nil
    }
}
