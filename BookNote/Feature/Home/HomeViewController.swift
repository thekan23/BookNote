//
//  HomeViewController.swift
//  BookNote
//
//  Created by USER on 2022/08/17.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let readingReviewStorage = ReadingReviewMemoryStorage()
    private(set) var items: [ReadingReview] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let readingReview = items[indexPath.item]
        var configuration = cell.defaultContentConfiguration()
        configuration.text = readingReview.title
        configuration.textProperties.font = .systemFont(ofSize: 18, weight: .black)
        configuration.textProperties.color = .label
        cell.contentConfiguration = configuration
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailReadingReviewViewController()
        detailVC.readingReview = items[indexPath.item]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

private extension HomeViewController {
    func setupViews() {
        title = "Reading Review's"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.handleDidTapPlusButton(_:)))
        ]
        tableView.alwaysBounceVertical = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func reloadData() {
        readingReviewStorage.requestAll(completion: { reviews in
            self.items = reviews
            self.tableView.reloadData()
        })
    }
    
    @objc func handleDidTapPlusButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "독서평 작성", message: nil, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "완료", style: .default, handler: { action in
            let title = alert.textFields?.first?.text ?? ""
            let contents = alert.textFields?.last?.text ?? ""
            let review = ReadingReview(id: UUID().uuidString, title: title, contents: contents)
            self.readingReviewStorage.save(review)
            self.reloadData()
        })
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "제목"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "내용"
        })
        present(alert, animated: true)
    }
}
