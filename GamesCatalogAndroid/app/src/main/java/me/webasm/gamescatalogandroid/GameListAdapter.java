package me.webasm.gamescatalogandroid;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.ArrayList;

/**
 * Created by ikovalenko on 2/26/18.
 */

public class GameListAdapter extends BaseAdapter {
    private final Activity context;
    private final ArrayList<Game> games;

    @Override
    public int getCount() {
        return games.size();
    }

    @Override
    public Object getItem(int position) {
        return games.get(position);
    }

    @Override
    public long getItemId(int i) {
        return 0;
    }

    @Override
    public View getView(int position, View view, ViewGroup viewGroup) {

        View viewInflate = view;
        if(viewInflate == null) {
            viewInflate = context.getLayoutInflater().inflate(R.layout.row_layout, null);
        }

        TextView title = viewInflate.findViewById(R.id.GameTitle);
        TextView shortDescription = viewInflate.findViewById(R.id.GameShortDescription);
        TextView gameYear = viewInflate.findViewById(R.id.GameYear);
        ImageView thumbImage = viewInflate.findViewById(R.id.GameImagePreview);

        Game game = games.get(position);

        title.setText(game.getTitle());
        shortDescription.setText(game.getShortDescription());
        gameYear.setText(game.getReleaseDate());
        thumbImage.setImageResource(context.getResources().getIdentifier(game.getImage(),
                "drawable", context.getPackageName()));

        return viewInflate;
    }

    public GameListAdapter(Activity context, ArrayList<Game> games) {
        this.context = context;
        this.games = games;
    }
}
