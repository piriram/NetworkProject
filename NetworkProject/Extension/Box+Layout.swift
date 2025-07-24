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
        view.addSubview(line)
        
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.trailing.equalTo(searchButton.snp.leading).offset(-20)
            make.height.equalTo(50)
        }
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchTextField)
            make.leading.equalTo(searchTextField.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-16)
            make.width.equalTo(70)
            make.height.equalTo(50)
        }
        
        line.snp.makeConstraints { make in
            make.bottom.equalTo(searchTextField)
            make.horizontalEdges.equalTo(searchTextField)
            make.height.equalTo(4)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
