# keytool -exportcert -alias YOUR_KEY_ALIAS -keystore YOUR_KEYSTORE_PATH | openssl sha1 -binary | openssl base64
OWq8gKVyvxWB2ceQxiXqVDWOpBc=
Tạo mã Hash

Trong đó YOUR_KEY_ALIAS là 1 alias được tạo ra khi tạo key cho ứng dụng.
Với keystore release: upload (lấy trong key.properties)

YOUR_KEYSTORE_PATH: là đường dẫn đến keystore của ứng dụng.

Tại root project: cd android/app/keys && pwd
