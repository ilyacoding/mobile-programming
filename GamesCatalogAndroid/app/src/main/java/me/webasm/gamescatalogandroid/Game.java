package me.webasm.gamescatalogandroid;

import java.io.Serializable;

/**
 * Created by ikovalenko on 2/26/18.
 */

class Game implements Serializable {
    private String title;
    private String releaseDate;
    private String shortDescription;
    private String fullDescription;
    private String url;
    private String image;
    private String fullImage;

    public String getTitle() {
        return title;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public String getFullDescription() {
        return fullDescription;
    }

    public String getUrl() {
        return url;
    }

    public String getImage() {
        return image;
    }

    public String getFullImage() {
        return fullImage;
    }

    Game(String title, String releaseDate, String shortDescription, String fullDescription,
         String url, String image, String fullImage) {
        this.title = title;
        this.releaseDate = releaseDate;
        this.shortDescription = shortDescription;
        this.fullDescription = fullDescription;
        this.url = url;
        this.image = image;
        this.fullImage = fullImage;
    }
}
