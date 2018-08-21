import UIKit
import CoreData

class AddItemViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func addButton(_ sender: Any) {
        let newItem = Items(context: self.context)
        newItem.name = inputTextField.text!
        list.append(newItem)
        inputTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func saveItems() {
        
        do {
            try context.save()
        } catch {
            print("Error saving \(error)")
        }
    }
}
