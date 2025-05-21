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
import java.util.ArrayList;

import java.sql.*;
import java.util.List;
import model.Artista;

public class InteracaoDAO {

    public void curtir(Usuario usuario, Musica musica) {
        registrarInteracao(usuario, musica, "curtir");
    }

    public void descurtir(Usuario usuario, Musica musica) {
        registrarInteracao(usuario, musica, "descurtir");
    }

    private void registrarInteracao(Usuario usuario, Musica musica, String tipo) {
        String sql = "INSERT INTO interacao (id_usuario, id_musica, tipo) VALUES (?, ?, ?)";

        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuario.getId());
            stmt.setInt(2, musica.getId());
            stmt.setString(3, tipo);
            stmt.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Erro ao registrar interacao: " + e.getMessage());
        }
    }
    public List<Musica> listarCurtidas(Usuario usuario) {
    List<Musica> lista = new ArrayList<>();

    String sql = """
        SELECT m.id, m.nome, m.genero, a.id as artista_id, a.nome as artista_nome
        FROM interacao i
        JOIN musica m ON i.id_musica = m.id
        JOIN artista a ON m.id_artista = a.id
        WHERE i.tipo = 'curtir' AND i.id_usuario = ?
    """;

    try (Connection conn = Conexao.getConexao();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setInt(1, usuario.getId());
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Artista artista = new Artista(rs.getInt("artista_id"), rs.getString("artista_nome"));
            Musica m = new Musica(
                rs.getInt("id"),
                rs.getString("nome"),
                rs.getString("genero"),
                artista
            );
            lista.add(m);
        }

    } catch (SQLException e) {
        System.out.println("Erro ao listar curtidas: " + e.getMessage());
    }

    return lista;
}
}