//
//  Lotto+Data.swift
//  NetworkProject
//
//  Created by piri kim on 7/24/25.
//

import Foundation

extension LottoViewController {
    func updateNumbers(main: [Int], bonus: Int) {
        for (index, label) in numberLabels.enumerated() {
            let number = main[index]
            label.text = "\(number)"
            label.backgroundColor = setupBallColor(for: number)
        }
        bonusLabel.text = "\(bonus)"
        bonusLabel.backgroundColor = .gray
    }
}
