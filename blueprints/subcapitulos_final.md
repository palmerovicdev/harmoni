## 2.2 Arquitectura y Componentes del Sistema

La aplicación Harmoni implementa una arquitectura modular basada en Clean Architecture, diseñada específicamente para una aplicación de seguimiento emocional y bienestar mental. Esta arquitectura se caracteriza por su modularidad, separación clara de responsabilidades y capacidad de adaptación a diferentes escenarios de uso.

### 2.2.1 Estructura General del Proyecto

La aplicación Harmoni está organizada en una estructura de carpetas que refleja los principios de Clean Architecture:

- **`lib/core/`**: Contiene componentes centrales compartidos por toda la aplicación
- **`lib/features/`**: Contiene los módulos de funcionalidades específicas
- **`lib/router/`**: Sistema de navegación y enrutamiento
- **`lib/themes/`**: Configuraciones de temas (actualmente vacío)
- **`lib/generated/`**: Archivos generados automáticamente

### 2.2.2 Módulo de Datos y Gestión de Información

#### Cliente HTTP con Dio
La aplicación utiliza la biblioteca Dio como cliente HTTP principal para las comunicaciones de red. La implementación se encuentra en `lib/core/connection/connection.dart` y proporciona:

- Configuración de URL base según la plataforma (Android: `http://10.0.2.2:8081`, iOS: `http://localhost:8081`)
- Métodos HTTP básicos (GET, POST, PUT, DELETE)
- Manejo de tokens de autenticación en headers
- Logging básico de peticiones y respuestas

#### APIs Implementadas
La aplicación cuenta con dos APIs principales:

**HomeApi** (`lib/features/home/data/api/home_api.dart`):
- `getActivities()`: Obtiene lista de actividades disponibles
- `createActivities()`: Crea nuevas actividades
- `deleteActivity()`: Elimina actividades específicas
- `trackEmotion()`: Envía videos para análisis emocional usando FormData
- `getEmotionsByActivity()`: Obtiene emociones por actividad específica
- `getEmotions()`: Obtiene historial completo de emociones

**MyProfileApi** (`lib/features/my_profile/data/api/my_profile_api.dart`):
- `signUp()`: Registro de nuevos usuarios
- `signIn()`: Autenticación de usuarios
- `getUserProfile()`: Obtiene perfil del usuario
- `validateEmail()` y `validateName()`: Validaciones de datos
- `updateUser()`: Actualización de datos del usuario
- `deleteAccount()`: Eliminación de cuenta
- `saveSettings()` y `getSettings()`: Gestión de configuraciones

### 2.2.3 Organización Modular y Features

La aplicación está organizada en tres módulos principales:

#### Módulo Home
Ubicado en `lib/features/home/`, este módulo gestiona:
- Dashboard principal del usuario
- Seguimiento emocional
- Gestión de actividades
- Análisis de emociones mediante videos

Estructura del módulo:
- `data/`: APIs y repositorios
- `model/`: Modelos de datos y entidades
- `presentation/`: Páginas, widgets y gestión de estado
- `service/`: Lógica de negocio

#### Módulo My Profile
Ubicado en `lib/features/my_profile/`, gestiona:
- Procesos de autenticación (sign in/sign up)
- Configuración de perfil de usuario
- Gestión de datos personales
- Configuraciones de la aplicación

#### Módulo Settings
Ubicado en `lib/features/settings/`, proporciona:
- Configuraciones de cuenta
- Configuraciones de seguridad
- Configuraciones visuales
- Ayuda y soporte

### 2.2.4 Gestión de Estado y Patrón BLoC

La aplicación utiliza el patrón BLoC (Business Logic Component) con Cubits para la gestión de estado:

#### Cubits Implementados

**HomeCubit** (`lib/features/home/presentation/state_management/home_cubit.dart`):
- Implementación básica con estado inicial
- Gestión del estado de la pantalla principal

**HomeTrackEmotionCubit** (`lib/features/home/presentation/state_management/home_track_emotion_cubit.dart`):
- Gestión específica del seguimiento de emociones

**Cubits de Autenticación** (`lib/features/my_profile/presentation/state_management/`):
- `SignInCubit`: Maneja el proceso de inicio de sesión
- `SignUpCubit`: Gestiona el registro de usuarios
- `InitCubit`: Controla el estado inicial de la aplicación

**Cubits de Configuración**:
- `StyleSettingCubit`: Gestiona configuraciones visuales
- `NameSettingCubit`: Maneja configuración de nombre
- `AgeCubit`: Gestiona configuración de edad
- `GenderSelectionCubit`: Maneja selección de género

#### StyleSettingCubit
El `StyleSettingCubit` (`lib/features/settings/presentation/state_management/style_setting/style_setting_cubit.dart`) es el componente principal para la gestión de temas:

