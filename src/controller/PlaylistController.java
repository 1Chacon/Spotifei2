/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author wilso
 */
import dao.PlaylistDAO;
import model.Playlist;
import view.PlaylistView;
import view.PlaylistMusicaView;

import java.util.List;

public class PlaylistController {
    private PlaylistView view;
    private PlaylistDAO dao;

    public PlaylistController(PlaylistView view, PlaylistDAO dao) {
        this.view = view;
        this.dao = dao;
    }

    public PlaylistController() {
    }

    
    public PlaylistController(PlaylistView view) {
        this.view = view;
        this.dao = new PlaylistDAO();
    }

    public void criar() {
        String nome = view.getNome();
        if (nome == null || nome.isBlank()) {
            view.exibirPlaylists("Nome da playlist nao pode ser vazio.");
            return;
        }

        Playlist p = new Playlist(0, nome, view.getUsuario());
        boolean sucesso = dao.criar(p);

        if (sucesso) {
            listar(); // atualiza lista apos criar
        } else {
            view.exibirPlaylists("Erro ao criar playlist.");
        }
    }

    public void listar() {
        List<Playlist> playlists = dao.listarPorUsuario(view.getUsuario());

        StringBuilder sb = new StringBuilder();
        if (playlists.isEmpty()) {
            sb.append("Nenhuma playlist encontrada.");
        } else {
            for (Playlist p : playlists) {
                sb.append("ID: ").append(p.getId())
                  .append(" | Nome: ").append(p.getNome()).append("\n");
            }
        }

        view.exibirPlaylists(sb.toString());
    }

    public void abrirPlaylist() {
        int id = view.getIdPlaylistSelecionada();
        if (id <= 0) {
            view.exibirPlaylists("ID invalido.");
            return;
        }

        List<Playlist> playlists = dao.listarPorUsuario(view.getUsuario());
        for (Playlist p : playlists) {
            if (p.getId() == id) {
                new PlaylistMusicaView(p); // abre nova tela com musicas da playlist
                return;
            }
        }

        view.exibirPlaylists("Playlist nao encontrada.");
    }
}