Sí: **esa es la idea correcta**. No debe ser solo “publicar productos”; debe ser un **servicio de consultoría + plataforma** donde MexIngSof administra la tecnología comercial del cliente.

Nombre recomendado:

# **Marketplace Manager**

Subproducto dentro de:

# **MexIngSof Commerce Operations**

## Qué va a hacer

El cliente entra a la web y conecta:

```text
Su empresa
Su tienda web
Sus productos
Sus inventarios
Sus marketplaces
Sus pedidos
Su facturación
Su logística
```

Y el sistema hace:

```text
Producto del cliente
↓
Catálogo central
↓
Inventario central
↓
Precio central
↓
Publicación automática
↓
Mercado Libre / Amazon / Walmart / eBay / tienda propia
↓
Pedidos regresan al ERP
↓
Inventario se descuenta
↓
Factura / envío / reporte
```

## Según la documentación actual

Tu repo ya dice que:

* Lo reutilizable va en `01_core_erp`.
* Lo específico de cada proyecto va en `02_projects/<nombre>`.
* Las integraciones externas van en `04_integrations`.
* El frontend debe consumir el **Gateway General**, no APIs internas directo.
* Ya existen APIs base activas como Auth, Gateway, Catalog, Inventory, Pricing, Sales, Supplier, Document, Fiscal y Address.

## Dónde documentarlo

Crear o modificar estos archivos:

```text
Docs/02_projects/marketplace-manager/README.md
Docs/02_projects/marketplace-manager/architecture.md
Docs/02_projects/marketplace-manager/api-contracts.md
Docs/02_projects/marketplace-manager/database.md
Docs/02_projects/marketplace-manager/frontend.md
Docs/02_projects/marketplace-manager/security.md
Docs/02_projects/marketplace-manager/tasks/mvp-roadmap.md
```

Agregar integración por marketplace:

```text
Docs/04_integrations/mercadolibre/README.md
Docs/04_integrations/amazon/README.md
Docs/04_integrations/walmart/README.md
Docs/04_integrations/ebay/README.md
```

Actualizar:

```text
Docs/03_standards/product/module-catalog.md
Docs/00_audit/reusable-api-map.md
Docs/01_core_erp/apis/reusable-api-contracts.md
Docs/01_core_erp/apis/gateway-route-registry.md
Docs/01_core_erp/apis/endpoint-ui-consumption-matrix.md
```

## APIs necesarias

No crear todo nuevo. Usar estas:

```text
Auth API
Gateway General
Catalog API
Inventory API
Pricing API
Supplier API
Sales API
Address API
Fiscal API
Document API
Notification API
ETL / Scheduler
```

Y crear una nueva capacidad:

```text
Marketplace API
```

Responsabilidad de **Marketplace API**:

```text
- Conectar cuentas marketplace del cliente
- Guardar credenciales seguras
- Mapear productos internos contra productos externos
- Publicar productos
- Actualizar precio
- Actualizar stock
- Descargar pedidos
- Descargar preguntas/mensajes
- Descargar comisiones
- Registrar errores de publicación
- Reintentar sincronizaciones fallidas
```

## Datos que se necesitan del cliente

```text
Empresa:
- Razón social
- Nombre comercial
- RFC
- Régimen fiscal
- Dirección fiscal
- Contactos
- Logo / marca

Tienda web:
- Tipo: WooCommerce, Shopify, PrestaShop, propia
- Dominio
- Accesos API
- Catálogo actual
- Inventario actual

Productos:
- SKU interno
- Nombre
- Descripción corta
- Descripción larga
- Categoría
- Marca
- Modelo
- Imágenes
- Precio base
- Precio por marketplace
- Stock
- Peso
- Medidas
- Código de barras si existe
- Garantía
- Condición: nuevo/usado/reacondicionado

Marketplaces:
- Cuenta Mercado Libre
- Cuenta Amazon Seller
- Cuenta Walmart Marketplace
- Cuenta eBay
- Tokens OAuth / API keys
- País / región
- Políticas de envío
- Políticas de devolución
- Categorías permitidas

Operación:
- Almacenes
- Métodos de envío
- Tiempo de preparación
- Facturación
- Comisiones
- Margen mínimo
- Stock mínimo
```

## Estructura técnica

```text
Marketplace Manager Web
        ↓
Gateway General
        ↓
Marketplace API
        ↓
Core APIs:
- Catalog
- Inventory
- Pricing
- Sales
- Fiscal
- Address
- Supplier
- Document
        ↓
Integraciones externas:
- Mercado Libre
- Amazon
- Walmart
- eBay
- WooCommerce
- Shopify
- PrestaShop
```

