# 📊 Análisis de Embudo de Conversión y Retención de Usuarios — MercadoLibre (SQL Project)

## 📌 Descripción del Proyecto

En este proyecto se analiza el **embudo de conversión y la retención de usuarios** de una plataforma de e-commerce inspirada en MercadoLibre.

El objetivo es identificar **en qué etapa del proceso de compra se pierden más usuarios** y analizar **qué tan bien la plataforma retiene a los usuarios a lo largo del tiempo**.

El análisis se realizó utilizando **SQL**, aplicando técnicas de **CTEs, agregaciones, análisis de cohortes y métricas de conversión** para generar insights accionables para el equipo de producto.

---

# 🎯 Objetivos del Análisis

Este proyecto busca responder las siguientes preguntas de negocio:

### Embudo de conversión

* ¿Cuál es la tasa de conversión entre cada etapa del embudo?
* ¿En qué etapa ocurre la mayor pérdida de usuarios?
* ¿Cómo varía la conversión según:

  * país
  * tipo de dispositivo
  * fuente de tráfico?

### Retención de usuarios

* ¿Qué porcentaje de usuarios vuelve después de registrarse?
* ¿Cuál es la retención en:

  * D7
  * D14
  * D21
  * D28?
* ¿Cómo varía la retención entre países?

---

# 🧭 Embudo de Conversión Analizado

El análisis se basa en el siguiente **macro journey de usuario** dentro de la plataforma:

| Etapa                | Evento                             | Descripción                                |
| -------------------- | ---------------------------------- | ------------------------------------------ |
| Descubrimiento       | `first_visit`                      | Primera visita del usuario a la plataforma |
| Interés              | `select_item` / `select_promotion` | El usuario explora productos               |
| Intención de compra  | `add_to_cart`                      | El usuario añade un producto al carrito    |
| Inicio de compra     | `begin_checkout`                   | El usuario inicia el proceso de pago       |
| Información de envío | `add_shipping_info`                | Se agrega información de envío             |
| Información de pago  | `add_payment_info`                 | Se agrega método de pago                   |
| Conversión           | `purchase`                         | El usuario completa la compra              |

A partir de estos eventos se calcula:

* tasa de conversión por etapa
* caída de usuarios entre pasos
* conversión final del embudo

---

# 🗂 Dataset

El proyecto utiliza dos tablas principales.

## Tabla: `mercadolibre_funnel`

Contiene los **eventos del comportamiento de usuarios durante el proceso de compra**.

Columnas relevantes:

* `user_id` — identificador del usuario
* `session_id` — identificador de sesión
* `event_name` — evento realizado por el usuario
* `event_date` — fecha del evento
* `country` — país del usuario
* `device_category` — tipo de dispositivo (mobile, desktop, tablet)
* `platform` — sistema operativo o plataforma
* `product_cat` — categoría del producto
* `price` — precio del producto
* `referral_source` — fuente de tráfico (organic, paid_search, social)

---

## Tabla: `mercadolibre_retention`

Contiene información sobre **actividad de usuarios después del registro** para calcular retención.

Columnas relevantes:

* `user_id`
* `signup_date`
* `country`
* `device_category`
* `platform`
* `day_after_signup`
* `activity_date`
* `active`

Esta tabla permite construir **cohortes de retención**.

---

# 🔎 Metodología de Análisis

El análisis se realizó en varias etapas:

### 1️⃣ Exploración de datos

* validación de estructura de tablas
* identificación de eventos clave del embudo
* revisión de consistencia temporal

### 2️⃣ Construcción del embudo

Se creó un **embudo multi-etapa usando CTEs** para:

* contar usuarios por evento
* ordenar eventos cronológicamente
* calcular conversiones entre etapas

### 3️⃣ Cálculo de métricas

Se calcularon métricas como:

* tasa de conversión por etapa
* drop-off rate
* conversión total del embudo

### 4️⃣ Análisis de retención

Se construyeron **cohortes de usuarios** según su fecha de registro para calcular retención en:

* D7
* D14
* D21
* D28

### 5️⃣ Segmentación

El análisis se segmentó por:

* país
* dispositivo
* fuente de tráfico

---

# 🛠 Tecnologías Utilizadas

* **SQL**
* CTEs
* agregaciones (`COUNT`, `SUM`)
* análisis de cohortes
* cálculo de tasas de conversión
* análisis de comportamiento de usuarios

---

# 📁 Estructura del Repositorio

```
mercadolibre-funnel-analysis

data/
dataset_description.md

sql/
01_data_exploration.sql
02_funnel_analysis.sql
03_conversion_rates.sql
04_retention_cohorts.sql

README.md
```

---

# 📈 Principales Métricas Analizadas

### Conversión

* conversión entre cada etapa del funnel
* tasa de abandono por etapa
* conversión final a compra

### Retención

* retención por cohorte
* retención D7, D14, D21, D28
* comparación de retención entre países

---

# 💡 Impacto del Análisis

Este análisis permite al equipo de producto:

* detectar **cuellos de botella en el proceso de compra**
* identificar **etapas con mayor abandono**
* entender **comportamiento de usuarios por dispositivo o canal**
* evaluar **calidad de adquisición de usuarios mediante retención**

---

# 📚 Habilidades Demostradas

Este proyecto demuestra habilidades clave de **Data Analytics**:

* SQL avanzado
* análisis de embudos de conversión
* análisis de cohortes de retención
* análisis de comportamiento de usuarios
* interpretación de métricas de producto
* comunicación de insights de negocio

## Conversion Funnel

```mermaid
flowchart LR

A[First Visit] --> B[Select Item]
B --> C[Add to Cart]
C --> D[Begin Checkout]
D --> E[Add Shipping Info]
E --> F[Add Payment Info]
F --> G[Purchase]
```

## Autor
Alejandra P

Proyecto desarrollado como parte de formación en **Data Analytics**.

Si te interesa discutir el análisis o colaborar en proyectos similares, puedes contactarme a través de GitHub o LinkedIn.

