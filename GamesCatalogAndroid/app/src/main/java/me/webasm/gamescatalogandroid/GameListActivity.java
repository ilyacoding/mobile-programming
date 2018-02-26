package me.webasm.gamescatalogandroid;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.Toast;

public class GameListActivity extends AppCompatActivity {
    
    ListView list;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_game_list);
        
        list = (ListView) findViewById(R.id.GameList);
        
        final String [] values = new String[] { 
            "Android", "iOS", "Fedora", "Mac OS", "Windows", "Ubuntu", "Debian", "Linux", "Mint", "Kolibri", "MS-DOS"
        };
        
        GameListAdapter adapter = new GameListAdapter(this, values);
        list.setAdapter(adapter);
        list.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long l) {
                Toast.makeText(GameListActivity.this, values[position], Toast.LENGTH_SHORT).show();
            }
        });
    }
}
