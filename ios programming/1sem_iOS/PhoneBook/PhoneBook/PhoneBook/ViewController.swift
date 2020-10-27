//
//  ViewController.swift
//  PhoneBook
//
//  Created by Илья Лапин on 19.10.2020.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
   
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        createContacts()
        loadData()
    }
    
    
    private enum Section: Int{//мне правда было очень лень делать адекватную сортировку, хотя я нашел решение на stackoverflow
        case letterA
        case letterD
        case letterM
        case letterR
        case letterS
        case letterV
        
    }
    
    
    private struct Cell {
        let contact: Contact
    }
    
    private struct SectionData {
        let cells: [Cell]
    }
    
    
   private var data: [SectionData]?
    
    
    private func loadData() {
        data = [
            SectionData(cells: [
                .init(contact: contacts[0]),
                .init(contact: contacts[1])
            ]),
            SectionData(cells: [
                .init(contact: contacts[2]),
                .init(contact: contacts[3])
            ]),
            SectionData(cells: [
                .init(contact: contacts[4])
            ]),
            SectionData(cells: [
                .init(contact: contacts[5]),
                .init(contact: contacts[6]),
                .init(contact: contacts[7])
            ]),
            SectionData(cells: [
                .init(contact: contacts[8])
            ]),
            SectionData(cells: [
                .init(contact: contacts[9])
            ])
        ]
    }
    var contacts: [Contact] = []
    private func createContacts(){
        let contact1 = Contact(name: "Albina Seksova",  phoneNumber: "8 (934) 254-45-32", image: #imageLiteral(resourceName: "Image"))
        contacts.append(contact1)
        
        let contact2 = Contact(name: "Amos Shestakov",   phoneNumber: "8 (897) 243-13-78",image: #imageLiteral(resourceName: "Image-1"))
        contacts.append(contact2)
        
        let contact3 = Contact(name: "Dmitri Gordon",   phoneNumber: "8 (543) 355-32-90", image: #imageLiteral(resourceName: "Image-1"))
        contacts.append(contact3)
        
        let contact4 = Contact(name: "Dmitri Kiselev",   phoneNumber: "8 (777) 777-77-77", image: #imageLiteral(resourceName: "Image-3"))
        contacts.append(contact4)
        
        let contact5 = Contact(name: "Mark Tetelman",   phoneNumber: "8 (987) 148-82-28",image: #imageLiteral(resourceName: "Image-1"))
        contacts.append(contact5)
        
        let contact6 = Contact(name: "Ray Charles",   phoneNumber: "8 (908) 564-34-68", image: #imageLiteral(resourceName: "Image-4"))
        contacts.append(contact6)
        
        let contact7 = Contact(name: "Richard Dawkins",   phoneNumber: "8 (345) 322-13-94", image: #imageLiteral(resourceName: "Image-2"))
        contacts.append(contact7)
        
        let contact8 = Contact(name: "Ray Toro",   phoneNumber: "8 (346) 453-57-33", image: #imageLiteral(resourceName: "Image-5"))
        contacts.append(contact8)
        
        let contact9 = Contact(name: "Svetlana Loboda",   phoneNumber: "8 (865) 342-33-33", image: #imageLiteral(resourceName: "Image-6"))
        contacts.append(contact9)
        
        let contact10 = Contact(name: "Vladimir Epifancev",   phoneNumber: "8 (112) 345-78-11", image: #imageLiteral(resourceName: "Image-7"))
        contacts.append(contact10)
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = data?[section] else { return 0 }
        
        return data.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellData = data?[indexPath.section]
        else { fatalError("Dude you lost your data") }
        
        return basicCell(for: indexPath, from: tableView, name: cellData.cells[indexPath.row].contact.name)
    }
    
    private func basicCell(for indexPath: IndexPath, from tableView: UITableView, name: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "basic",
            for: indexPath
        )
        cell.textLabel?.text = "\(name)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "A"
        case 1:
            return "D"
        case 2:
            return "M"
        case 3:
            return "R"
        case 4:
            return "S"
        case 5:
            return "V"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
        guard let detailViewController: DetailViewController
                = storyboard?.instantiateViewController(identifier: "detailView")
        else { return }
        
        guard let contact = data?[indexPath.section].cells[indexPath.row].contact else {return}
        
        detailViewController.loadViewIfNeeded()
        detailViewController.setContact(contact: contact)
        show(detailViewController, sender: nil)
    }
}
struct Contact {
    let name: String
    let phoneNumber: String
    let image: UIImage!
}


