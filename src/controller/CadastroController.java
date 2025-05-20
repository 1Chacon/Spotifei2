/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author wilso
 */
import dao.UsuarioDAO;
import model.Usuario;
import view.CadastroView;

import javax.swing.*;

public class CadastroController {
    private CadastroView view;
    private UsuarioDAO dao;

    public CadastroController(CadastroView view) {
        this.view = view;
        this.dao = new UsuarioDAO();
    }

    public void salvar() {
        String nome = view.getNome();
        String usuario = view.getUsuario();
        String senha = view.getSenha();

        Usuario u = new Usuario(0, nome, usuario, senha);
        boolean sucesso = dao.cadastrarUsuario(u);

        if (sucesso) {
            JOptionPane.showMessageDialog(view, "Usuario cadastrado com sucesso!");
            view.dispose();
        } else {
            JOptionPane.showMessageDialog(view, "Erro ao cadastrar!");
        }
    }
}
