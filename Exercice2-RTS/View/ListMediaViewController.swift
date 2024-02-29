//
//  ListMediaViewController.swift
//  Exercice2-RTS
//
//  Created by Ines BOKRI on 29/02/2024.
//

import UIKit

class ListMediaViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel = ListMediaViewModel()

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        retrieveData()
    }
    
    // MARK: - Functions
    private func setupTableView() {
        // Configure table view
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MediaCell", bundle: nil), forCellReuseIdentifier: "MediaCell")
        tableView.allowsSelection = false
        tableView.layer.borderColor = UIColor.clear.cgColor
        tableView.layer.borderWidth = 1
        tableView.layer.cornerRadius = 15
        tableView.rowHeight = 120
    }
    
    private func retrieveData() {
        // Fetch media data
        viewModel.fetchData { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

// MARK: - UITableViewDataSource
extension ListMediaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.mediaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaCell
        cell.setupMediaCell(viewModel.mediaList[indexPath.row])

        return cell
    }
}


