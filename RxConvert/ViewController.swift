//
//  ViewController.swift
//  RxCoverter
//
//  Created by Alvin Tu on 3/6/21.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    private let disposeBag = DisposeBag()

    @IBOutlet weak var poundsTextField: UITextField!
    
    @IBOutlet weak var kilogramsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        poundsTextField.keyboardType = .numberPad
        kilogramsTextField.keyboardType = .numberPad
        setUpPoundObserver()
        setUpKilogramObserver()
    }
}

private extension ViewController {
    func setUpPoundObserver() {
        poundsTextField.rx.controlEvent([.editingChanged])
            .asObservable()
            .subscribe(onNext: { [unowned self] in
                if let text = self.poundsTextField.text {
                    if let floatValue = Float(text) {
                        let value = floatValue * 0.45
                        self.kilogramsTextField.text = "\(value)"
                    }
                }
            })
            .disposed(by: disposeBag)
    }
    
    func setUpKilogramObserver() {
        kilogramsTextField.rx.controlEvent([.editingChanged])
            .asObservable()
            .subscribe(onNext: { [unowned self] in
                if let text = self.kilogramsTextField.text {
                    if let floatValue = Float(text) {
                        let value = floatValue * 2.204
                        self.poundsTextField.text = "\(value)"
                    }
                }
            })
            .disposed(by: disposeBag)
    }
}

