import UIKit
import CoreData

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!

    @IBAction func addButton(_ sender: Any) {
        let newItem = Items(context: context)
        newItem.name = inputTextField.text!
        newItem.comleted = true
        list.append(newItem)
        inputTextField.text = ""
        saveItems()
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
