//
//  MovieCell.swift
//  NetworkProject
//
//  Created by piri kim on 7/24/25.
//

import UIKit
import SnapKit

class MovieTableViewCell: UITableViewCell {
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .right
        return label
    }()
    
    private let horizontalStack = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        contentView.backgroundColor = .black
        
        selectionStyle = .none
        backgroundColor = .clear
        
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(movie:DailyBoxOffice) {
        rankLabel.text = "\(movie.rank)"
        titleLabel.text = movie.movieNm
        dateLabel.text = movie.openDt
    }
    
    private func configureLayout() {
        contentView.addSubview(rankLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        
        rankLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
            make.width.width.equalTo(45)
            make.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(rankLabel.snp.trailing).offset(20)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(dateLabel.snp.leading).offset(-8)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-12)
//            make.width.lessThanOrEqualTo(20)
//            make.width.greaterThanOrEqualTo(20)
            make.width.equalTo(100)
            make.centerY.equalToSuperview()
        }
    }
    
    private func formatDate(from string: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        guard let date = formatter.date(from: string) else { return string }
        
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
}

