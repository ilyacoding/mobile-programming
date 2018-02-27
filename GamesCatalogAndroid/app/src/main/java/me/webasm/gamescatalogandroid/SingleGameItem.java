package me.webasm.gamescatalogandroid;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.ActionBar;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * Created by ikovalenko on 2/27/18.
 */

public class SingleGameItem extends AppCompatActivity {
    Game game;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.setContentView(R.layout.activity_single_game_item);

        ActionBar actionBar = getSupportActionBar();
        actionBar.setDisplayHomeAsUpEnabled(true);
        actionBar.setDisplayShowHomeEnabled(true);

        game = (Game) getIntent().getSerializableExtra("Game");

        TextView gameTitle = findViewById(R.id.GameFullTitle);
        TextView gameDescription = findViewById(R.id.GameDescription);
        TextView gameReleaseYear = findViewById(R.id.GameReleaseYear);
        ImageView thumbImage = findViewById(R.id.GameFullImage);
        Button openUrlButton = findViewById(R.id.GameOpenUrl);

        actionBar.setTitle(game.getTitle());
        thumbImage.setImageResource(getResources().getIdentifier(game.getFullImage(), "drawable", getPackageName()));
        gameTitle.setText(game.getTitle());
        gameDescription.setText(game.getFullDescription());
        gameReleaseYear.setText("Release date: " + game.getReleaseDate());

        openUrlButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View view) {
            Intent intent = new Intent(getBaseContext(), WebViewActivity.class);

            intent.putExtra("url", game.getUrl());
            startActivity(intent);
            }
        });
    }

    @Override
    public boolean onSupportNavigateUp() {
        onBackPressed();
        return true;
    }
}
