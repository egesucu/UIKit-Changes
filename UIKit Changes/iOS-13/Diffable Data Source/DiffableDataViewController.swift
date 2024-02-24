//
//  DiffableDataViewController.swift
//  UIKit Changes
//
//  Created by Ege Sucu on 10.02.2024.
//

import UIKit

typealias TableDelegate = UITableViewDelegate & UITableViewDiffableDataSource<Section, Contact>

class DiffableDataViewController: UIViewController {
    
    @IBOutlet weak var diffableTableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var snapshot = NSDiffableDataSourceSnapshot<Section, Contact>()
    var dataSource: UITableViewDiffableDataSource<Section, Contact>?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }
    
    private func configureTableView() {
        dataSource = UITableViewDiffableDataSource<Section, Contact>(
            tableView: diffableTableView,
            cellProvider: { tableView, indexPath, contact in
                let cell = UITableViewCell()
                cell.textLabel?.text = contact.fullName
                return cell
            }
        )
        
        snapshot = NSDiffableDataSourceSnapshot<Section, Contact>()
        snapshot.appendSections([.favorites])
        snapshot.appendItems(Contact.fakeDataArray)
        dataSource?.apply(snapshot)
    }
    
    @IBAction func didTapAddButton(_ sender: UIBarButtonItem) {
        snapshot.appendItems(Contact.fakeAppendingArray)
        dataSource?.apply(snapshot, animatingDifferences: true)
        hideButtonForever()
    }
    
    private func hideButtonForever() {
        addButton.isEnabled = false
        addButton.tintColor = .clear
    }
    

}
