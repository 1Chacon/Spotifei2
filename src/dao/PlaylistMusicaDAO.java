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
import model.Playlist;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlaylistMusicaDAO {

    public boolean adicionarMusica(Playlist playlist, Musica musica) {
        String sql = "INSERT INTO playlist_musica (id_playlist, id_musica) VALUES (?, ?)";

        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, playlist.getId());
            stmt.setInt(2, musica.getId());
            stmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("Erro ao adicionar musica à playlist: " + e.getMessage());
            return false;
        }
    }

    public boolean removerMusica(Playlist playlist, Musica musica) {
        String sql = "DELETE FROM playlist_musica WHERE id_playlist = ? AND id_musica = ?";

        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, playlist.getId());
            stmt.setInt(2, musica.getId());
            stmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("Erro ao remover musica da playlist: " + e.getMessage());
            return false;
        }
    }

    public List<Musica> listarMusicas(Playlist playlist) {
        List<Musica> lista = new ArrayList<>();
        String sql = """
            SELECT m.id, m.nome, m.genero, a.id AS artista_id, a.nome AS artista_nome
            FROM playlist_musica pm
            JOIN musica m ON pm.id_musica = m.id
            JOIN artista a ON m.id_artista = a.id
            WHERE pm.id_playlist = ?
        """;

        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, playlist.getId());
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
            System.out.println("Erro ao listar musicas da playlist: " + e.getMessage());
        }

        return lista;
    }
}