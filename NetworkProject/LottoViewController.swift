//
//  LottoViewController.swift
//  NetworkProject
//
//  Created by piri kim on 7/23/25.
//
import UIKit
import SnapKit

class LottoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let rounds = Array(1...1181)
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
        label.font = .boldSystemFont(ofSize: 20)
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
        view.backgroundColor = .white
        configureUI()
        configureLayout()
        configureBall()
        
        tf.inputView = pv
        pv.delegate = self
        pv.dataSource = self
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
    
    func configureBall() {
        for _ in 0..<6 {
            let label = UILabel()
            label.text = ""
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 16)
            label.textColor = .white
            label.backgroundColor = .lightGray
            label.clipsToBounds = true
            label.layer.cornerRadius = 20
            
            label.snp.makeConstraints { make in
                make.size.equalTo(CGSize(width: 40, height: 40))
            }
            
            numberLabels.append(label)
            stackView.addArrangedSubview(label)
        }
        
        plusLabel.snp.makeConstraints { make in
            make.width.equalTo(12)
        }
        stackView.addArrangedSubview(plusLabel)
        
        bonusLabel.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        stackView.addArrangedSubview(bonusLabel)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rounds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(rounds[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let round = rounds[row]
        tf.text = "\(round)"
        
        let roundText = "\(round)회 "
        let resultText = "당첨결과"
        let fullText = roundText + resultText
        
        let attributedText = NSMutableAttributedString(string: fullText)
        attributedText.addAttribute(.foregroundColor, value: UIColor.systemYellow, range: NSRange(location: 0, length: roundText.count))
        attributedText.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: roundText.count, length: resultText.count))
        
        resultLabel.attributedText = attributedText
        
        let mainNumbers = (1...45).shuffled().prefix(6).sorted()
        let bonusNumber = (1...45).filter { !mainNumbers.contains($0) }.randomElement() ?? 1
        
        updateNumbers(main: Array(mainNumbers), bonus: bonusNumber)
    }

    func updateNumbers(main: [Int], bonus: Int) {
        for (index, label) in numberLabels.enumerated() {
            let number = main[index]
            label.text = "\(number)"
            label.backgroundColor = setupBallColor(for: number)
        }
        bonusLabel.text = "\(bonus)"
        bonusLabel.backgroundColor = .gray
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
}
