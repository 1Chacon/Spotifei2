/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author wilso
 */
import dao.MusicaDAO;
import dao.PlaylistMusicaDAO;
import model.Musica;
import view.PlaylistMusicaView;

import java.util.List;

public class PlaylistMusicaController {
    private PlaylistMusicaView view;
    private PlaylistMusicaDAO dao;

    public PlaylistMusicaController(PlaylistMusicaView view) {
        this.view = view;
        this.dao = new PlaylistMusicaDAO();
    }

    public void carregarMusicas() {
        List<Musica> musicas = dao.listarMusicas(view.getPlaylist());

        StringBuilder sb = new StringBuilder();
        for (Musica m : musicas) {
            sb.append("ID: ").append(m.getId())
              .append(" | ").append(m.getNome())
              .append(" | ").append(m.getGenero())
              .append(" | ").append(m.getArtista().getNome()).append("\n");
        }

        view.exibirMusicas(sb.length() > 0 ? sb.toString() : "Playlist vazia.");
    }

    public void removerMusica() {
        int idMusica = view.getIdMusicaRemover();
        if (idMusica <= 0) {
            view.exibirMusicas("ID invalido.");
            return;
        }

        Musica m = new Musica();
        m.setId(idMusica);

        dao.removerMusica(view.getPlaylist(), m);
        carregarMusicas();
    }
}
