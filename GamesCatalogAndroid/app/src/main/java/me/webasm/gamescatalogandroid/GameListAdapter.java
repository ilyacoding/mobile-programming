package me.webasm.gamescatalogandroid;

import android.app.Activity;
import android.text.Layout;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * Created by ikovalenko on 2/26/18.
 */

public class GameListAdapter extends BaseAdapter {
    private final Activity context;
    private final String[] names;

    @Override
    public int getCount() {
        return names.length;
    }

    @Override
    public Object getItem(int position) {
        return names[position];
    }

    @Override
    public long getItemId(int i) {
        return 0;
    }

    @Override
    public View getView(int position, View view, ViewGroup viewGroup) {

        View rowView = view;

        if (rowView == null) {
            LayoutInflater inflater = context.getLayoutInflater();
            rowView = inflater.inflate(R.layout.row_layout, null);

            ViewHolder viewHolder = new ViewHolder();
            viewHolder.text = (TextView) rowView.findViewById(R.id.GameTitle);
            viewHolder.image = (ImageView) rowView.findViewById(R.id.GamePreview);
            rowView.setTag(viewHolder);
        }

        ViewHolder holder = (ViewHolder) rowView.getTag();
        String s = names[position];
        holder.text.setText(s);
        holder.image.setImageResource(R.mipmap.ic_launcher);

        return rowView;
    }


    static class ViewHolder {
        public TextView text;
        public ImageView image;
    }

    public GameListAdapter(Activity context, String[] names) {
        this.context = context;
        this.names = names;
    }
}
