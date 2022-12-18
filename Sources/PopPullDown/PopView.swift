//
//  PopView.swift
//  
//
//  Created by chanjima on 2022/12/18.
//

import UIKit

// MARK: - Protocols

public protocol PopViewDelegate {
    
    /// 表示する項目
    func popView(_ items: [String])
}

// MARK: - PopView

internal class PopView: UIViewController {
    
    open var popviewDelegate: PopViewDelegate?

    private var tableView: UITableView?
    private var items: [String] = []

    init() {
        super.init(nibName: nil, bundle: nil)
        self.popviewDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
}

// MARK: - Private

extension PopView {
}


// MARK: - UITableViewDataSource

extension PopView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
}

// MARK: - UITableViewDelegate

extension PopView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(self.items[indexPath.row])"
        
        return cell
    }
}

extension PopView: PopViewDelegate {
    
    func popView(_ items: [String]) {
        self.items = items
        self.tableView?.reloadData()
    }
}