- Control de brillo (modo claro/oscuro)
- Personalización de colores
- Ajustes de contraste
- Selección de tipo de emoji (circle, ghost, rect)

### 2.2.5 Sistema de Navegación y Enrutamiento

La aplicación utiliza GoRouter como sistema de navegación principal (`lib/router/router.dart`):

#### Configuración del Router
- Navegador raíz con `GlobalKey<NavigatorState>`
- Observador de rutas para debugging
- Ruta inicial configurada en `HomeRoute.home`

#### Rutas Implementadas

**Rutas del Home**:
- `/home`: Página principal
- `/camera`: Página de cámara para grabación de videos

**Rutas de Perfil**:
- `/init`: Página inicial de configuración
- `/signIn`: Página de inicio de sesión
- `/signUp`: Página de registro
- `/name`: Configuración de nombre
- `/age`: Configuración de edad
- `/gender`: Configuración de género
- `/allDone`: Página de finalización
- `/account`: Configuración de cuenta
- `/security`: Configuración de seguridad
- `/change_password`: Cambio de contraseña
- `/style`: Configuración de estilo
- `/help`: Página de ayuda

#### ShellRoute
La aplicación implementa un `ShellRoute` que envuelve las rutas principales con `HomeWrapperPage`, proporcionando una estructura de navegación consistente.

### 2.2.6 Gestión de Dependencias y Service Locator

La aplicación utiliza GetIt como contenedor de dependencias (`lib/core/service_locator/service_locator.dart`):

#### Configuración del Service Locator
- Registro de singletons para servicios principales
- Inicialización centralizada de dependencias
- Funciones helper para acceso a servicios

#### Servicios Registrados
- `Database`: Servicio de base de datos local
- `Connection`: Cliente HTTP con Dio
- `MyProfileApi`: API de perfil de usuario
- `MyProfileRepository`: Repositorio de perfil
- `MyProfileService`: Servicio de lógica de negocio de perfil
- `HomeApi`: API de funcionalidades principales
- `HomeRepository`: Repositorio de funcionalidades principales
- `HomeService`: Servicio de lógica de negocio principal

#### Patrón de Inyección de Dependencias
- Uso de interfaces para abstracción
- Inversión de dependencias mediante abstracciones
- Facilita testing mediante mocking de dependencias

### 2.2.7 Integración con APIs y Comunicación de Red

#### Manejo de Autenticación
- Uso de tokens JWT para autenticación
- Almacenamiento de token en la instancia de Connection
- Inclusión automática de token en headers de autorización

#### Manejo de Archivos Multimedia
- Uso de `FormData` para envío de videos
- `MultipartFile` para archivos de video
- Headers específicos para contenido multimedia

#### Manejo de Errores
- Verificación de códigos de estado HTTP
- Manejo básico de errores de red
- Logging de peticiones y respuestas

#### Endpoints Principales
- **Autenticación**: `/auth/signIn`, `/auth/signUp`
- **Perfil**: `/myProfile/*` (múltiples endpoints)
- **Actividades**: `/home/activities`, `/home/createActivity`, `/home/deleteActivity`
- **Emociones**: `/home/trackEmotion`, `/home/emotions`, `/home/emotionsByActivity`

### 2.2.8 Características Técnicas Implementadas

#### Persistencia de Datos
- Base de datos local implementada
- Gestión de configuraciones de usuario
- Almacenamiento de preferencias de tema

#### Logging y Debugging
- Sistema de logging implementado
- Observador de rutas para debugging
- Logging de peticiones HTTP

#### Gestión de Assets
- Sistema de assets generado automáticamente
- Organización de imágenes, iconos y recursos
- Carga de información de ayuda desde archivos JSON

#### Configuración de Plataforma
- Diferenciación entre Android e iOS para URLs
- Configuración específica por plataforma
- Manejo de recursos nativos

### 2.2.9 Limitaciones y Áreas de Mejora

#### Funcionalidades No Implementadas
- Sistema de temas completo (carpeta themes vacía)
- Manejo avanzado de errores de red
- Estrategias de retry y fallback
- Caché de datos
- Sincronización offline

#### Aspectos de Seguridad
- Validación básica de tokens
- Manejo simple de autenticación
- Falta de encriptación avanzada de datos sensibles

#### Rendimiento
- No hay optimizaciones específicas para archivos multimedia
- Falta de compresión de datos
- No hay estrategias de lazy loading

Esta arquitectura proporciona una base sólida para el desarrollo de funcionalidades de seguimiento emocional, aunque requiere mejoras en aspectos de seguridad, rendimiento y manejo de errores para una aplicación de producción completa. 