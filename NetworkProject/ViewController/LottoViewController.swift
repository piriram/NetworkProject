//
//  LottoViewController.swift
//  NetworkProject
//
//  Created by piri kim on 7/23/25.
//
import UIKit
import SnapKit

class LottoViewController: UIViewController {
    let rounds = Array(1...1181)
    
    // MARK: UI Component
    // 익명함수로 UI 컴포넌트를 언제 쓸까
    // 로드뷰?
    
    var numberLabels: [UILabel] = []
    
    let tf: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.textAlignment = .center
        tf.placeholder = "회차를 입력하세요"
        return tf
    }()
    
    let pv = UIPickerView()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "당첨번호 안내"
        label.textAlignment = .left
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "2020-05-30 추첨"
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .systemGray
        label.textAlignment = .right
        return label
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "당첨결과"
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        return label
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 6
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    
    let plusLabel: UILabel = {
        let label = UILabel()
        label.text = "+"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    let bonusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.backgroundColor = .systemGray2
        label.clipsToBounds = true
        label.layer.cornerRadius = 20
        return label
    }()
    
    let bonusTextLabel: UILabel = {
        let label = UILabel()
        label.text = "보너스"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    let line: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureLayout()
        configureBall()
        
        tf.inputView = pv
        pv.delegate = self
        pv.dataSource = self
        pv.selectRow(rounds.count-1, inComponent: 0, animated: true)
        pickerView(pv, didSelectRow: rounds.count-1, inComponent: 0) // 초기에 최근회차로 띄어줌
    }
}

