package me.webasm.gamescatalogandroid;

/**
 * Created by ikovalenko on 2/26/18.
 */

public class Game {
    public String Title;
    public String ReleaseDate;
    public String ShortDescription;
    public String FullDescription;
    public String Url;
    public String Image;
    public String FullImage;

    public Game(String title, String releaseDate, String shortDescription, String fullDescription, String url, String image, String fullImage) {
        Title = title;
        ReleaseDate = releaseDate;
        ShortDescription = shortDescription;
        FullDescription = fullDescription;
        Url = url;
        Image = image;
        FullImage = fullImage;
    }

}
