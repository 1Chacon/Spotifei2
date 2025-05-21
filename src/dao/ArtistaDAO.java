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
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ArtistaDAO {

    public Artista buscarPorId(int id) {
        String sql = "SELECT * FROM artista WHERE id = ?";
        try (Connection conn = Conexao.getConexao();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Artista(rs.getInt("id"), rs.getString("nome"));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar artista: " + e.getMessage());
        }
        return null;
    }

    public List<Artista> listarTodos() {
        List<Artista> lista = new ArrayList<>();
        String sql = "SELECT * FROM artista";

        try (Connection conn = Conexao.getConexao();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                lista.add(new Artista(rs.getInt("id"), rs.getString("nome")));
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar artistas: " + e.getMessage());
        }

        return lista;
    }
}