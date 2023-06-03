# AgroXpert-Frontend

Descargar e Instalar.

Go: https://go.dev/doc/install
Flutter : https://docs.flutter.dev/get-started/install
Dart : https://dart.dev/get-dart

--En Visual Studio Code:
Se debe instalar diferentes extensiones para visual estudio code
   - Flutter
   - Flutter Widget Snippets
   - Go
   - Dart
   - dart-import 
 
paso 1: en Backend se debe instalar go fiber con el comando :  "go get github.com/gofiber/fiber/v2" y instalar todas las dependencias que use go con el comando: "go mod download"
paso 2: se inicia Backend de manera local con Go y mongoDb (se debe tener el .env credenciales base de datos) con el comando : "go run ." .
paso 3: se inicia Frontend de manera local recomendado en Chrome con el comando : "flutter run --no-sound-null-safety" , pues el servidor de backend esta local en el pc.
