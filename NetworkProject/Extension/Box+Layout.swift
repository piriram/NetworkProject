//
//  Box+Layout.swift
//  NetworkProject
//
//  Created by piri kim on 7/24/25.
//

import UIKit

extension BoxOfficeViewController {
    internal func configureLayout() {
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(tableView)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(16)
            make.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchTextField)
            make.leading.equalTo(searchTextField.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-16)
            make.width.equalTo(70)
            make.height.equalTo(40)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
