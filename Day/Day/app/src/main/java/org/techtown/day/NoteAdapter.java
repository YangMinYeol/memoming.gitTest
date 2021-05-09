package org.techtown.day;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import java.util.ArrayList;

public class NoteAdapter extends RecyclerView.Adapter<NoteAdapter.ViewHolder>{

    ArrayList<Note> items = new ArrayList<Note>();

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup viewGroup, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(viewGroup.getContext());
        View itemView = inflater.inflate(R.layout.note_item, viewGroup, false);

        return new ViewHolder(itemView);
    }

    public void addItem(Note item){
        items.add(item);
    }

    public void setItems(ArrayList<Note> items){
        this.items = items;
    }

    public Note getItem(int position){
        return items.get(position);
    }

    public void setItem(int position, Note item){
        items.set(position, item);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder viewHolder, int position) {
        Note item = items.get(position);
        viewHolder.setItem(item);

    }

    @Override
    public int getItemCount() { // 아이템 개수를 반환
        return items.size();
    }

    static class ViewHolder extends RecyclerView.ViewHolder{
        ImageView imageView;
        ImageView imageView2;
        TextView dateTextView;
        TextView Dday;
        TextView contentsTextView;

        public ViewHolder(View itemView){
            super(itemView);

            Dday = itemView.findViewById(R.id.Dday);
            dateTextView = itemView.findViewById(R.id.dateTextView);
            contentsTextView = itemView.findViewById(R.id.contentsTextView);
            imageView = itemView.findViewById(R.id.imageView);
            imageView2 = itemView.findViewById(R.id.imageView2);
        }

        public void setItem(Note item) {
            Dday.setText(item.getDday());
            dateTextView.setText(item.getCreateDate());
            contentsTextView.setText(item.getContents());
            imageView.setVisibility(View.VISIBLE);
            imageView2.setVisibility(View.VISIBLE);
        }
    }
}
