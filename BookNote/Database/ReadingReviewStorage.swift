//
//  ReadingReviewStorage.swift
//  BookNote
//
//  Created by USER on 2022/08/27.
//

import Foundation

protocol ReadingReviewStorage {
    func requestAll(completion: (([ReadingReview]) -> Void))
    func save(_ readingReview: ReadingReview)
}
