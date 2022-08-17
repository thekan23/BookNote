//
//  AuthViewController.swift
//  BookNote
//
//  Created by 안덕환 on 2022/08/16.
//

import UIKit

/**
 역할
 - 로그인 되어있는지 여부를 체크하여, 만약 로그인되어 있다면 Main으로, 로그인되어 있지 않다면 로그인 페이지로 이동
 */
class AuthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "showMain", sender: self)
    }
}
