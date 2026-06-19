import type { Product } from '@prisma/client';
import { ProductCard } from './ProductCard';

export function SolutionsSection({ products }: { products: Product[] }) {
  return (
    <section id="soluciones" className="solutions-section">
      <span id="productos" className="anchor-offset" />
      <div className="section-heading">
        <h2>Nuestras Soluciones</h2>
        <p>Plataformas especializadas para optimizar procesos criticos de tu organizacion.</p>
      </div>
      <div className="product-grid">
        {products.map((product) => (
          <ProductCard key={product.id} product={product} />
        ))}
      </div>
    </section>
  );
}
