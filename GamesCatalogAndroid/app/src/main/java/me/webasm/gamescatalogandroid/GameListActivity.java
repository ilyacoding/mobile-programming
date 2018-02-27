package me.webasm.gamescatalogandroid;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

import java.util.ArrayList;

public class GameListActivity extends AppCompatActivity {
    
    ListView list;
    GameJSONParser gameJSONParser;
    ArrayList<Game> games;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_game_list);
        
        list = findViewById(R.id.GameList);

        gameJSONParser = new GameJSONParser(getResources().openRawResource(R.raw.game_list));
        games = gameJSONParser.parseToArrayList();

        GameListAdapter adapter = new GameListAdapter(this, games);
        list.setAdapter(adapter);
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long l) {
            Intent intent = new Intent(getBaseContext(), SingleGameItem.class);

            intent.putExtra("Game", games.get(position));
            startActivity(intent);
            }
        });
    }
}
