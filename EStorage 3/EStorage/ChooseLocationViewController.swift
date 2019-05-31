

import UIKit

class ChooseLocationViewController: UIViewController {
    var currentIndex:NSInteger = -1
    var img:UIImage = UIImage.init()
    var storeDataArr:NSMutableArray = NSMutableArray.init()

    @IBOutlet weak var NameTF: UITextField!
    @IBOutlet weak var LocationTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LocationTableView.tableFooterView = UIView.init(frame: CGRect.zero)
        GetData()
    }
    
    func GetData() -> Void {
        let userDefault = UserDefaults.standard
        let decodeObj = userDefault.object(forKey: "StorageData")
        storeDataArr = NSKeyedUnarchiver.unarchiveObject(with: decodeObj as! Data) as! NSMutableArray
        
        if storeDataArr.count != 0 {
            LocationTableView.reloadData()
        }
    }
    

    @IBAction func SaveClick(_ sender: Any) {
        if currentIndex < 0 {
            let alertController = UIAlertController(title: "Tips",
                                                    message: "Please select a row", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                action in
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        else if(NameTF.text == nil || NameTF.text!.count <= 0){
            let alertController = UIAlertController(title: "Tips",
                                                    message: "Name can't be nil!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: {
                action in
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
        else{
            SaveData()
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

extension ChooseLocationViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < storeDataArr.count {
            let obj:StoreObj = storeDataArr[indexPath.row] as! StoreObj
            let cell:UITableViewCell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = obj.name
            return cell
        }
        else{
            let cell:UITableViewCell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
            cell.textLabel?.text = ""
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndex = indexPath.row
    }
}

extension ChooseLocationViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func SaveData() -> Void {
        let obj:StoreObj = storeDataArr[currentIndex] as! StoreObj
        obj.name = NameTF.text
        obj.image = img
        
        let encodedObject = NSKeyedArchiver.archivedData(withRootObject: storeDataArr)
        UserDefaults.standard.set(encodedObject, forKey: "StorageData")
        UserDefaults.standard.synchronize()
        
        let alertController = UIAlertController(title: "Tips",
                                                message: "Save success!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
