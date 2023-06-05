class Playlist {
  constructor(name) {
    this.name = name; // プレイリストの名前
    this.songs = [];  // プレイリストの曲のリスト
    this.currentSongIndex = 0; // 現在再生中の曲のインデックス
  }

  addSong(song) {
    this.songs.push(song);
  }

  removeSong(song) {
    let index = this.songs.indexOf(song);
    if(index > -1) {
      this.songs.splice(index, 1);
      if (this.currentSongIndex > index) {
        this.currentSongIndex--;
      } else if (this.currentSongIndex === index && this.currentSongIndex === this.songs.length) {
        this.currentSongIndex--;
      }
    } else {
      console.log(`${song} is not in the playlist.`);
    }
  }

  play() {
    if (this.songs.length > 0) {
      return `再生中: ${this.songs[this.currentSongIndex]}`;
    } else {
      return 'The playlist is empty.';
    }
  }
}