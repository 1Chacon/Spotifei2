/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author wilso
 */
public class Musica {
    private int id;
    private String nome;
    private String genero;
    private Artista artista;

    public Musica() {}

    public Musica(int id, String nome, String genero, Artista artista) {
        this.id = id;
        this.nome = nome;
        this.genero = genero;
        this.artista = artista;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public String getGenero() { return genero; }
    public void setGenero(String genero) { this.genero = genero; }

    public Artista getArtista() { return artista; }
    public void setArtista(Artista artista) { this.artista = artista; }

    @Override
    public String toString() {
        return nome + " - " + artista.getNome();
    }
}