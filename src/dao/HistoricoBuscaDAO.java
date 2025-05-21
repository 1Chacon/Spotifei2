/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author wilso
 */
import model.Musica;
import model.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HistoricoBuscaDAO {

    public void registrarBusca(Usuario usuario, Musica musica) {
        String sql = "INSERT INTO historico_busca (id_usuario, id_musica) VALUES (?, ?)";

        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuario.getId());
            stmt.setInt(2, musica.getId());
            stmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Erro ao registrar busca: " + e.getMessage());
        }
    }

    public List<Musica> listarUltimasBuscas(Usuario usuario) {
        List<Musica> lista = new ArrayList<>();
        String sql = """
            SELECT m.id, m.nome, m.genero, a.id AS artista_id, a.nome AS artista_nome
            FROM historico_busca hb
            JOIN musica m ON hb.id_musica = m.id
            JOIN artista a ON m.id_artista = a.id
            WHERE hb.id_usuario = ?
            ORDER BY hb.data_busca DESC
            LIMIT 10
        """;

        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuario.getId());
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Musica m = new Musica(
                    rs.getInt("id"),
                    rs.getString("nome"),
                    rs.getString("genero"),
                    new model.Artista(rs.getInt("artista_id"), rs.getString("artista_nome"))
                );
                lista.add(m);
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar historico: " + e.getMessage());
        }

        return lista;
    }
}