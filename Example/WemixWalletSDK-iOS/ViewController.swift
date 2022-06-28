//
//  ViewController.swift
//  WemixWalletSDK-iOS
//
//  Created by jinsik on 05/18/2022.
//  Copyright (c) 2022 jinsik. All rights reserved.
//

import UIKit
import WemixWalletSDK_iOS

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer.init(target: self, action: #selector(didTapView(_:)))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(gesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        if sender.view is UITextField {
            return
        }
        
        self.view.endEditing(true)
    }

}
