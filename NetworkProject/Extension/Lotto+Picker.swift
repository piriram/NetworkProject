//
//  Lotto+Picker.swift
//  NetworkProject
//
//  Created by piri kim on 7/24/25.
//

import UIKit
// MARK:
extension LottoViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    
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
        attributedText.addAttribute(.foregroundColor,
                                    value: UIColor.systemYellow,
                                    range: NSRange(location: 0, length: roundText.count))
        attributedText.addAttribute(.foregroundColor,
                                    value: UIColor.black,
                                    range: NSRange(location: roundText.count,
                                                   length: resultText.count))
        
        resultLabel.attributedText = attributedText
        
        requestData(num: round) { lotto in
            guard let lotto = lotto else { return }
            
            self.updateNumbers(lotto:lotto)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rounds.count
    }
    
}


