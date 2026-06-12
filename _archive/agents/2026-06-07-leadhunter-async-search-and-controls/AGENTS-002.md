PÃ©gale esto a Codex:

## Corregir diseÃ±o del selector de ciudades

Problema:
En la secciÃ³n â€œUbicaciÃ³nâ€, los botones de ciudades se salen del contenedor, no se ven todas las ciudades y el usuario no puede seleccionarlas correctamente.

CorrecciÃ³n requerida:

1. Los botones de ciudades deben permanecer siempre dentro del contenedor.
2. Deben ordenarse automÃ¡ticamente en varias filas usando `flex-wrap` o `grid`.
3. El contenedor no debe permitir que los botones se desborden horizontalmente.
4. Si hay muchas ciudades, debe agregarse scroll vertical interno.
5. Cada botÃ³n debe mostrar:

   * Ciudad
   * Estado

Ejemplo:

```text
Pachuca, Hidalgo
CDMX
Monterrey, Nuevo LeÃ³n
Guadalajara, Jalisco
QuerÃ©taro, QuerÃ©taro
Puebla, Puebla
```

6. El botÃ³n activo debe resaltarse visualmente.

7. Al dar clic en una ciudad, deben actualizarse automÃ¡ticamente:

   * latitude
   * longitude
   * country
   * state
   * city
   * default_radius_km

8. Los botones deben ser responsivos:

   * En escritorio: varias columnas.
   * En tablet: 2 o 3 columnas.
   * En mÃ³vil: 1 columna o scroll ordenado.

ImplementaciÃ³n sugerida:

```tsx
<div className="city-grid">
  {cities.map((city) => (
    <button
      key={`${city.name}-${city.state}`}
      type="button"
      className={selectedCity?.name === city.name ? "city-button active" : "city-button"}
      onClick={() => handleSelectCity(city)}
    >
      <span className="city-name">{city.name}</span>
      <span className="city-state">{city.state}</span>
    </button>
  ))}
</div>
```

CSS sugerido:

```css
.city-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(160px, 1fr));
  gap: 12px;
  max-height: 260px;
  overflow-y: auto;
  overflow-x: hidden;
  padding: 12px;
  box-sizing: border-box;
}

.city-button {
  width: 100%;
  min-height: 64px;
  border-radius: 14px;
  border: 1px solid #d9e2e7;
  background: #ffffff;
  cursor: pointer;
  text-align: left;
  padding: 10px 14px;
  box-sizing: border-box;
  white-space: normal;
}

.city-button.active {
  background: #00796b;
  color: #ffffff;
  border-color: #00796b;
}

.city-name {
  display: block;
  font-weight: 700;
  font-size: 15px;
}

.city-state {
  display: block;
  font-size: 12px;
  opacity: 0.8;
}
```

Criterio de aceptaciÃ³n:

* Ninguna ciudad debe salirse del contenedor.
* Todas las ciudades deben poder verse o seleccionarse mediante scroll.
* Cada botÃ³n debe mostrar ciudad y estado.
* Al seleccionar una ciudad, los campos de ubicaciÃ³n deben actualizarse correctamente.
* Debe funcionar bien en escritorio, tablet y mÃ³vil.

