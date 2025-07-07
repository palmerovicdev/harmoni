# 🎭 Harmoni - Aplicación de Seguimiento Emocional

<div align="center">
  <img src="assets/general/finished_icon.png" alt="Harmoni Logo" width="120" height="120">
  
  **Una aplicación Flutter para el seguimiento y análisis emocional con inteligencia artificial**
  
  [![Flutter](https://img.shields.io/badge/Flutter-3.5.3-blue.svg)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-3.5.3-blue.svg)](https://dart.dev/)
  [![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
</div>

## 📱 Descripción

Harmoni es una aplicación móvil desarrollada en Flutter que utiliza inteligencia artificial para detectar y analizar emociones a través de video y audio. La aplicación permite a los usuarios realizar un seguimiento de su bienestar emocional, identificar patrones y obtener insights valiosos sobre su estado mental a lo largo del tiempo.

## ✨ Funcionalidades Principales

### 🧠 Detección de Emociones con IA
- **Análisis de video**: Detección facial de emociones en tiempo real
- **Análisis de audio**: Reconocimiento de patrones emocionales en la voz
- **Emociones detectadas**: Alegría, tristeza, ira, miedo, sorpresa, disgusto, neutralidad y más

### 📊 Análisis y Visualización
- **Calendario emocional**: Vista mensual y anual de tus emociones
- **Patrones semanales**: Identifica qué días de la semana te sientes mejor
- **Horarios óptimos**: Descubre tus mejores momentos del día
- **Gráficos interactivos**: Visualización de datos emocionales con FL Chart

### 🎯 Seguimiento de Actividades
- **Actividades personalizadas**: Crea y gestiona tus propias actividades
- **Correlación emocional**: Vincula emociones con actividades específicas
- **Historial completo**: Acceso a todo tu registro emocional

### 🎨 Personalización
- **Temas**: Modo claro y oscuro
- **Colores**: Múltiples esquemas de color
- **Emojis**: Tres estilos (círculo, fantasma, rectángulo)
- **Accesibilidad**: Ajustes de contraste

### 👤 Gestión de Perfil
- **Autenticación segura**: Sistema JWT para login/registro
- **Configuración personal**: Nombre, edad, género, email
- **Configuraciones de seguridad**: Cambio de contraseña, eliminación de cuenta
- **Sistema de ayuda**: Guías categorizadas por funcionalidad

## 🏗️ Arquitectura Técnica

### 📁 Estructura del Proyecto
```
lib/
├── core/                    # Componentes centrales
│   ├── connection/         # Cliente HTTP (Dio)
│   ├── helpers/           # Utilidades y enums
│   ├── service_locator/   # Inyección de dependencias
│   └── widgets/           # Widgets reutilizables
├── features/              # Módulos por funcionalidad
│   ├── home/             # Pantalla principal
│   ├── my_profile/       # Gestión de usuario
│   └── settings/         # Configuraciones
├── router/               # Sistema de navegación
└── themes/               # Configuración de temas
```

### 🧱 Arquitectura Clean Architecture
- **Capa de Presentación**: Páginas, widgets y gestión de estado con BLoC
- **Capa de Dominio**: Entidades y lógica de negocio
- **Capa de Datos**: APIs, repositorios y modelos

### 🔧 Tecnologías Utilizadas

#### Framework y Lenguaje
- **Flutter** 3.5.3 - Framework multiplataforma
- **Dart** 3.5.3 - Lenguaje de programación

#### Gestión de Estado
- **flutter_bloc** ^8.1.6 - Patrón BLoC para gestión de estado
- **equatable** ^2.0.7 - Comparación de objetos

#### Comunicación de Red
- **dio** ^5.7.0 - Cliente HTTP robusto
- **json_annotation** ^4.9.0 - Serialización JSON

#### Navegación
- **go_router** ^14.6.3 - Declarative routing

#### Inyección de Dependencias
- **get_it** ^8.0.3 - Service locator pattern

#### Base de Datos
- **drift** ^2.23.1 - Base de datos local
- **sqlite3_flutter_libs** ^0.5.15 - SQLite para Flutter

#### Multimedia
- **camera** ^0.10.0+4 - Acceso a cámara
- **video_player** ^2.7.0 - Reproductor de video
- **flutter_svg** ^2.0.17 - Soporte para SVG

#### Visualización
- **fl_chart** ^1.0.0 - Gráficos interactivos
- **animate_do** ^3.3.4 - Animaciones

#### Utilidades
- **intl** ^0.20.1 - Internacionalización
- **path_provider** ^2.1.5 - Rutas del sistema
- **shared_preferences** ^2.5.3 - Almacenamiento local
- **logger** ^2.0.2 - Sistema de logging

## 🚀 Instalación y Configuración

### Prerrequisitos
- Flutter SDK 3.5.3 o superior
- Dart SDK 3.5.3 o superior
- Android Studio / Xcode (para desarrollo móvil)
- Servidor backend con API REST

### Pasos de Instalación

1. **Clonar el repositorio**
```bash
git clone https://github.com/tu-usuario/harmoni.git
cd harmoni
```

2. **Instalar dependencias**
```bash
flutter pub get
```

3. **Generar archivos de código**
```bash
dart run build_runner build
```

4. **Configurar el backend** (Ver sección [Configuración del Backend](#-configuración-del-backend))

5. **Ejecutar la aplicación**
```bash
flutter run
```

## 🔧 Configuración del Backend

### 📍 Configuración de URL

La URL del backend se configura en `lib/core/connection/connection.dart`:

```dart
// Configuración actual (desarrollo)
final String _baseUrl = Platform.isAndroid 
    ? 'http://10.0.2.2:8081'      // Android Emulator
    : 'http://localhost:8081';     // iOS Simulator

// Para producción, cambiar a:
final String _baseUrl = 'https://tu-servidor-produccion.com';
```

### 🌐 Endpoints de la API

#### Autenticación
- `POST /auth/signUp` - Registro de usuario
- `POST /auth/signIn` - Inicio de sesión

#### Perfil de Usuario
- `GET /myProfile/getUserProfile` - Obtener perfil
- `POST /myProfile/update` - Actualizar perfil
- `POST /myProfile/delete` - Eliminar cuenta
- `GET /myProfile/validateEmail/{email}` - Validar email
- `POST /myProfile/saveSettings` - Guardar configuraciones

#### Actividades y Emociones
- `GET /home/activities` - Obtener actividades
- `POST /home/createActivity` - Crear actividad
- `DELETE /home/deleteActivity/{id}` - Eliminar actividad
- `POST /home/trackEmotion` - Registrar emoción (video)
- `GET /home/emotions` - Obtener historial emocional
- `GET /home/emotionsByActivity/{id}` - Emociones por actividad

### 🔐 Autenticación

La aplicación utiliza tokens JWT para autenticación:

```dart
// Headers automáticos
{'Authorization': 'Bearer $token'}
```

## 🚢 Despliegue en Producción

### 1. Configurar URL de Producción

Editar `lib/core/connection/connection.dart`:

```dart
// CAMBIAR ESTA LÍNEA para producción
final String _baseUrl = 'https://tu-servidor-produccion.com';
```

### 2. Configurar Certificados SSL

Asegurar que tu servidor tenga certificados SSL válidos para HTTPS.

### 3. Actualizar Configuraciones

**Android** (`android/app/src/main/AndroidManifest.xml`):
```xml
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.RECORD_AUDIO" />
```

**iOS** (`ios/Runner/Info.plist`):
```xml
<key>NSCameraUsageDescription</key>
<string>La aplicación necesita acceso a la cámara para detectar emociones</string>
<key>NSMicrophoneUsageDescription</key>
<string>La aplicación necesita acceso al micrófono para analizar emociones</string>
```

### 4. Compilar para Producción

**Android:**
```bash
flutter build apk --release
# o
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

## 📋 Scripts de Desarrollo

### Generación de Código
```bash
# Generar archivos de serialización y assets
dart run build_runner build

# Generar en modo watch
dart run build_runner watch
```

### Análisis de Código
```bash
# Ejecutar análisis estático
flutter analyze

# Ejecutar tests
flutter test
```

### Limpieza
```bash
# Limpiar build
flutter clean

# Reinstalar dependencias
flutter pub get
```

## 🎯 Funcionalidades por Módulo

### 🏠 Módulo Home
- Dashboard principal con resumen emocional
- Calendario de emociones (mensual/anual)
- Registro de nuevas emociones
- Análisis de patrones semanales
- Identificación de horarios óptimos

### 👤 Módulo My Profile
- Registro e inicio de sesión
- Configuración de perfil personal
- Gestión de datos del usuario
- Configuración inicial de la aplicación

### ⚙️ Módulo Settings
- Configuración de cuenta
- Ajustes de seguridad
- Personalización de apariencia
- Sistema de ayuda por categorías

## 🔒 Seguridad

- **Autenticación JWT**: Tokens seguros para sesiones
- **Validación de datos**: Validación tanto en cliente como servidor
- **Encriptación**: Datos sensibles encriptados
- **Permisos**: Acceso granular a cámara y micrófono

## 📊 Casos de Uso

1. **Seguimiento diario**: Registra tu estado emocional diariamente
2. **Análisis de patrones**: Identifica triggers emocionales
3. **Bienestar mental**: Correlaciona actividades con emociones
4. **Autoconocimiento**: Comprende mejor tus patrones emocionales

## 🤝 Contribución

1. Fork el proyecto
2. Crear una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abrir un Pull Request

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Ver el archivo `LICENSE` para más detalles.

## 📞 Contacto

- **Proyecto**: [Harmoni](https://github.com/tu-usuario/harmoni)
- **Issues**: [GitHub Issues](https://github.com/tu-usuario/harmoni/issues)

## 🙏 Agradecimientos

- Team Flutter por el excelente framework
- Comunidad de desarrolladores Flutter
- Bibliotecas open source utilizadas

---

<div align="center">
  <p>Hecho con ❤️ para el bienestar emocional</p>
</div>