Amazon sí tiene SP-API con Listings Items, Orders, Pricing, Reports, Notifications e Inventory/Fulfillment. ([Amazon Developer Docs][1])
eBay tiene API oficial para inventario/ofertas y publicación con `publishOffer`. ([eBay Developers][2])
No puedo confirmar en esta revisión los endpoints exactos actuales de Mercado Libre y Walmart México porque las páginas oficiales no fueron accesibles correctamente desde la búsqueda, así que en la documentación deben quedar como `PENDIENTE_DE_CONFIRMAR` hasta validar en sus portales oficiales.

## MVP recomendado

Primera versión:

```text
1. Alta de empresa cliente
2. Alta de tienda web
3. Alta/importación de productos
4. Conexión Mercado Libre y Amazon
5. Publicación manual controlada
6. Sincronización de stock
7. Descarga de pedidos al ERP
8. Panel de errores
9. Bitácora de sincronización
10. Reporte de ventas por canal
```

Después:

```text
11. Walmart
12. eBay
13. WooCommerce
14. Shopify
15. Repricing automático
16. Facturación automática
17. Envíos automáticos
18. IA para mejorar títulos/descripciones
```

## Conclusión

Sí: el negocio correcto es que MexIngSof sea el **departamento tecnológico externo** del cliente.

No vendes solo una web.
No vendes solo un ERP.
No vendes solo publicación en marketplaces.

Vendes:

> **Administración completa de comercio digital: web, ERP, inventario, pedidos, facturación y marketplaces sincronizados desde un solo sistema.**

[1]: https://developer-docs.amazon.com/sp-api/docs/listings-items-api-v2021-08-01-reference "Listings Items v2021-08-01"
[2]: https://developer.ebay.com/api-docs/sell/inventory/resources/offer/methods/publishOffer "publishOffer: eBay Inventory API | eBay Developers Program"





Sí, confirmé la rama `general` del repositorio Docs y revisé documentación oficial de las APIs de Mercado Libre, Amazon SP-API, Walmart Marketplace, eBay Sell API, WooCommerce REST API, Shopify Admin API y PrestaShop Webservice. La regla base de Docs es: **webs consumen Gateway General, APIs compartidas por responsabilidad, integraciones externas en `04_integrations`, y proyectos en `02_projects` solo para reglas específicas**. ([GitHub][1])

## Actividades detalladas para desarrollar Máster Marketplace

1. Crear documentación base del proyecto en:

```text
Docs/02_projects/master-marketplace/
  00_overview.md
  01_architecture.md
  02_database.md
  03_api_contracts.md
  04_frontend_flow.md
  05_multi_client_rules.md
  06_security.md
  07_refapart_flow.md
```

2. Crear documentación de integraciones externas:

```text
Docs/04_integrations/marketplaces/
  mercadolibre/
  amazon/
  walmart/
  ebay/
  woocommerce/
  shopify/
  prestashop/
```

3. Registrar que **Máster Marketplace no es dueño de productos, precios, inventario ni pedidos**. Solo orquesta publicación/importación/sincronización.

4. Definir API especializada:

```text
API.PY.DJANGO.MarketplaceIntegration
```

5. Definir web:

```text
WEB.NJ.NEXT.MasterMarketplace
```

6. Definir flujo obligatorio:

```text
Web Master Marketplace
→ Gateway General
→ MarketplaceIntegration API
→ Catalog API
→ Inventory API
→ Pricing API
→ Sales API
→ Provider externo
```

7. Registrar rutas en:

```text
Docs/01_core_erp/apis/gateway-route-registry.md
```

8. Crear tabla de proveedores:

```text
MarketplaceProviders
```

Con registros:

```text
MERCADOLIBRE
AMAZON
WALMART
EBAY
WOOCOMMERCE
SHOPIFY
PRESTASHOP
```

9. Crear tabla multi-cliente:

```text
ClientMarketplaceAccounts
```

Debe guardar:

```text
ClientId
ProviderId
ExternalSellerId
StoreUrl
CountryCode
CurrencyCode
AccessTokenEncrypted
RefreshTokenEncrypted
ApiKeyEncrypted
ApiSecretEncrypted
TokenExpiresAt
IsConnected
```

10. Crear tabla de productos vinculados:

```text
MarketplaceProductLinks
```

Debe guardar:

```text
ClientId
ProductId
ProviderId
AccountId
ExternalProductId
ExternalSku
ExternalUrl
PublishStatus
SyncStatus
LastSyncAt
LastError
```

11. Crear tabla de trabajos de sincronización:

```text
MarketplaceSyncJobs
```

Debe manejar:

```text
ImportProducts
ExportProducts
SyncStock
SyncPrice
SyncOrders
SyncImages
SyncStatus
```

12. Crear tabla de errores:

