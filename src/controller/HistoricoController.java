/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

/**
 *
 * @author wilso
 */
import dao.HistoricoBuscaDAO;
import model.Musica;
import view.HistoricoView;

import java.util.List;

public class HistoricoController {
    private HistoricoView view;
    private HistoricoBuscaDAO dao;

    public HistoricoController(HistoricoView view) {
        this.view = view;
        this.dao = new HistoricoBuscaDAO();
    }

    public void carregarHistorico() {
        List<Musica> musicas = dao.listarUltimasBuscas(view.getUsuario());

        StringBuilder sb = new StringBuilder();
        for (Musica m : musicas) {
            sb.append("- ").append(m.getNome())
              .append(" | ").append(m.getGenero())
              .append(" | ").append(m.getArtista().getNome()).append("\n");
        }

        view.exibirHistorico(sb.length() > 0 ? sb.toString() : "Nenhum historico disponivel.");
    }
}
