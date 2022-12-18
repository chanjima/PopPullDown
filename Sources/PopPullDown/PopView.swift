//
//  PopView.swift
//  
//
//  Created by chanjima on 2022/12/18.
//

import UIKit

internal class PopView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let items = ["TEST1", "TEST2", "TEST3"]
    private var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        self.tableView = UITableView(frame: CGRect(x: .zero, y: .zero, width: displayWidth, height: displayHeight))
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        self.tableView?.dataSource = self
        self.tableView?.delegate = self

        self.view.addSubview(self.tableView ?? UIView())
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(items[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(self.items[indexPath.row])"

        return cell
    }

}

extension PopView {

}