```text
MarketplaceSyncErrors
```

13. Crear tabla de mapeo de categorías:

```text
MarketplaceCategoryMappings
```

14. Crear tabla de mapeo de atributos:

```text
MarketplaceAttributeMappings
```

15. Crear tabla de mapeo de estados:

```text
MarketplaceStatusMappings
```

16. Definir credenciales globales por app, no por cliente, cuando aplique OAuth:

```env
MELI_CLIENT_ID=
MELI_CLIENT_SECRET=

AMAZON_LWA_CLIENT_ID=
AMAZON_LWA_CLIENT_SECRET=
AMAZON_AWS_ACCESS_KEY=
AMAZON_AWS_SECRET_KEY=
AMAZON_ROLE_ARN=

EBAY_CLIENT_ID=
EBAY_CLIENT_SECRET=

SHOPIFY_CLIENT_ID=
SHOPIFY_CLIENT_SECRET=
```

17. Definir credenciales por cliente cuando aplique tienda propia:

```text
WooCommerce:
- StoreUrl
- ConsumerKey
- ConsumerSecret

PrestaShop:
- StoreUrl
- WebserviceKey

Shopify:
- ShopDomain
- AccessToken por tienda

Walmart:
- ClientId / ClientSecret / Token según cuenta aprobada

Amazon:
- RefreshToken por vendedor autorizado
```

18. Crear interfaz común:

```python
class MarketplaceConnector:
    def connect(self): ...
    def refresh_token(self): ...
    def import_products(self): ...
    def export_product(self, product_id): ...
    def sync_stock(self, product_id): ...
    def sync_price(self, product_id): ...
    def import_orders(self): ...
    def handle_webhook(self, payload): ...
```

19. Crear conectores específicos:

```text
MercadoLibreConnector
AmazonConnector
WalmartConnector
EbayConnector
WooCommerceConnector
ShopifyConnector
PrestaShopConnector
```

20. Crear factory:

```python
def get_marketplace_connector(provider_code, account):
    ...
```

21. Crear mapper interno único:

```text
ERP Product → Marketplace Payload
Marketplace Product → ERP Product
ERP Stock → Marketplace Stock
ERP Price → Marketplace Price
Marketplace Order → ERP Sale Order
```

22. Implementar OAuth de Mercado Libre. Mercado Libre usa OAuth 2.0, access token y refresh token. ([Amazon Services API][2])

23. Implementar Amazon SP-API con autorización de vendedor, Listings Items API y Orders API. Amazon SP-API permite trabajar con listings, orders, payments y reports. ([Amazon Selling Partner API][3])

24. Implementar Walmart Marketplace API con OAuth 2.0; sus access tokens duran 15 minutos según documentación oficial. ([Walmart Developer][4])

25. Implementar eBay OAuth 2.0 e Inventory API para crear, administrar y publicar inventario. ([eBay Developers Program][5])

26. Implementar WooCommerce REST API con `consumer_key` y `consumer_secret` generados desde WooCommerce. ([The WooCommerce Developer Blog][6])

27. Implementar Shopify con GraphQL Admin API, no REST como primera opción, porque Shopify indica que REST Admin API es legacy para apps nuevas. ([Shopify][7])

28. Implementar PrestaShop Webservice API, que expone recursos CRUD de la tienda. ([PrestaShop][8])

29. Crear flujo “exportar desde Refapart”:

```text
Refapart tiene producto
→ Catalog API
→ Pricing API
→ Inventory API
→ Gateway
→ MarketplaceIntegration
→ Mercado Libre / Amazon / Walmart / eBay / etc.
→ guardar ExternalProductId
```

30. Crear flujo “importar desde Mercado Libre hacia Refapart”:

```text
Cliente conecta cuenta Mercado Libre
→ MarketplaceIntegration obtiene productos
→ mapper normaliza datos
→ Catalog API crea o actualiza producto
→ Inventory API crea existencia
→ Pricing API crea precio
→ MarketplaceProductLinks guarda relación
```

31. Crear permisos:

```text
mastermarketplace.accounts.connect
mastermarketplace.products.import
mastermarketplace.products.export
mastermarketplace.products.sync
mastermarketplace.orders.import
mastermarketplace.credentials.manage
mastermarketplace.errors.read
```

32. Crear endpoints internos:

```text
POST /marketplaces/accounts/connect
GET  /marketplaces/accounts
POST /marketplaces/products/import
POST /marketplaces/products/export
POST /marketplaces/products/sync-stock
POST /marketplaces/products/sync-price
GET  /marketplaces/orders/import
GET  /marketplaces/sync-jobs
GET  /marketplaces/errors
```

33. Crear endpoints callback OAuth:

