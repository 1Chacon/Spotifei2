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
import view.LoginView;
import view.TelaPrincipalView;
import view.CadastroView;
import javax.swing.*;

public class LoginController {
    private LoginView view;
    private UsuarioDAO dao;

    public LoginController(LoginView view) {
        this.view = view;
        this.dao = new UsuarioDAO();
    }

    public void entrar() {
        String usuario = view.getUsuario();
        String senha = view.getSenha();

        Usuario u = dao.autenticar(usuario, senha);
        if (u != null) {
            JOptionPane.showMessageDialog(view, "Bem vindo, " + u.getNome() + "!");
            new TelaPrincipalView(u);
            view.dispose();
        } else {
            JOptionPane.showMessageDialog(view, "Usuario ou senha invalidos!");
        }
    }

    public void cadastrar() {
        new CadastroView();
    }
}
