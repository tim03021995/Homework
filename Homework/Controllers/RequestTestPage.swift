//
//  TableViewController.swift
//  RedSo
//
//  Created by Alvin Tseng on 2020/11/12.
//

// import Kingfisher
import SnapKit
import UIKit

class RequestTestPage: UITableViewController {
    var page = 0
    var cells: [Account] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    var tableViewRefreshControl: UIRefreshControl {
        let refreshController = UIRefreshControl()
        refreshController.tintColor = .textColor
        refreshController.addTarget(self, action: #selector(RequestTestPage.refresh), for: UIControl.Event.valueChanged)
        let attributedString = NSMutableAttributedString(string: "loading...", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.textColor, range: NSRange(location: 0, length: 10))
        refreshController.attributedTitle = attributedString
        return refreshController
    }

    // var cellHeight: CGFloat?

    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(CourseCell.self, forCellReuseIdentifier: "cell")

        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.allowsSelection = false
        tableView.refreshControl = tableViewRefreshControl
        tableView?.addSubview(refreshControl!)
        page = 0
        getCellsData()
    }

    override func viewWillAppear(_: Bool) {
        super.viewWillAppear(true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        let rows = cells.count
        return rows
    }

    func getCellsData() {
        HTTPRequest(method: .GET, host: .demo, pathType: .demo(endPoint: .appexam1)).request { [self] (res: Result<Account, NetworkError>) in
            switch res {
            case let .success(data):
                cells.append(data)
            case let .failure(error):
                print(error)
            }
        }
        HTTPRequest(method: .GET, host: .demo, pathType: .demo(endPoint: .appexam2)).request { [self] (res: Result<Account, NetworkError>) in
            switch res {
            case let .success(data):
                cells.append(data)
            case let .failure(error):
                print(error)
            }
        }
    }

    // #MARK: cellForRowAt
    override func tableView(_: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let resultCell = cells[indexPath.row]
        cell = makeCourseCell(indexPath: indexPath, resultCell: resultCell)
        return cell
    }

    @objc func refresh() {
        print(#function)
        cells.removeAll()
        getCellsData()
        refreshControl!.endRefreshing()
    }
}

extension UITableView {
    func reloadData(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
            { _ in completion() }
    }
}

extension RequestTestPage {
    func makeCourseCell(indexPath: IndexPath, resultCell: Account) -> CourseCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CourseCell
        let resultCell = cells[indexPath.row]
        cell.setView(resultCell: resultCell)
        return cell
    }
}