```text
GET /marketplaces/mercadolibre/oauth/callback
GET /marketplaces/ebay/oauth/callback
GET /marketplaces/shopify/oauth/callback
GET /marketplaces/amazon/oauth/callback
```

34. Crear cola de sincronización con JobCron/ETL:

```text
Cada 15 min: stock/precio crítico
Cada 1 h: productos modificados
Cada 4 h: pedidos
Manual: publicación masiva
```

35. Crear reglas anti-duplicado:

```text
ClientId + ProviderId + AccountId + ProductId
ClientId + ProviderId + ExternalProductId
ClientId + SKU normalizado
```

36. Crear pantalla web:

```text
Conectar tienda
Cuentas conectadas
Importar productos
Exportar productos
Estado de sincronización
Errores
Mapeo de categorías
Mapeo de atributos
Órdenes importadas
```

37. Crear logs técnicos sin exponer secretos.

38. Cifrar tokens y llaves en base de datos.

39. Prohibir credenciales en frontend.

40. Prohibir publicar directo desde Refapart a marketplaces. Refapart debe pedirlo al Gateway.

41. Crear documentación de ejemplo para Refapart:

```text
Docs/02_projects/refapart/integrations/master-marketplace.md
```

42. Crear documentación de ejemplo para cualquier web futura:

```text
Docs/templates/marketplace-project-integration-template.md
```

43. Crear agente de implementación:

```text
Docs/agents/XXX_master_marketplace_multi_provider_integration.md
```

44. Crear checklist de cierre:

```text
- OAuth probado
- Importación probada
- Exportación probada
- Stock probado
- Precio probado
- Pedido probado
- Multi-cliente probado
- Sin secretos en frontend
- Rutas Gateway registradas
- Tablas PascalCase documentadas
```

45. Después de esta lista, desarrollar el código base completo en este orden:

```text
1. modelos
2. migraciones
3. cifrado de credenciales
4. interfaces
5. conectores
6. mappers
7. servicios
8. endpoints
9. Gateway contracts
10. JobCron tasks
11. frontend
12. documentación
```

Esta es la ruta correcta para que Máster Marketplace sirva para **N clientes, N tiendas y N proyectos**, incluyendo Refapart, sin duplicar lógica del ERP.

[1]: https://github.com/MexIngSoft/Docs/tree/general "GitHub - MexIngSoft/Docs at general · GitHub"
[2]: https://developer-docs.amazon.com/sp-api?utm_source=chatgpt.com "Selling Partner API"
[3]: https://developer.amazonservices.com/?utm_source=chatgpt.com "Amazon Selling Partner API (SP-API)"
[4]: https://developer.walmart.com/us-marketplace/docs/introduction-to-marketplace-apis?utm_source=chatgpt.com "Introduction to Walmart Marketplace APIs"
[5]: https://developer.ebay.com/develop/guides-v2/authorization?utm_source=chatgpt.com "Authorization"
[6]: https://developer.woocommerce.com/docs/apis/rest-api/?utm_source=chatgpt.com "WooCommerce REST API"
[7]: https://shopify.dev/docs/api/admin-graphql/latest?utm_source=chatgpt.com "GraphQL Admin API reference - Shopify Dev Docs"
[8]: https://devdocs.prestashop-project.org/9/webservice/?utm_source=chatgpt.com "The PrestaShop Webservice API"





Sí, confirmé el repositorio Docs en rama `general`: la arquitectura separa **Core ERP**, **Proyectos**, **Estándares** e **Integraciones**, y exige que las APIs reutilizables vivan en `01_core_erp`, los proyectos en `02_projects`, y proveedores externos en `04_integrations`. ([GitHub][1])

También verifiqué APIs oficiales actuales:

Mercado Libre usa API de ítems, órdenes y OAuth.
Amazon usa SP-API para listings, orders y fulfillment. ([Amazon Services API][2])
Walmart Marketplace permite gestionar órdenes, estados y fulfillment. ([Walmart Developer][3])
eBay usa Inventory API para crear inventario/ofertas y Fulfillment API para órdenes. ([eBay Developers Program][4])
WooCommerce REST API permite crear, leer, actualizar y eliminar datos vía JSON. ([The WooCommerce Developer Blog][5])
Shopify recomienda Admin GraphQL API; `productCreate` crea productos y los pedidos se manejan con el objeto `Order`. ([Shopify][6])
PrestaShop Webservice es una API CRUD para acceder a recursos de tienda. ([PrestaShop][7])

## Base común obligatoria

