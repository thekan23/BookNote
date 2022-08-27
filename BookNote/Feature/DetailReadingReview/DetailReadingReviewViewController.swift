//
//  DetailReadingReviewViewController.swift
//  BookNote
//
//  Created by USER on 2022/08/27.
//

import UIKit

class DetailReadingReviewViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    
    var readingReview: ReadingReview?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = readingReview?.title
        contentsLabel.text = readingReview?.contents
    }


}
