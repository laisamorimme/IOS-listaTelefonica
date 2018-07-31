//
//  ContatosViewController.swift
//  ListaTelefonica
//
//  Created by Lilian Amorim on 19/07/2018.
//  Copyright © 2018 lais amorim menezes. All rights reserved.
//

import Foundation
import UIKit
import Reusable

class ContatosViewController: UIViewController {
  
    
    @IBOutlet weak var tableView: UITableView!
    
    var service: ContatoService!
    
    var contatos: [ContatoView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = L10n.Contatos.title
        
        self.service = ContatoService(delegate: self)
        
        self.tableView.register(cellType: LinhaTableViewCell.self)
        
        self.service.getContato()
        
        self.title = "Contato"

    }
    
}
extension ContatosViewController: ContatoServiceDelegate {
    
    func getContatosSuccess() {
        
        self.contatos = ContatoViewModel.get()
        
        self.tableView.reloadData()
        
//        for contato in ContatoViewModel.get() {
//            print(contato.nome)
//        }
    }
    
    func getContatosFailure(error: String) {
        
    }
}

extension ContatosViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.contatos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath) as LinhaTableViewCell
        
        cell.bind(contato: self.contatos[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        return 120
    }
}
