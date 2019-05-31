

import UIKit

class DetailViewController: UIViewController {
    
    var obj : StoreObj = StoreObj()

    @IBOutlet weak var Picture: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if obj != nil {
            Picture.image = obj.image
            NameLabel.text = obj.name
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
