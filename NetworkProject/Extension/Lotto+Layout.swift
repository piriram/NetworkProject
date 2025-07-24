//
//  Lotto+Layout.swift
//  NetworkProject
//
//  Created by piri kim on 7/24/25.
//

import UIKit

extension LottoViewController {
    func configureLayout() {
        tf.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(tf.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(infoLabel)
            make.trailing.equalToSuperview().offset(-20)
        }
        line.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(1)
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
        }
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(resultLabel.snp.bottom).offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(40)
        }
        
        bonusTextLabel.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(16)
            make.trailing.equalTo(stackView)
        }
    }
}
