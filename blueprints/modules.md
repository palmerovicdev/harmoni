### **1. Módulo principal (App/Core)**
- **Función:** Orquestación, inicialización y configuración global.
- **Componentes clave:**
  - `main.dart`: Punto de entrada, inicializa dependencias, cámaras y ejecuta la app.
  - `Harmoni`: Widget raíz, configura el tema, la navegación y la inyección de BLoCs.
  - `service_locator`: Inyección de dependencias.
  - `router`: Configuración de rutas y navegación.

---

### **2. Módulo de Presentación (Presentation Layer)**
- **Función:** Interfaz de usuario y gestión de estado.
- **Componentes clave:**
  - **Pages:** Pantallas principales (ej. `home_calendar_page.dart`, `home_track_emotion_page.dart`).
  - **Widgets:** Componentes reutilizables de UI.
  - **State Management:** BLoCs/Cubits para cada feature (ej. `HomeCubit`, `StyleSettingCubit`).

---

### **3. Módulo de Dominio (Domain Layer)**
- **Función:** Lógica de negocio y entidades centrales.
- **Componentes clave:**
  - **Entities:** Modelos de negocio (ej. `MoodTrack`, `Activity`).
  - **Use Cases:** (Si los tienes, aquí irían las operaciones de negocio puras).
  - **Repository Interfaces:** Contratos para acceso a datos.

---

### **4. Módulo de Datos (Data Layer)**
- **Función:** Acceso y gestión de datos, comunicación con APIs y almacenamiento local.
- **Componentes clave:**
  - **Repositories:** Implementaciones concretas de los repositorios.
  - **APIs:** Clases para comunicación con el backend (ej. `home_api.dart`, `my_profile_api.dart`).
  - **Models:** Modelos de datos para serialización/deserialización.

---

### **5. Módulos de Features**
Cada feature tiene su propio submódulo, siguiendo la arquitectura modular:
- **Home:** Pantalla principal, calendario, resumen de emociones, etc.
- **My Profile:** Gestión de usuario, ajustes de perfil.
- **Settings:** Preferencias, temas, seguridad, ayuda.

---

### **6. Módulo de Temas y Estilos**
- **Función:** Gestión de temas, colores y estilos visuales.
- **Componentes clave:** 
  - `themes/`: Definición de temas claros/oscuro, colores y estilos globales.
  - `StyleSettingCubit`: Gestión dinámica del tema.

---

### **7. Módulo de Utilidades y Helpers**
- **Función:** Funciones y clases auxiliares reutilizables.
- **Componentes clave:** 
  - `logger.dart`, helpers de fechas, validadores, etc.

---

## **Resumen**
- **Inicio:** El módulo principal orquesta la app, inicializa dependencias y configura la navegación.
- **Presentación:** La UI y la gestión de estado están desacopladas y organizadas por features.
- **Dominio:** Las entidades y la lógica de negocio están centralizadas y separadas de la UI y los datos.
- **Datos:** El acceso a datos y la comunicación con APIs están encapsulados en repositorios y servicios.
- **Features:** Cada funcionalidad principal de la app es un módulo independiente y escalable.
- **Temas y utilidades:** El sistema de temas y los helpers garantizan una experiencia visual coherente y código reutilizable.