/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author wilso
 */
import model.Artista;
import model.Musica;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MusicaDAO {

    public List<Musica> buscar(String termo) {
        List<Musica> lista = new ArrayList<>();
        String sql = """
            SELECT m.id, m.nome, m.genero, a.id as artista_id, a.nome as artista_nome
            FROM musica m
            JOIN artista a ON m.id_artista = a.id
            WHERE LOWER(m.nome) LIKE ? OR LOWER(a.nome) LIKE ? OR LOWER(m.genero) LIKE ?
        """;

        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String likeTerm = "%" + termo.toLowerCase() + "%";
            stmt.setString(1, likeTerm);
            stmt.setString(2, likeTerm);
            stmt.setString(3, likeTerm);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Artista artista = new Artista(rs.getInt("artista_id"), rs.getString("artista_nome"));
                Musica musica = new Musica(
                    rs.getInt("id"),
                    rs.getString("nome"),
                    rs.getString("genero"),
                    artista
                );
                lista.add(musica);
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar musicas: " + e.getMessage());
        }

        return lista;
    }
}
