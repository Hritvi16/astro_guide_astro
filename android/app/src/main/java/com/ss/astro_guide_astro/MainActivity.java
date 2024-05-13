package com.ss.astro_guide_astro;
import io.flutter.embedding.android.FlutterActivity;
import android.os.Bundle;
import io.flutter.plugins.GeneratedPluginRegistrant;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.media.AudioAttributes;
import android.net.Uri;
import android.os.Build;





public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            Uri soundUri = Uri.parse( "android.resource://" +  getApplicationContext().getPackageName() + "/" +  R.raw.notinoti);

            AudioAttributes audioAttributes = new AudioAttributes.Builder()
                    .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                    .setUsage(AudioAttributes.USAGE_ALARM)
                    .build();

            // Creating Channel
            NotificationChannel channel = new NotificationChannel("default_channel_id", "Default Notifications", NotificationManager.IMPORTANCE_HIGH);
            channel.setSound(soundUri, audioAttributes);

            NotificationManager notificationManager = getSystemService(NotificationManager.class);
            notificationManager.createNotificationChannel(channel);
        }
    }

}
