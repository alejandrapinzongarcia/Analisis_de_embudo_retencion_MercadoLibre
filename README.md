**Análisis del desempeño financiero de Adventure Works con SQL**

**🧹🧼Extraer y limpiar datos**

Antes de calcular ingresos y rentabilidad, se construye una tabla base que combine la información clave de ventas, productos y territorios.

* Unión de Tablas: qué datos se necesitan tener en una sola tabla para responder a las preguntas del director financiero (¿cuánto se vende, a qué precio, con qué costo, y en qué país?).
* Selección de columnas: Se incluyen columnas que identifiquen la orden, el producto, su categoría, la campaña de marketing y el territorio.
*Tratamiento de Valores Nulos: tratar los nulos.

👉🏼 creación de dos nuevas columnas calculadas:

ingreso_total → precio de cada producto × cantidad pedida.
costo_total → costo de cada producto × cantidad pedida.

