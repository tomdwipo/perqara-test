//
//  FavouriteViewController.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import UIKit

class FavouriteViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var vm: FavouriteViewModel = FavouriteViewModelImpl()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vm.loadData()
        self.vm.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: CardCell.self), bundle: nil), forCellReuseIdentifier: String(describing: CardCell.self))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.vm.loadData()
    }

}

extension FavouriteViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CardCell.self), for: indexPath) as! CardCell
        cell.setupData(movie: self.vm.data[indexPath.row])
        return cell
    }
}

extension FavouriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.directToDetailPage(id:  self.vm.data[indexPath.row].id.description)
    }
}

extension FavouriteViewController: FavouriteViewModelDelegate {
    func refreshData() {
        self.tableView.reloadData()
    }
}
