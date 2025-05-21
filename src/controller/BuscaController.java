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
import dao.HistoricoBuscaDAO;
import dao.PlaylistDAO;
import dao.PlaylistMusicaDAO;
import model.Musica;
import view.BuscaView;

import java.util.List;
import model.Playlist;

public class BuscaController {
    private BuscaView view;
    private MusicaDAO musicaDAO;
    private HistoricoBuscaDAO historicoDAO;

    public BuscaController(BuscaView view) {
        this.view = view;
        this.musicaDAO = new MusicaDAO();
        this.historicoDAO = new HistoricoBuscaDAO();
    }

    public void buscar() {
        String termo = view.getTermoBusca();
        List<Musica> resultados = musicaDAO.buscar(termo);
        exibirMusicas(resultados, true);
    }

    public void buscarTudo() {
        List<Musica> resultados = musicaDAO.buscar("");
        exibirMusicas(resultados, false);
    }

    private void exibirMusicas(List<Musica> lista, boolean registrarHistorico) {
        StringBuilder sb = new StringBuilder();

        if (lista.isEmpty()) {
            sb.append("Nenhuma musica encontrada.");
        } else {
            for (Musica m : lista) {
                sb.append("ID: ").append(m.getId())
                    .append(" | ").append(m.getNome())
                    .append(" | ").append(m.getGenero())
                    .append(" | ").append(m.getArtista().getNome())
                    .append("\n");


                if (registrarHistorico) {
                    historicoDAO.registrarBusca(view.getUsuario(), m);
                }
            }
        }

        view.exibirResultados(sb.toString());
    }
    
    public void adicionarAMinhaPlaylist(String idMusicaStr, String idPlaylistStr) {
    try {
        int idMusica = Integer.parseInt(idMusicaStr);
        int idPlaylist = Integer.parseInt(idPlaylistStr);

        Musica musica = new Musica();
        musica.setId(idMusica);

        PlaylistDAO playlistDAO = new PlaylistDAO();
        Playlist playlist = playlistDAO.listarPorUsuario(view.getUsuario())
                .stream()
                .filter(p -> p.getId() == idPlaylist)
                .findFirst()
                .orElse(null);

        if (playlist == null) {
            view.exibirResultados("Playlist nao encontrada.");
            return;
        }

        PlaylistMusicaDAO dao = new PlaylistMusicaDAO();
        dao.adicionarMusica(playlist, musica);

        view.exibirResultados("Musica adicionada a playlist!");

    } catch (NumberFormatException e) {
        view.exibirResultados("IDs invalidos.");
    }
    }
    public void curtirMusica(String idStr) {
    try {
        int id = Integer.parseInt(idStr);
        Musica musica = new Musica();
        musica.setId(id);

        MusicaController musicaController = new MusicaController(null);
        musicaController.curtir(view.getUsuario(), musica);

        view.exibirResultados("Musica curtida com sucesso!");

    } catch (NumberFormatException e) {
        view.exibirResultados("ID invalido.");
    }
}
}