```python
# apps/marketplaces/connectors/base.py

from abc import ABC, abstractmethod


class MarketplaceConnector(ABC):
    def __init__(self, account):
        self.account = account

    @abstractmethod
    def create_product(self, product): ...

    @abstractmethod
    def get_product(self, external_product_id: str): ...

    @abstractmethod
    def get_orders(self): ...

    @abstractmethod
    def confirm_order_for_shipping(self, order_id: str, tracking_data: dict): ...
```

```python
# apps/marketplaces/connectors/factory.py

from .mercadolibre import MercadoLibreConnector
from .amazon import AmazonConnector
from .walmart import WalmartConnector
from .ebay import EbayConnector
from .woocommerce import WooCommerceConnector
from .shopify import ShopifyConnector
from .prestashop import PrestaShopConnector


CONNECTORS = {
    "MERCADOLIBRE": MercadoLibreConnector,
    "AMAZON": AmazonConnector,
    "WALMART": WalmartConnector,
    "EBAY": EbayConnector,
    "WOOCOMMERCE": WooCommerceConnector,
    "SHOPIFY": ShopifyConnector,
    "PRESTASHOP": PrestaShopConnector,
}


def get_connector(provider_code: str, account):
    return CONNECTORS[provider_code](account)
```

## Mercado Libre

```python
# apps/marketplaces/connectors/mercadolibre.py

import requests
from .base import MarketplaceConnector


class MercadoLibreConnector(MarketplaceConnector):
    BASE_URL = "https://api.mercadolibre.com"

    def headers(self):
        return {
            "Authorization": f"Bearer {self.account.access_token}",
            "Content-Type": "application/json",
        }

    def create_product(self, product):
        payload = {
            "title": product["name"],
            "category_id": product["marketplace_category_id"],
            "price": product["price"],
            "currency_id": "MXN",
            "available_quantity": product["stock"],
            "buying_mode": "buy_it_now",
            "condition": product.get("condition", "new"),
            "listing_type_id": "gold_special",
            "pictures": [{"source": url} for url in product.get("images", [])],
            "attributes": product.get("attributes", []),
        }

        response = requests.post(
            f"{self.BASE_URL}/items",
            headers=self.headers(),
            json=payload,
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def get_product(self, external_product_id):
        response = requests.get(
            f"{self.BASE_URL}/items/{external_product_id}",
            headers=self.headers(),
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def get_orders(self):
        response = requests.get(
            f"{self.BASE_URL}/orders/search?seller={self.account.external_seller_id}",
            headers=self.headers(),
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def confirm_order_for_shipping(self, order_id, tracking_data):
        return {
            "status": "pending_provider_shipment_flow",
            "message": "Mercado Libre normalmente controla envío por shipment_id; se debe consultar shipment y seguir flujo de etiqueta/envío del sitio.",
            "order_id": order_id,
            "tracking_data": tracking_data,
        }
```

## Amazon SP-API

```python
# apps/marketplaces/connectors/amazon.py

import requests
from .base import MarketplaceConnector


class AmazonConnector(MarketplaceConnector):
    BASE_URL = "https://sellingpartnerapi-na.amazon.com"

    def headers(self):
        return {
            "x-amz-access-token": self.account.access_token,
            "Content-Type": "application/json",
        }

    def create_product(self, product):
        seller_id = self.account.external_seller_id
        sku = product["sku"]
        marketplace_id = self.account.marketplace_id

        payload = {
            "productType": product["product_type"],
            "requirements": "LISTING",
            "attributes": product["amazon_attributes"],
        }

        response = requests.put(
            f"{self.BASE_URL}/listings/2021-08-01/items/{seller_id}/{sku}",
            headers=self.headers(),
            params={"marketplaceIds": marketplace_id},
            json=payload,
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def get_product(self, external_product_id):
        seller_id = self.account.external_seller_id
        marketplace_id = self.account.marketplace_id

        response = requests.get(
            f"{self.BASE_URL}/listings/2021-08-01/items/{seller_id}/{external_product_id}",
            headers=self.headers(),
            params={"marketplaceIds": marketplace_id},
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def get_orders(self):
        response = requests.get(
            f"{self.BASE_URL}/orders/v0/orders",
            headers=self.headers(),
            params={
                "MarketplaceIds": self.account.marketplace_id,
                "CreatedAfter": self.account.last_order_sync_iso,
            },
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def confirm_order_for_shipping(self, order_id, tracking_data):
        return {
            "status": "requires_merchant_fulfillment_or_feeds_flow",
            "order_id": order_id,
            "tracking_data": tracking_data,
        }
```

Nota importante: Amazon SP-API requiere firma AWS SigV4 además del token LWA en muchas llamadas. El código anterior deja la estructura de integración; la firma debe implementarse en un cliente HTTP común antes de producción. ([Amazon Services API][2])

## Walmart

