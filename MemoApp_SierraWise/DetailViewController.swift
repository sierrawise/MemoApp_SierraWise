//
//  DetailViewController.swift
//  MemoApp_SierraWise
//
//  Created by Sierra Wise on 9/26/24.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var memoTableView: UITableView!
    var memo: Memo?
    
    let formatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm:ss"
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        formatter.locale = Locale(identifier: "en_US")
        
        return formatter
    }()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? NewMemoViewController{
            vc.editTarget = memo
        }
    }
    
    var token: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        token = NotificationCenter.default.addObserver(forName: NewMemoViewController.newMemo_Insert, object: nil, queue: OperationQueue.main) {[weak self] _ in
            self?.memoTableView.reloadData()
        }
    }
    
    deinit {
        if let tokenRemove = token{
            NotificationCenter.default.removeObserver(tokenRemove)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath)
            print("MemoCell row \(indexPath.row)")
            print("MemoCell section \(indexPath.section)")
            cell1.textLabel?.text = memo?.content
            return cell1
        case 1:
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath)
            print("DateCell row \(indexPath.row)")
            print("DateCell section \(indexPath.section)")
            cell2.textLabel?.text = formatter.string(for: memo?.insertDate)
            return cell2
        default:
            fatalError()
        }
        
        
    }
    
    
}
