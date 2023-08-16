//
//  DetailViewController.swift
//  Rawr-test
//
//  Created by Tommy-a on 16/08/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var loveImage: UIImageView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var tableVIew: UITableView!
    
    var id: String = ""
    private var vm: DetailViewModel = DetailViewModelImpl()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vm.loadData(id: self.id)
        self.vm.delegate = self
        tableVIew.dataSource = self
        tableVIew.register(UINib(nibName: String(describing: DetailCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DetailCell.self))
        backImage.isUserInteractionEnabled = true
        backImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backImageAction)))
        
        loveImage.isUserInteractionEnabled = true
        loveImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(loveAction)))
    }
    
    @objc func backImageAction(){
        self.dismiss(animated: true)
    }
    
    @objc func loveAction(){
        if self.vm.isLoved {
            self.vm.deleteLoved(with: self.vm.detail)
        }else{
            self.vm.loveDetail(with: self.vm.detail)
        }
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.detail == nil ? 0 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DetailCell.self)) as! DetailCell
        cell.setupData(data: self.vm.detail)
        return cell
    }
}

extension DetailViewController: DetailViewDelegate {
    func refresh() {
        self.loveImage.image = UIImage(systemName: self.vm.isLoved ? "heart.fill" : "heart")
        self.tableVIew.reloadData()
        self.loadViewIfNeeded()
    }
}