```python
# apps/marketplaces/connectors/walmart.py

import requests
from .base import MarketplaceConnector


class WalmartConnector(MarketplaceConnector):
    BASE_URL = "https://marketplace.walmartapis.com/v3"

    def headers(self):
        return {
            "WM_SEC.ACCESS_TOKEN": self.account.access_token,
            "WM_QOS.CORRELATION_ID": self.account.correlation_id,
            "WM_SVC.NAME": "MasterMarketplace",
            "Accept": "application/json",
            "Content-Type": "application/json",
        }

    def create_product(self, product):
        payload = {
            "MPItemFeedHeader": {
                "version": "5.0",
                "requestId": product["sync_job_id"],
                "requestBatchId": product["sync_job_id"],
            },
            "MPItem": [product["walmart_payload"]],
        }

        response = requests.post(
            f"{self.BASE_URL}/feeds",
            headers=self.headers(),
            params={"feedType": "MP_ITEM"},
            json=payload,
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def get_product(self, external_product_id):
        response = requests.get(
            f"{self.BASE_URL}/items/{external_product_id}",
            headers=self.headers(),
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def get_orders(self):
        response = requests.get(
            f"{self.BASE_URL}/orders",
            headers=self.headers(),
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def confirm_order_for_shipping(self, order_id, tracking_data):
        payload = {
            "orderShipment": {
                "orderLines": tracking_data["orderLines"],
                "shipmentTrackingInfo": {
                    "carrierName": {
                        "carrier": tracking_data["carrier"]
                    },
                    "methodCode": tracking_data["methodCode"],
                    "trackingNumber": tracking_data["trackingNumber"],
                    "shipDateTime": tracking_data["shipDateTime"],
                },
            }
        }

        response = requests.post(
            f"{self.BASE_URL}/orders/{order_id}/shipping",
            headers=self.headers(),
            json=payload,
            timeout=30,
        )
        response.raise_for_status()
        return response.json()
```

## eBay

```python
# apps/marketplaces/connectors/ebay.py

import requests
from .base import MarketplaceConnector


class EbayConnector(MarketplaceConnector):
    BASE_URL = "https://api.ebay.com"

    def headers(self):
        return {
            "Authorization": f"Bearer {self.account.access_token}",
            "Content-Type": "application/json",
            "Content-Language": "es-MX",
        }

    def create_product(self, product):
        sku = product["sku"]

        inventory_payload = {
            "availability": {
                "shipToLocationAvailability": {
                    "quantity": product["stock"]
                }
            },
            "condition": product.get("condition", "NEW"),
            "product": {
                "title": product["name"],
                "description": product["description"],
                "aspects": product.get("aspects", {}),
                "imageUrls": product.get("images", []),
            },
        }

        inv = requests.put(
            f"{self.BASE_URL}/sell/inventory/v1/inventory_item/{sku}",
            headers=self.headers(),
            json=inventory_payload,
            timeout=30,
        )
        inv.raise_for_status()

        offer_payload = {
            "sku": sku,
            "marketplaceId": self.account.marketplace_id,
            "format": "FIXED_PRICE",
            "availableQuantity": product["stock"],
            "categoryId": product["marketplace_category_id"],
            "listingDescription": product["description"],
            "pricingSummary": {
                "price": {
                    "value": str(product["price"]),
                    "currency": product.get("currency", "MXN"),
                }
            },
            "merchantLocationKey": self.account.location_key,
        }

        offer = requests.post(
            f"{self.BASE_URL}/sell/inventory/v1/offer",
            headers=self.headers(),
            json=offer_payload,
            timeout=30,
        )
        offer.raise_for_status()
        offer_id = offer.json()["offerId"]

        publish = requests.post(
            f"{self.BASE_URL}/sell/inventory/v1/offer/{offer_id}/publish",
            headers=self.headers(),
            timeout=30,
        )
        publish.raise_for_status()
        return publish.json()

    def get_product(self, external_product_id):
        response = requests.get(
            f"{self.BASE_URL}/sell/inventory/v1/inventory_item/{external_product_id}",
            headers=self.headers(),
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def get_orders(self):
        response = requests.get(
            f"{self.BASE_URL}/sell/fulfillment/v1/order",
            headers=self.headers(),
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def confirm_order_for_shipping(self, order_id, tracking_data):
        payload = {
            "lineItems": tracking_data["lineItems"],
            "shippedDate": tracking_data["shippedDate"],
            "shippingCarrierCode": tracking_data["carrier"],
            "trackingNumber": tracking_data["trackingNumber"],
        }

        response = requests.post(
            f"{self.BASE_URL}/sell/fulfillment/v1/order/{order_id}/shipping_fulfillment",
            headers=self.headers(),
            json=payload,
            timeout=30,
        )
        response.raise_for_status()
        return response.json()
```

