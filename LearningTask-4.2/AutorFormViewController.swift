//
//  ViewController.swift
//  LearningTask-4.2
//
//  Created by rafael.rollo on 17/02/2022.
//

import UIKit

class AutorFormViewController: UIViewController {
    
    typealias MensagemDeValidacao = String
    
    @IBOutlet weak var fotoTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var tecnologiasTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func salvarButton(_ sender: UIButton) {
        
        switch formularioValido() {
        case (false,let mensagemDeValidacao):
            
            exibirAlerta(para: mensagemDeValidacao)
            
        default:
            cadastrarAutor()
        }
    }
    
    func formularioValido() -> (Bool, MensagemDeValidacao?) {
        if let nome = nomeTextField.text, nome.isEmpty {
            return (false," Nome não pode estar em branco")
        }
        if let foto = fotoTextField.text, foto.isEmpty {
            return (false, "Informe a URL da foto do autor")
        }
        if let bio = bioTextField.text, bio.isEmpty {
            return (false, "A bio do autor não pode estar em branco")
        }
        if let tecnologias = tecnologiasTextField.text, tecnologias.isEmpty {
            return (false, "Informe as tecnologias sobre as quais o autor escreve")
        }
        
        return (true, nil)
    }
    
    func cadastrarAutor() {
        //chama a lógica que cadastra, e no final o alert que deu certo...
        let alert = UIAlertController(title: "Feito", message: "Autor cadastrado com sucesso", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    func exibirAlerta(para mensagemDeValidacao: MensagemDeValidacao?) {
        // let mensagem = mensagemDeValidacao ?? "Verifique os dados e tente novamente"
        
        let alert = UIAlertController(title: "Erro", message: mensagemDeValidacao, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
}
