//
//  ViewController.swift
//  NetworkProject
//
//  Created by piri kim on 7/23/25.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func lottoClicked(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "LottoViewController")
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func movieClicked(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "BoxOfficeViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
}

