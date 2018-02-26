package me.webasm.gamescatalogandroid;

import android.content.res.Resources;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

public class GameListActivity extends AppCompatActivity {
    
    ListView list;
    GameJSONParser gameJSONParser;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_game_list);
        
        list = findViewById(R.id.GameList);

        gameJSONParser = new GameJSONParser(getResources().openRawResource(R.raw.game_list));
        
//        final String [] values = new String[] {
//            "Android", "iOS", "Fedora", "Mac OS", "Windows", "Ubuntu", "Debian", "Linux", "Mint", "Kolibri", "MS-DOS"
//        };
//
        GameListAdapter adapter = new GameListAdapter(this, gameJSONParser.parseToArrayList());
        list.setAdapter(adapter);
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long l) {
//                Toast.makeText(GameListActivity.this, values[position], Toast.LENGTH_SHORT).show();
            }
        });
    }
}
