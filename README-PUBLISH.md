https://docs.flutter.dev/deployment/android#add-a-launcher-icon

https://docs.flutter.dev/deployment/android
flutter build appbundle

cd waiwai-mobile\
cd android\app\
keytool -genkey -v -keystore release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias release
 
version: VER_NAME+VER_CODE

```
name: dicionario_waiwai
description: "Dicionário das palavras do dicionário Waiwai."

publish_to: "none"

version: 1.0.1+2
```

Compress-Archive -Path 'C:\Users\junior\Documents\Projetos\Waiwai\mobile\build\app\intermediates\merged_native_libs\release\out\lib\*' -DestinationPath 'C:\Users\junior\Documents\Projetos\Waiwai\mobile\build\app\outputs\bundle\release\symbols.zip'
