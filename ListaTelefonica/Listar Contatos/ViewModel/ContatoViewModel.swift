//
//  ContatoViewModel.swift
//  ListaTelefonica
//
//  Created by Lilian Amorim on 19/07/2018.
//  Copyright © 2018 lais amorim menezes. All rights reserved.
//

import Foundation

struct ContatoView {
    var nome: String = ""
    var email: String = ""
}

class ContatoViewModel{
    
    static func getAsView(_ contato: Contato?) -> ContatoView{
        
        guard let contato = contato else {
            return ContatoView()
        }
        
        var contatoView = ContatoView()
        
        contatoView.nome = contato.nome ?? ""
        contatoView.email = contato.email ?? ""
        
        return contatoView

    }
    
    static func getAsView(sequence contatos: [Contato]) -> [ContatoView] {
        
        var contatosView = [ContatoView]()
        
        for contato in contatos {
            contatosView.append(self.getAsView(contato))
        }
        
        return contatosView
    }
    
    
    static func save(contatos: [Contato]) {
        
        try! uiRealm.write {
            uiRealm.add(contatos, update: true)
        }
    }
    
    static func clear() {
        
        try! uiRealm.write {
            uiRealm.delete(uiRealm.objects(Contato.self))
        }
    }
    
    static func get() -> [ContatoView] {
        
        let contatosModel = uiRealm.objects(Contato.self)
        
        var contatos: [Contato] = []
        contatos.append(contentsOf: contatosModel)
        
        return self.getAsView(sequence: contatos)
    }
}
