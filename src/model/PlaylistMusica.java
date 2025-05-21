/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author wilso
 */
public class PlaylistMusica {
    private int id;
    private Playlist playlist;
    private Musica musica;

    public PlaylistMusica() {}

    public PlaylistMusica(int id, Playlist playlist, Musica musica) {
        this.id = id;
        this.playlist = playlist;
        this.musica = musica;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Playlist getPlaylist() { return playlist; }
    public void setPlaylist(Playlist playlist) { this.playlist = playlist; }

    public Musica getMusica() { return musica; }
    public void setMusica(Musica musica) { this.musica = musica; }
}
