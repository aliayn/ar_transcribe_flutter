-keep class com.sun.jna.* { *; }
-keepclassmembers class * extends com.sun.jna.* { public *; }

# JNA references desktop AWT APIs; they are not present on Android.
-dontwarn java.awt.Component
-dontwarn java.awt.GraphicsEnvironment
-dontwarn java.awt.HeadlessException
-dontwarn java.awt.Window
