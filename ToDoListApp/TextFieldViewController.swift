import UIKit
import CoreData

var list = [Items]()
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

class TextFieldViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //MARK: Data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        let item = list[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            let item = list[indexPath.row]
            list.remove(at: indexPath.row)
            context.delete(item)
            do {
                try context.save()
            } catch {
                print("Error saving \(error)")
            }
        }
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func loadItems() {
        let request: NSFetchRequest<Items> = Items.fetchRequest()
        do {
            list = try context.fetch(request)
        } catch {
            print("Error \(error)")
        }
        tableView.reloadData()
    }
}

