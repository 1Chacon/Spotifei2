/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author wilso
 */
public class Playlist {
    private int id;
    private String nome;
    private Usuario usuario;

    public Playlist() {}

    public Playlist(int id, String nome, Usuario usuario) {
        this.id = id;
        this.nome = nome;
        this.usuario = usuario;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public Usuario getUsuario() { return usuario; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }

    @Override
    public String toString() {
        return nome;
    }
}
