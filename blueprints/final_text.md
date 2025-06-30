2.2 Implementación de la aplicación Harmoni
La aplicación Harmoni implementa una arquitectura robusta y escalable, fundamentada en los principios de Clean Architecture y patrones de diseño modernos. Ha sido diseñada específicamente para satisfacer los requisitos de una aplicación de seguimiento emocional y bienestar mental, caracterizándose por su modularidad, clara separación de responsabilidades y capacidad de adaptación a diferentes escenarios de uso. Esto proporciona una base sólida para el desarrollo de funcionalidades complejas relacionadas con la detección de emociones y el análisis de contenido multimedia.

La implementación arquitectónica de Harmoni se estructura en múltiples capas que garantizan la independencia entre componentes, facilitando el mantenimiento, testing y evolución del sistema. Esta aproximación permite que la aplicación sea resiliente ante cambios en los requisitos del negocio y proporciona una base sólida para la integración con servicios externos de inteligencia artificial y análisis emocional.

2.2.1 Estructura General del Proyecto
La aplicación Harmoni está organizada en una estructura de carpetas que refleja los principios de Clean Architecture:

lib/core/: Contiene componentes centrales compartidos por toda la aplicación.

lib/features/: Contiene los módulos de funcionalidades específicas.

lib/router/: Sistema de navegación y enrutamiento.

lib/themes/: Configuraciones de temas.

lib/generated/: Archivos generados automáticamente.

2.2.2 Módulo de Datos y Gestión de Información
El módulo de datos constituye el pilar fundamental en la administración y gestión de información dentro del ecosistema de la aplicación Harmoni. Este componente actúa como un puente estratégico que se posiciona entre la capa de datos y la lógica de negocio, garantizando que la información se procese, valide y distribuya de manera coherente, eficiente y segura a través de toda la arquitectura de la aplicación.

La implementación de este módulo sigue los principios fundamentales de la Clean Architecture, donde la separación de responsabilidades y la inversión de dependencias son elementos clave para mantener la escalabilidad y mantenibilidad del sistema. Esta aproximación permite que la aplicación sea resiliente ante cambios en las fuentes de datos y facilita la implementación de nuevas funcionalidades sin afectar la estabilidad del sistema existente.

El sistema de datos implementado en Harmoni se fundamenta en una arquitectura de capas bien definida que incluye interfaces de comunicación con APIs externas, repositorios que gestionan el acceso a datos, y servicios que implementan la lógica de negocio específica. Esta organización arquitectónica facilita la implementación de patrones de inversión de dependencias, permitiendo que los componentes de alto nivel dependan de abstracciones en lugar de implementaciones concretas.

Cliente HTTP con Dio
La aplicación utiliza la biblioteca Dio como cliente HTTP principal para las comunicaciones de red. La implementación se encuentra en lib/core/connection/connection.dart y proporciona:

