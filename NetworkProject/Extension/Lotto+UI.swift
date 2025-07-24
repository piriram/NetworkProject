//
//  Lotto+UI.swift
//  NetworkProject
//
//  Created by piri kim on 7/24/25.
//

import UIKit

extension LottoViewController {
    func configureBall() {
        for _ in 0..<6 {
            let label = UILabel()
            label.text = ""
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 16)
            label.textColor = .white
            label.backgroundColor = .systemGray2
            label.clipsToBounds = true
            label.layer.cornerRadius = 20
            
            label.snp.makeConstraints { make in
                make.size.equalTo(CGSize(width: 40, height: 40))
            }
            
            numberLabels.append(label)
            stackView.addArrangedSubview(label)
        }
        
        plusLabel.snp.makeConstraints { make in
            make.width.equalTo(40)
        }
        stackView.addArrangedSubview(plusLabel)
        
        bonusLabel.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        stackView.addArrangedSubview(bonusLabel)
    }
    func setupBallColor(for number: Int) -> UIColor {
        switch number {
        case 1...10: return .systemYellow
        case 11...20: return .cyan
        case 21...30: return .systemPink
        case 31...40: return .systemGray2
        case 41...45: return .systemGreen
        default: return .systemGray2
        }
    }
    func configureUI() {
        view.addSubview(tf)
        view.addSubview(infoLabel)
        view.addSubview(dateLabel)
        view.addSubview(resultLabel)
        view.addSubview(stackView)
        view.addSubview(bonusTextLabel)
        view.addSubview(line)
        
    }
    
}
