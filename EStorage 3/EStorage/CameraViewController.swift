

import UIKit

class CameraViewController: UIViewController{
    
    var PhotoImg:UIImage = UIImage.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func TakePhoto(_ sender: UIButton) {
        let pickerPhoto = UIImagePickerController()
        pickerPhoto.sourceType = .camera
        pickerPhoto.delegate = self
        self.present(pickerPhoto, animated: true, completion: nil)
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

extension CameraViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        PhotoImg = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        self.dismiss(animated: true, completion: nil)
        
        let sb = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let chooseVC:ChooseLocationViewController = sb.instantiateViewController(withIdentifier: "ChooseLocationViewController") as! ChooseLocationViewController
        chooseVC.img = PhotoImg
        self.navigationController?.pushViewController(chooseVC, animated: true)
    }
}
