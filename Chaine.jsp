public class Chaine {
    public static void main(String[] args) {
        String bonjour = "salut la compagnie";

        // Affichage en majuscules
        System.out.println("En majuscules : " + bonjour.toUpperCase());

        // Affichage avec seulement la première lettre en majuscule
        String capitalisee = capitalizeFirstLetter(bonjour);
        System.out.println("Première lettre en majuscule : " + capitalisee);
    }

    // Méthode pour mettre uniquement la première lettre en majuscule
    public static String capitalizeFirstLetter(String texte) {
        if (texte == null || texte.isEmpty()) {
            return texte;
        }
        return texte.substring(0, 1).toUpperCase() + texte.substring(1);
    }
}