Configuración de URL base según la plataforma (Android: http://10.0.2.2:8081, iOS: http://localhost:8081).

Métodos HTTP básicos (GET, POST, PUT, DELETE).

Manejo de tokens de autenticación en headers.

Logging básico de peticiones y respuestas.

APIs Implementadas
La aplicación cuenta con dos APIs principales:

HomeApi (lib/features/home/data/remote/home_api.dart): Gestiona las operaciones relacionadas con la pantalla de inicio, incluyendo la obtención de actividades y emociones.

getActivities: /home/activities

getEmotions: /home/emotions

getEmotionsByActivity: /home/emotionsByActivity

TrackEmotionApi (lib/features/track_emotion/data/remote/track_emotion_api.dart): Maneja las operaciones para el seguimiento y registro de emociones.

trackEmotion: /home/trackEmotion

La comunicación con servicios externos se realiza a través de una capa de abstracción implementada mediante la biblioteca Dio, que proporciona funcionalidades avanzadas para el manejo de peticiones HTTP, incluyendo soporte para diferentes tipos de contenido multimedia, manejo de errores robusto y optimización de rendimiento. Esta implementación permite que la aplicación maneje de manera efectiva archivos de video que son fundamentales para el análisis emocional, implementando validaciones de formato y tamaño para garantizar la calidad de los datos.

El flujo de trabajo implementado en la gestión de emociones sigue una secuencia lógica y bien definida que garantiza la integridad y consistencia de los datos. Cuando el usuario accede a la funcionalidad de seguimiento de emociones, el sistema se comunica de manera transparente con los servicios externos para obtener las actividades disponibles y el historial de emociones, implementando estrategias de caché para optimizar el rendimiento. Para registrar una nueva emoción, el usuario graba un video que se procesa y se envía al servidor, asegurando que el feedback se muestre de manera fluida en la interfaz de usuario.

2.2.3 Módulos Core
Dentro de la estructura de lib/core/, se encuentran varios módulos que encapsulan funcionalidades y componentes compartidos a lo largo de toda la aplicación, siguiendo los principios de Clean Architecture:

lib/core/connection/: Contiene la configuración del cliente HTTP (Dio) y la lógica para las comunicaciones de red.

lib/core/dependency_injection/: Se encarga de la inyección de dependencias para los componentes de la aplicación.

lib/core/error/: Define la estructura para el manejo de errores y excepciones en toda la aplicación.

lib/core/model/: Contiene las clases de modelo que se utilizarán para representar entidades de negocio (e.g., emociones, actividades).

lib/core/util/: Alberga utilidades y funciones auxiliares compartidas.

Estos módulos garantizan la reusabilidad, la separación de preocupaciones y la mantenibilidad del código, pilares fundamentales de Clean Architecture.

2.2.4 Módulos de Funcionalidades (features)
Los módulos de features (lib/features/) abordan funcionalidades asociadas a trayectorias de usuario específicas. Cada módulo de feature encapsula la lógica, presentación y datos necesarios para una funcionalidad concreta, lo que facilita el desarrollo, las pruebas y el mantenimiento de componentes independientes.

lib/features/home/: Contiene la lógica y la interfaz de usuario para la pantalla de inicio, mostrando actividades y el historial de emociones.

lib/features/track_emotion/: Encapsula la funcionalidad para registrar nuevas emociones, incluyendo la captura de video y la interacción con el TrackEmotionApi.

2.2.5 Sistema de Navegación y Enrutamiento (router)
El módulo lib/router/ es el componente central para la gestión de la navegación y el enrutamiento dentro de la aplicación Harmoni. Su implementación es crucial para definir las rutas y transiciones entre las diferentes pantallas y módulos de funcionalidad, asegurando una experiencia de usuario coherente y fluida. Este sistema maneja la pila de navegación, permitiendo al usuario moverse hacia adelante y hacia atrás a través de las diferentes secciones de la aplicación, y gestiona la inyección de dependencias y datos necesarios para cada destino. Además, el enrutamiento está diseñado para adaptarse a los principios de Clean Architecture, lo que significa que la lógica de navegación se mantiene desacoplada de la lógica de negocio y de la capa de presentación, facilitando así el mantenimiento y la escalabilidad del sistema.

2.2.6 Logging y Debugging
Para facilitar el seguimiento del comportamiento de la aplicación y la identificación de posibles problemas, se ha implementado un sistema de logging robusto. Este sistema incluye un observador de rutas específico para debugging, que registra los cambios en la navegación de la aplicación, permitiendo a los desarrolladores trazar el flujo del usuario. Adicionalmente, se realiza un logging detallado de todas las peticiones y respuestas HTTP. Esto es crucial para monitorear las interacciones con la API, diagnosticar errores de red y garantizar el correcto funcionamiento de las comunicaciones con servicios externos. El sistema de logging contribuye significativamente a la mantenibilidad de la aplicación y a la eficiencia del proceso de desarrollo.

2.2.7 Gestión de Assets
La aplicación Harmoni cuenta con un sistema de assets generado automáticamente, lo que optimiza la organización y el acceso a los recursos estáticos. Este sistema se encarga de estructurar y gestionar elementos como imágenes, iconos, fuentes y otros archivos multimedia, asegurando que estén disponibles de manera eficiente para su uso en la interfaz de usuario. Un aspecto importante de este módulo es la capacidad de cargar información de ayuda desde archivos JSON. Esto permite que el contenido de ayuda sea fácilmente actualizable y configurable sin requerir cambios en el código de la aplicación, lo que facilita la gestión de la información y la adaptación a nuevas necesidades del usuario.

2.2.8 Escalabilidad y Mantenibilidad
La aplicación Harmoni está diseñada con una arquitectura que prioriza la escalabilidad y mantenibilidad a través de múltiples estrategias y patrones de diseño implementados. El sistema utiliza la inyección de dependencias mediante GetIt como contenedor de servicios, lo que facilita la gestión de dependencias y permite la sustitución de implementaciones sin afectar el código cliente. Esta aproximación es fundamental para el testing y la evolución del sistema, ya que permite mockear servicios externos y simular diferentes escenarios de comportamiento.

La arquitectura de capas implementada en Harmoni sigue estrictamente los principios de Clean Architecture, donde cada capa tiene responsabilidades bien definidas y dependencias unidireccionales. La capa de datos incluye APIs abstractas (como HomeApi y MyProfileApi) que se implementan en clases concretas (HomeApiImpl y MyProfileApiBackImpl), permitiendo la fácil sustitución de fuentes de datos y la implementación de estrategias de caché. Los repositorios actúan como intermediarios entre las APIs y los servicios de negocio, encapsulando la lógica de acceso a datos y proporcionando una interfaz unificada para el resto de la aplicación.

La gestión de assets se realiza a través de un sistema generado automáticamente que optimiza el acceso a recursos estáticos como imágenes, iconos y archivos de configuración. Este sistema permite la carga dinámica de información de ayuda desde archivos JSON, facilitando la actualización de contenido sin requerir cambios en el código de la aplicación.

El código está bien estructurado y documentado, facilitando el mantenimiento y la evolución del sistema de comunicación a lo largo del tiempo. Esta mantenibilidad es esencial para el desarrollo continuo de la aplicación y la adaptación a nuevas necesidades de los usuarios. La modularidad del sistema permite que nuevos features se implementen de manera independiente, siguiendo la estructura establecida en lib/features/, donde cada módulo encapsula su propia lógica de datos, presentación y servicios.

La implementación de interfaces abstractas y la separación de responsabilidades facilitan la implementación de pruebas automatizadas, permitiendo mockear servicios externos y simular diferentes escenarios de error. Esta testabilidad es fundamental para garantizar la calidad del software y la detección temprana de problemas, especialmente en una aplicación de salud digital donde la confiabilidad es crítica.

El sistema está diseñado para escalar de manera efectiva con el crecimiento de la aplicación, facilitando la adición de nuevos endpoints y funcionalidades sin afectar la estabilidad del sistema existente. Esta escalabilidad es especialmente importante para aplicaciones de salud digital que requieren la evolución continua de funcionalidades y la integración con nuevos servicios de inteligencia artificial para el análisis emocional.

2.3 Diseño de la Integración de la API
La aplicación Harmoni se integra con servicios externos de detección de emociones, asegurando una experiencia de usuario fluida y confiable, mientras mantiene los estándares de seguridad y rendimiento requeridos en aplicaciones de salud digital.

2.3.1 Definición de Endpoints de la API
La aplicación Harmoni se integra con un backend que proporciona endpoints específicos para la gestión de actividades, seguimiento de emociones y administración de perfiles de usuario. La API está estructurada en dos módulos principales: HomeApi para la funcionalidad principal de la aplicación y MyProfileApi para la gestión de usuarios y autenticación.

**Endpoints de HomeApi (Gestión de Actividades y Emociones):**

- **GET /home/activities**: Obtiene la lista de todas las actividades disponibles para el seguimiento emocional. Retorna un array de objetos Activity con información como nombre, descripción y estado de la actividad.

- **POST /home/createActivity**: Permite crear nuevas actividades en el sistema. Recibe un array de objetos Activity en formato JSON y los registra en la base de datos del servidor.

- **DELETE /home/deleteActivity/{id}**: Elimina una actividad específica del sistema utilizando su identificador único. Este endpoint requiere autenticación y permisos adecuados.

- **POST /home/trackEmotion**: Endpoint principal para el seguimiento de emociones. Recibe un archivo de video (multipart/form-data) junto con el ID de la actividad asociada. El servidor procesa el video utilizando algoritmos de análisis emocional y retorna la emoción detectada.

- **GET /home/emotionsByActivity/{activityId}**: Obtiene el historial de emociones registradas para una actividad específica. Retorna un array de objetos MoodTrack con información detallada de cada registro emocional.

- **GET /home/emotions**: Recupera todas las emociones registradas por el usuario, independientemente de la actividad. Proporciona una vista general del historial emocional del usuario.

**Endpoints de MyProfileApi (Autenticación y Gestión de Usuario):**

- **POST /auth/signUp**: Registra un nuevo usuario en el sistema. Recibe los datos del usuario (nombre, edad, género, email, contraseña) y retorna un token de autenticación JWT si el registro es exitoso.

- **POST /auth/signIn**: Autentica un usuario existente. Valida las credenciales (email y contraseña) y retorna un token de autenticación JWT para sesiones posteriores.

- **GET /myProfile/getUserProfile**: Obtiene el perfil completo del usuario autenticado. Retorna toda la información del usuario incluyendo datos personales y preferencias.

- **GET /myProfile/validateEmail/{email}**: Valida si un email está disponible para registro o si ya existe en el sistema. Retorna un booleano indicando la validez del email.

- **GET /myProfile/validateName/{name}**: Valida si un nombre de usuario está disponible. Verifica que el nombre cumpla con los criterios establecidos y no esté en uso.

- **POST /myProfile/update**: Actualiza la información del perfil del usuario. Recibe los datos actualizados y retorna el perfil modificado junto con un nuevo token de autenticación.

- **POST /myProfile/delete**: Elimina la cuenta del usuario del sistema. Requiere confirmación y elimina permanentemente todos los datos asociados.

- **POST /myProfile/saveSettings**: Guarda las configuraciones y preferencias del usuario. Recibe un objeto JSON con las configuraciones y las almacena en la base de datos.

- **GET /myProfile/getSettingsForUser**: Obtiene las configuraciones guardadas del usuario. Retorna todas las preferencias y configuraciones personalizadas.

**Configuración de Autenticación:**
Todos los endpoints requieren autenticación mediante tokens JWT que se incluyen en el header Authorization como "Bearer {token}". La excepción son los endpoints de signUp y signIn que generan los tokens iniciales.

**Formato de Datos:**
Los endpoints utilizan JSON como formato principal de datos, excepto el endpoint trackEmotion que utiliza multipart/form-data para el envío de archivos de video. Las respuestas siguen un formato consistente con códigos de estado HTTP estándar y mensajes de error descriptivos.

Las emociones que se pueden identificar y clasificar dentro de la aplicación, según el contexto proporcionado, son:

Neutralidad: Indica un estado emocional neutro o ausencia de emociones intensas.

Ira: Refleja un estado de enfado o irritación.

Felicidad: Muestra sentimientos de alegría o satisfacción.

Asco: Representa una reacción de repugnancia o desagrado.

Miedo: Señala sensaciones de temor o ansiedad.

Tristeza: Denota sentimientos de pena o desánimo.

2.4 Manejo de Seguridad
La aplicación Harmoni implementa múltiples capas de seguridad para proteger la información sensible de los usuarios y garantizar la integridad de las comunicaciones con el servidor. El sistema de seguridad está diseñado siguiendo las mejores prácticas para aplicaciones de salud digital, donde la privacidad y confidencialidad de los datos son fundamentales.

**Autenticación JWT (JSON Web Tokens):**
La aplicación utiliza tokens JWT para la autenticación de usuarios, implementados a través de la clase Connection en lib/core/connection/connection.dart. Cada petición HTTP incluye automáticamente el token en el header Authorization con el formato "Bearer {token}". El token se obtiene durante el proceso de signUp y signIn, y se almacena en memoria durante la sesión activa del usuario. Este mecanismo garantiza que solo usuarios autenticados puedan acceder a los endpoints protegidos del sistema.

**Validación de Datos de Entrada:**
La aplicación implementa validación robusta de datos tanto en el cliente como en el servidor. Los endpoints de validación (/myProfile/validateEmail/{email} y /myProfile/validateName/{name}) permiten verificar la disponibilidad y validez de información antes de procesar registros. Los datos de usuario se validan antes de ser enviados al servidor, incluyendo validación de formato de email, longitud de contraseñas y caracteres permitidos en nombres de usuario.

**Protección de Información Sensible:**
La información personal del usuario, incluyendo datos de salud emocional, se transmite de manera segura utilizando HTTPS. Los archivos de video que contienen información biométrica se envían mediante multipart/form-data con headers de seguridad apropiados. La aplicación implementa logging detallado de todas las peticiones HTTP para auditoría y detección de actividades sospechosas, pero sin registrar información sensible como contraseñas o tokens.

**Gestión Segura de Sesiones:**
El sistema maneja las sesiones de usuario de manera segura, renovando automáticamente los tokens JWT cuando es necesario. Los tokens se invalidan cuando el usuario cierra sesión o cuando se detecta actividad sospechosa. La aplicación implementa manejo de errores de autenticación, redirigiendo a los usuarios a la pantalla de login cuando los tokens expiran o son inválidos.

**Auditoría y Logging:**
El sistema implementa logging comprehensivo de todas las operaciones de seguridad, incluyendo intentos de autenticación, accesos a recursos protegidos y errores de validación. Los logs se generan con diferentes niveles de severidad (INFO, WARNING, ERROR) y se almacenan localmente para análisis posterior.


2.5 Conclusiones Parciales
La implementación de la aplicación Harmoni demuestra la viabilidad de desarrollar una solución robusta para el seguimiento emocional utilizando Flutter y Clean Architecture. La arquitectura modular implementada, con separación clara entre capas de datos, presentación y lógica de negocio, facilita el mantenimiento y la escalabilidad del sistema.

La integración exitosa con servicios externos de análisis emocional mediante una API REST bien estructurada, junto con el manejo seguro de datos sensibles a través de autenticación JWT, establece una base sólida para aplicaciones de salud digital. El sistema de logging comprehensivo y la gestión de errores robusta contribuyen significativamente a la confiabilidad de la aplicación.

La implementación de patrones de inyección de dependencias y la utilización de tecnologías modernas como Dio para comunicaciones HTTP, Drift para persistencia local y GoRouter para navegación, demuestran la capacidad de Flutter para desarrollar aplicaciones complejas con altos estándares de calidad. Esta aproximación arquitectónica proporciona una base extensible para futuras funcionalidades de análisis emocional avanzado.