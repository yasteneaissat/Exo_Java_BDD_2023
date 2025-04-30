import java.util.*;

public class AsciiArt {

    public static void main(String[] args) {
        // Exemple de paramètres
        int L = 4; // Largeur de chaque lettre
        int H = 5; // Hauteur de chaque lettre
        String T = "Hello, World!".toUpperCase();

        // Représentation ASCII des lettres A-Z et '?'
        // Chaque ligne contient 27 blocs de 4 caractères
        String[] rows = {
            " A  B  C  D  E  F  G  H  I  J  K  L  M  N  O  P  Q  R  S  T  U  V  W  X  Y  Z  ? ",
            "AA BB CC DD EE FF GG HH II JJ KK LL MM NN OO PP QQ RR SS TT UU VV WW XX YY ZZ ??",
            "AA BB CC DD EE FF GG HH II JJ KK LL MM NN OO PP QQ RR SS TT UU VV WW XX YY ZZ ??",
            "AA BB CC DD EE FF GG HH II JJ KK LL MM NN OO PP QQ RR SS TT UU VV WW XX YY ZZ ??",
            "AA BB CC DD EE FF GG HH II JJ KK LL MM NN OO PP QQ RR SS TT UU VV WW XX YY ZZ ??"
        };

        // Nettoyage des lignes (pour cet exemple simple avec des espaces entre les blocs)
        for (int i = 0; i < H; i++) {
            rows[i] = rows[i].replace(" ", "");
        }

        // Affichage ASCII Art
        for (int i = 0; i < H; i++) {
            StringBuilder line = new StringBuilder();
            for (char c : T.toCharArray()) {
                int index = c - 'A';
                if (index < 0 || index > 25) {
                    index = 26; // '?' pour tout ce qui n’est pas une lettre
                }
                int start = index * L;
                int end = start + L;
                line.append(rows[i], start, end);
            }
            System.out.println(line.toString());
        }
    }
}

