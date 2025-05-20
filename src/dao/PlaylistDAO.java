/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author wilso
 */

import model.Playlist;
import model.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PlaylistDAO {

    public boolean criar(Playlist playlist) {
        String sql = "INSERT INTO playlist (nome, id_usuario) VALUES (?, ?)";
        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, playlist.getNome());
            stmt.setInt(2, playlist.getUsuario().getId());
            stmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("Erro ao criar playlist: " + e.getMessage());
            return false;
        }
    }

    public List<Playlist> listarPorUsuario(Usuario usuario) {
        List<Playlist> lista = new ArrayList<>();
        String sql = "SELECT * FROM playlist WHERE id_usuario = ?";

        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuario.getId());
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Playlist p = new Playlist(
                    rs.getInt("id"),
                    rs.getString("nome"),
                    usuario
                );
                lista.add(p);
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar playlists: " + e.getMessage());
        }

        return lista;
    }

    public boolean excluir(int idPlaylist) {
        String sql = "DELETE FROM playlist WHERE id = ?";
        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idPlaylist);
            stmt.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("Erro ao excluir playlist: " + e.getMessage());
            return false;
        }
    }
}