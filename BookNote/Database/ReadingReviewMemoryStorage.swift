//
//  ReadingReviewMemoryStorage.swift
//  BookNote
//
//  Created by USER on 2022/08/27.
//

import Foundation

class ReadingReviewMemoryStorage: ReadingReviewStorage {
    
    private var items: [ReadingReview] = [
        ReadingReview(
            id: "1",
            title: "피리를 부는 바람",
            contents: "글짓기 수업 시간에  「엄마의 런닝구」라는 시집을 읽었다."),
        ReadingReview(
            id: "2",
            title: "할머니의 수요일",
            contents: "현재에도 계속되고 있는 아픔임을 깨닫게 됩니다.")
    ]
    
    func requestAll(completion: (([ReadingReview]) -> Void)) {
        completion(items)
    }
    
    func save(_ readingReview: ReadingReview) {
        items.append(readingReview)
    }
}
