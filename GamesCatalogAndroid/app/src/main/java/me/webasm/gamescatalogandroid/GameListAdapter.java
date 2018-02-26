package me.webasm.gamescatalogandroid;

import android.app.Activity;
import android.media.Image;
import android.text.Layout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import org.w3c.dom.Text;

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

        View vi = view;
        if(vi == null) {
            vi = context.getLayoutInflater().inflate(R.layout.row_layout, null);
        }

        TextView title = (TextView)vi.findViewById(R.id.GameTitle);
        TextView shortDescription = (TextView)vi.findViewById(R.id.GameShortDescription);
        TextView gameYear = (TextView)vi.findViewById(R.id.GameYear);
        ImageView thumbImage = (ImageView)vi.findViewById(R.id.GameImagePreview);
//        TextView duration = (TextView)vi.findViewById(R.id.duration); // duration
//        ImageView thumb_image=(ImageView)vi.findViewById(R.id.list_image); // thumb image

//        HashMap&lt;String, String&gt; song = new HashMap&lt;String, String&gt;();
        Game game = games.get(position);

        title.setText(game.Title);
        shortDescription.setText(game.ShortDescription);
        gameYear.setText(game.ReleaseDate);
        thumbImage.setImageResource(context.getResources().getIdentifier(game.Image, "drawable", context.getPackageName()));
//        duration.setText(song.get(CustomizedListView.KEY_DURATION));
//        imageLoader.DisplayImage(song.get(CustomizedListView.KEY_THUMB_URL), thumb_image);

        return vi;

//        View rowView = view;
//
//        if (rowView == null) {
//            LayoutInflater inflater = ;
//            rowView = inflater.inflate(R.layout.row_layout, null);
//
//            ViewHolder viewHolderTitle = new ViewHolder();
//            viewHolderTitle.text = rowView.findViewById(R.id.GameTitle);
//            rowView.setTag(viewHolderTitle);
//
//            ViewHolder viewHolderShortDescription = new ViewHolder();
//            viewHolderShortDescription.text = rowView.findViewById(R.id.GameShortDescription);
//            rowView.setTag(viewHolderShortDescription);
//
//
//
////            viewHolder.image = (ImageView) rowView.findViewById(R.id.GamePreview);
////            rowView.setTag(viewHolder);
//        }
//
//        ViewHolder holderTitle = (ViewHolder) rowView.getTag();
//        String s = games.get(position).Title;
//        holder.text.setText(s);
//        holder.image.setImageResource(R.mipmap.ic_launcher);
//
//        return rowView;
    }


    static class ViewHolder {
        public TextView text;
        public ImageView image;
    }

    public GameListAdapter(Activity context, ArrayList<Game> games) {
        this.context = context;
        this.games = games;
    }
}
