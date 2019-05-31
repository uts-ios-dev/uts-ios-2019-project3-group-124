

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var AddBtn: UIButton!
    @IBOutlet weak var FindBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.layoutIfNeeded()
        DoInit()
    }

    func DoInit(){
        AddBtn.layer.cornerRadius = AddBtn.frame.size.width/2
        AddBtn.layer.borderColor = UIColor.black.cgColor
        AddBtn.layer.borderWidth = 1
        AddBtn.layer.masksToBounds = true
        
        FindBtn.layer.cornerRadius = FindBtn.frame.size.width/2
        FindBtn.layer.borderColor = UIColor.black.cgColor
        FindBtn.layer.borderWidth = 1
        FindBtn.layer.masksToBounds = true
    }
    @IBAction func AddClick(_ sender: Any) {
        let sb = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let camera:CameraViewController = sb.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
        self.navigationController?.pushViewController(camera, animated: true)
    }
    @IBAction func FindClick(_ sender: Any) {
        let sb = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let listVC:ListViewController = sb.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        self.navigationController?.pushViewController(listVC, animated: true)
    }
}