## WooCommerce

```python
# apps/marketplaces/connectors/woocommerce.py

import requests
from requests.auth import HTTPBasicAuth
from .base import MarketplaceConnector


class WooCommerceConnector(MarketplaceConnector):
    def base_url(self):
        return f"{self.account.store_url.rstrip('/')}/wp-json/wc/v3"

    def auth(self):
        return HTTPBasicAuth(
            self.account.consumer_key,
            self.account.consumer_secret,
        )

    def create_product(self, product):
        payload = {
            "name": product["name"],
            "type": "simple",
            "regular_price": str(product["price"]),
            "description": product["description"],
            "sku": product["sku"],
            "manage_stock": True,
            "stock_quantity": product["stock"],
            "categories": product.get("categories", []),
            "images": [{"src": url} for url in product.get("images", [])],
        }

        response = requests.post(
            f"{self.base_url()}/products",
            auth=self.auth(),
            json=payload,
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def get_product(self, external_product_id):
        response = requests.get(
            f"{self.base_url()}/products/{external_product_id}",
            auth=self.auth(),
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def get_orders(self):
        response = requests.get(
            f"{self.base_url()}/orders",
            auth=self.auth(),
            params={"status": "processing"},
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def confirm_order_for_shipping(self, order_id, tracking_data):
        payload = {
            "status": "completed",
            "meta_data": [
                {"key": "tracking_number", "value": tracking_data["trackingNumber"]},
                {"key": "carrier", "value": tracking_data["carrier"]},
            ],
        }

        response = requests.put(
            f"{self.base_url()}/orders/{order_id}",
            auth=self.auth(),
            json=payload,
            timeout=30,
        )
        response.raise_for_status()
        return response.json()
```

## Shopify

```python
# apps/marketplaces/connectors/shopify.py

import requests
from .base import MarketplaceConnector


class ShopifyConnector(MarketplaceConnector):
    API_VERSION = "2026-04"

    def endpoint(self):
        return f"https://{self.account.shop_domain}/admin/api/{self.API_VERSION}/graphql.json"

    def headers(self):
        return {
            "X-Shopify-Access-Token": self.account.access_token,
            "Content-Type": "application/json",
        }

    def graphql(self, query, variables=None):
        response = requests.post(
            self.endpoint(),
            headers=self.headers(),
            json={"query": query, "variables": variables or {}},
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def create_product(self, product):
        query = """
        mutation productCreate($product: ProductCreateInput!) {
          productCreate(product: $product) {
            product {
              id
              title
              handle
            }
            userErrors {
              field
              message
            }
          }
        }
        """

        variables = {
            "product": {
                "title": product["name"],
                "descriptionHtml": product["description"],
                "vendor": product.get("brand", "Refapart"),
                "productType": product.get("product_type", "Auto Parts"),
                "tags": product.get("tags", []),
            }
        }

        return self.graphql(query, variables)

    def get_product(self, external_product_id):
        query = """
        query getProduct($id: ID!) {
          product(id: $id) {
            id
            title
            handle
            status
            totalInventory
          }
        }
        """

        return self.graphql(query, {"id": external_product_id})

    def get_orders(self):
        query = """
        query {
          orders(first: 50, query: "fulfillment_status:unfulfilled") {
            edges {
              node {
                id
                name
                displayFulfillmentStatus
                email
              }
            }
          }
        }
        """

        return self.graphql(query)

    def confirm_order_for_shipping(self, order_id, tracking_data):
        return {
            "status": "requires_fulfillment_order_flow",
            "message": "Shopify requiere resolver fulfillmentOrders antes de crear fulfillment.",
            "order_id": order_id,
            "tracking_data": tracking_data,
        }
```

## PrestaShop

```python
# apps/marketplaces/connectors/prestashop.py

import requests
from requests.auth import HTTPBasicAuth
from .base import MarketplaceConnector


class PrestaShopConnector(MarketplaceConnector):
    def base_url(self):
        return f"{self.account.store_url.rstrip('/')}/api"

    def auth(self):
        return HTTPBasicAuth(self.account.webservice_key, "")

    def create_product(self, product):
        payload = {
            "prestashop": {
                "product": {
                    "name": {
                        "language": {
                            "id": self.account.language_id,
                            "value": product["name"],
                        }
                    },
                    "price": product["price"],
                    "active": 1,
                    "description": {
                        "language": {
                            "id": self.account.language_id,
                            "value": product["description"],
                        }
                    },
                    "reference": product["sku"],
                }
            }
        }

        response = requests.post(
            f"{self.base_url()}/products",
            auth=self.auth(),
            json=payload,
            headers={"Content-Type": "application/json"},
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def get_product(self, external_product_id):
        response = requests.get(
            f"{self.base_url()}/products/{external_product_id}",
            auth=self.auth(),
            params={"output_format": "JSON"},
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def get_orders(self):
        response = requests.get(
            f"{self.base_url()}/orders",
            auth=self.auth(),
            params={"output_format": "JSON"},
            timeout=30,
        )
        response.raise_for_status()
        return response.json()

    def confirm_order_for_shipping(self, order_id, tracking_data):
        payload = {
            "prestashop": {
                "order_carrier": {
                    "id_order": order_id,
                    "tracking_number": tracking_data["trackingNumber"],
                    "shipping_cost_tax_incl": tracking_data.get("shippingCost", 0),
                }
            }
        }

        response = requests.post(
            f"{self.base_url()}/order_carriers",
            auth=self.auth(),
            json=payload,
            headers={"Content-Type": "application/json"},
            timeout=30,
        )
        response.raise_for_status()
        return response.json()
```

