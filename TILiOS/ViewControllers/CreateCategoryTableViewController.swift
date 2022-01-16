import UIKit

class CreateCategoryTableViewController: UITableViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var nameTextField: UITextField!

  // MARK: - View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    nameTextField.becomeFirstResponder()
  }

  // MARK: - IBActions
  @IBAction func cancel(_ sender: Any) {
    navigationController?.popViewController(animated: true)
  }

  @IBAction func save(_ sender: Any) {
    guard
      let name = nameTextField.text,
      !name.isEmpty
    else {
      ErrorPresenter.showError(
        message: "You must specify a name", on: self)
      return
    }

    let category = Category(name: name)
    ResourceRequest<Category>(resourcePath: "categories").save(category) { [weak self] result in
      switch result {
      case .failure:
        let message = "There was a problem saving the category"
        ErrorPresenter.showError(message: message, on: self)
      case .success:
        DispatchQueue.main.async { [weak self] in
          self?.navigationController?
            .popViewController(animated: true)
        }
      }
    }
  }
}
