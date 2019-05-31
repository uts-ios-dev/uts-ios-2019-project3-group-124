

import UIKit

class ListViewController: UIViewController {

    var storeDataArr:NSMutableArray = NSMutableArray.init()
    var searchArr:NSMutableArray = NSMutableArray.init()
    var searchMode:Bool = false

    @IBOutlet weak var SearchBar: UISearchBar!
    @IBOutlet weak var ListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ListTableView.tableFooterView = UIView.init(frame: CGRect.zero)
        GetData()
    }
    
    func GetData() -> Void {
        let userDefault = UserDefaults.standard
        let decodeObj = userDefault.object(forKey: "StorageData")
        storeDataArr = NSKeyedUnarchiver.unarchiveObject(with: decodeObj as! Data) as! NSMutableArray
        
        if storeDataArr.count != 0 {
            ListTableView.reloadData()
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

extension ListViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text != nil && searchBar.text!.count > 0 {
            searchMode = true
            GetDataByKeyWord()
        }
        else{
            searchMode = false
            ListTableView.reloadData()
        }
    }
    
    func GetDataByKeyWord() -> Void {
        let key = SearchBar.text!
        searchArr.removeAllObjects()
        for tmp in storeDataArr {
            let obj = tmp as! StoreObj
            if obj.name?.contains(key) == true{
                searchArr.add(obj)
            }
        }
        ListTableView.reloadData()
    }
}

extension ListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchMode {
            return searchArr.count
        }
        return storeDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if searchMode {
            let obj:StoreObj = searchArr[indexPath.row] as! StoreObj
            let cell:UITableViewCell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = obj.name
            return cell
        }
        else{
            let obj:StoreObj = storeDataArr[indexPath.row] as! StoreObj
            let cell:UITableViewCell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = obj.name
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var obj:StoreObj = storeDataArr[indexPath.row] as! StoreObj

        if searchMode {
            obj = searchArr[indexPath.row] as! StoreObj
        }

        let sb = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let detailVC:DetailViewController = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.obj = obj
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