## Servicio reutilizable para Refapart o cualquier web

```python
# apps/marketplaces/services/product_publish_service.py

from apps.marketplaces.connectors.factory import get_connector
from apps.marketplaces.models import MarketplaceProductLink


class ProductPublishService:
    def publish(self, client_id, provider_code, account, product):
        connector = get_connector(provider_code, account)
        result = connector.create_product(product)

        MarketplaceProductLink.objects.update_or_create(
            ClientId=client_id,
            ProviderCode=provider_code,
            AccountId=account.id,
            ProductId=product["id"],
            defaults={
                "ExternalProductId": self.extract_external_id(provider_code, result),
                "SyncStatus": "Published",
                "LastError": None,
            },
        )

        return result

    def extract_external_id(self, provider_code, result):
        if provider_code == "MERCADOLIBRE":
            return result["id"]
        if provider_code == "WOOCOMMERCE":
            return result["id"]
        if provider_code == "SHOPIFY":
            return result["data"]["productCreate"]["product"]["id"]
        if provider_code == "EBAY":
            return result.get("listingId") or result.get("offerId")
        if provider_code == "AMAZON":
            return result.get("sku")
        if provider_code == "WALMART":
            return result.get("feedId")
        if provider_code == "PRESTASHOP":
            return result["prestashop"]["product"]["id"]

        raise ValueError("Proveedor no soportado")
```

## Servicio para confirmar compra y preparar envío

```python
# apps/marketplaces/services/order_fulfillment_service.py

from apps.marketplaces.connectors.factory import get_connector


class OrderFulfillmentService:
    def prepare_and_confirm_shipping(
        self,
        provider_code,
        account,
        order_id,
        tracking_number,
        carrier,
        method_code="Standard",
    ):
        connector = get_connector(provider_code, account)

        tracking_data = {
            "trackingNumber": tracking_number,
            "carrier": carrier,
            "methodCode": method_code,
        }

        return connector.confirm_order_for_shipping(order_id, tracking_data)
```

## Flujo para Refapart

```text
Refapart WEB
→ Gateway
→ MarketplaceIntegration.publish_product
→ Catalog API obtiene producto
→ Pricing API obtiene precio
→ Inventory API obtiene stock
→ MarketplaceConnector correspondiente
→ MarketplaceProductLinks guarda ID externo
```

## Lo que falta antes de producción

1. Amazon: implementar firma AWS SigV4 real.
2. Shopify: completar flujo `fulfillmentOrders` antes de marcar enviado.
3. Mercado Libre: completar flujo de `shipments` según tipo de envío de la publicación.
4. Walmart: validar payload XML/JSON exacto por categoría aprobada.
5. PrestaShop: validar si la tienda acepta JSON o requiere XML según configuración.
6. Todos: cifrar tokens y llaves, nunca exponerlos en frontend.

[1]: https://github.com/MexIngSoft/Docs/tree/general "GitHub - MexIngSoft/Docs at general · GitHub"
[2]: https://developer-docs.amazon.com/sp-api?utm_source=chatgpt.com "Selling Partner API"
[3]: https://developer.walmart.com/us-marketplace/docs/order-management-api-overview?utm_source=chatgpt.com "Orders Management API overview"
[4]: https://developer.ebay.com/api-docs/sell/inventory/resources/methods?utm_source=chatgpt.com "APIs"
[5]: https://developer.woocommerce.com/docs/apis/rest-api/?utm_source=chatgpt.com "WooCommerce REST API"
[6]: https://shopify.dev/docs/api/admin-graphql/latest/mutations/productCreate?utm_source=chatgpt.com "productCreate - GraphQL Admin"
[7]: https://devdocs.prestashop-project.org/9/webservice/?utm_source=chatgpt.com "The PrestaShop Webservice API"

