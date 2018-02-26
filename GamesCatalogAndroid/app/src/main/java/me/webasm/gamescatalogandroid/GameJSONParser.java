package me.webasm.gamescatalogandroid;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

/**
 * Created by ikovalenko on 2/26/18.
 */

public class GameJSONParser {
    private InputStream _inputStream;

    public GameJSONParser(InputStream inputStream) {
        _inputStream = inputStream;
    }

    public ArrayList<Game> parseToArrayList() {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ArrayList<Game> data = new ArrayList<>();

        try {
            int ctr = _inputStream.read();
            while (ctr != -1) {
                byteArrayOutputStream.write(ctr);
                ctr = _inputStream.read();
            }
            _inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        try {
            JSONObject jObject = new JSONObject(byteArrayOutputStream.toString());
            JSONArray jArray = jObject.getJSONArray("games");


            for (int i = 0; i < jArray.length(); i++) {

                String title = jArray.getJSONObject(i).getString("title");
                String releaseDate = jArray.getJSONObject(i).getString("releaseDate");
                String shortDescription = jArray.getJSONObject(i).getString("shortDescription");
                String fullDescription = jArray.getJSONObject(i).getString("fullDescription");
                String url = jArray.getJSONObject(i).getString("url");
                String image = jArray.getJSONObject(i).getString("image");
                String fullImage = jArray.getJSONObject(i).getString("fullImage");
                data.add(new Game(title, releaseDate, shortDescription, fullDescription, url, image, fullImage));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return data;
    }
}
