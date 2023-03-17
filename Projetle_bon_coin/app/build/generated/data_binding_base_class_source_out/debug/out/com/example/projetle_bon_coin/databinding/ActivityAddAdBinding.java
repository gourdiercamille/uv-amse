// Generated by view binder compiler. Do not edit!
package com.example.projetle_bon_coin.databinding;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.viewbinding.ViewBinding;
import androidx.viewbinding.ViewBindings;
import com.example.projetle_bon_coin.R;
import java.lang.NullPointerException;
import java.lang.Override;
import java.lang.String;

public final class ActivityAddAdBinding implements ViewBinding {
  @NonNull
  private final ConstraintLayout rootView;

  @NonNull
  public final Button button;

  @NonNull
  public final EditText editTextTextPersonName;

  @NonNull
  public final EditText editTextTextPersonName2;

  @NonNull
  public final ImageView imageView2;

  @NonNull
  public final TextView textView2;

  @NonNull
  public final TextView textView6;

  private ActivityAddAdBinding(@NonNull ConstraintLayout rootView, @NonNull Button button,
      @NonNull EditText editTextTextPersonName, @NonNull EditText editTextTextPersonName2,
      @NonNull ImageView imageView2, @NonNull TextView textView2, @NonNull TextView textView6) {
    this.rootView = rootView;
    this.button = button;
    this.editTextTextPersonName = editTextTextPersonName;
    this.editTextTextPersonName2 = editTextTextPersonName2;
    this.imageView2 = imageView2;
    this.textView2 = textView2;
    this.textView6 = textView6;
  }

  @Override
  @NonNull
  public ConstraintLayout getRoot() {
    return rootView;
  }

  @NonNull
  public static ActivityAddAdBinding inflate(@NonNull LayoutInflater inflater) {
    return inflate(inflater, null, false);
  }

  @NonNull
  public static ActivityAddAdBinding inflate(@NonNull LayoutInflater inflater,
      @Nullable ViewGroup parent, boolean attachToParent) {
    View root = inflater.inflate(R.layout.activity_add_ad, parent, false);
    if (attachToParent) {
      parent.addView(root);
    }
    return bind(root);
  }

  @NonNull
  public static ActivityAddAdBinding bind(@NonNull View rootView) {
    // The body of this method is generated in a way you would not otherwise write.
    // This is done to optimize the compiled bytecode for size and performance.
    int id;
    missingId: {
      id = R.id.button;
      Button button = ViewBindings.findChildViewById(rootView, id);
      if (button == null) {
        break missingId;
      }

      id = R.id.editTextTextPersonName;
      EditText editTextTextPersonName = ViewBindings.findChildViewById(rootView, id);
      if (editTextTextPersonName == null) {
        break missingId;
      }

      id = R.id.editTextTextPersonName2;
      EditText editTextTextPersonName2 = ViewBindings.findChildViewById(rootView, id);
      if (editTextTextPersonName2 == null) {
        break missingId;
      }

      id = R.id.imageView2;
      ImageView imageView2 = ViewBindings.findChildViewById(rootView, id);
      if (imageView2 == null) {
        break missingId;
      }

      id = R.id.textView2;
      TextView textView2 = ViewBindings.findChildViewById(rootView, id);
      if (textView2 == null) {
        break missingId;
      }

      id = R.id.textView6;
      TextView textView6 = ViewBindings.findChildViewById(rootView, id);
      if (textView6 == null) {
        break missingId;
      }

      return new ActivityAddAdBinding((ConstraintLayout) rootView, button, editTextTextPersonName,
          editTextTextPersonName2, imageView2, textView2, textView6);
    }
    String missingId = rootView.getResources().getResourceName(id);
    throw new NullPointerException("Missing required view with ID: ".concat(missingId));
  }
}
