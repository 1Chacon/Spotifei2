/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author wilso
 */

import model.Musica;
import model.Usuario;
import view.MusicaCurtidaView;
import dao.InteracaoDAO;

import java.util.List;

public class MusicaController {
    private MusicaCurtidaView view;

    public MusicaController(MusicaCurtidaView view) {
        this.view = view;
    }

    public void listarCurtidas() {
    InteracaoDAO dao = new InteracaoDAO();
    List<Musica> musicas = dao.listarCurtidas(view.getUsuario());

    StringBuilder sb = new StringBuilder();
    for (Musica m : musicas) {
        sb.append("ID: ").append(m.getId())
          .append(" | ").append(m.getNome())
          .append(" | ").append(m.getGenero())
          .append(" | ").append(m.getArtista().getNome()).append("\n");
    }

    if (musicas.isEmpty()) {
        view.exibirCurtidas("Nenhuma musica curtida ainda.");
    } else {
        view.exibirCurtidas(sb.toString());
    }
}

    public void curtir(Usuario usuario, Musica musica) {
        InteracaoDAO dao = new InteracaoDAO();
        dao.curtir(usuario, musica);
    }

    public void descurtir(Usuario usuario, Musica musica) {
        InteracaoDAO dao = new InteracaoDAO();
        dao.descurtir(usuario, musica);
    }
}
