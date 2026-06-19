import type { Product } from '@prisma/client';
import { Building2, Calculator, FileStack, FileText, Network } from 'lucide-react';

const icons = {
  Building2,
  Calculator,
  FileStack,
  FileText,
  Network
};

export function ProductCard({ product }: { product: Product }) {
  const Icon = icons[product.icon as keyof typeof icons] ?? Network;
  const href = product.status === 'ONLINE' && product.isOnline && product.publicUrl ? product.publicUrl : '#contacto';
  const label =
    product.status === 'ONLINE' && product.isOnline
      ? 'Conocer mas'
      : product.status === 'READY'
        ? 'Listo proximamente'
        : 'En desarrollo';

  return (
    <article className="product-card">
      <span className="product-icon">
        <Icon size={42} />
      </span>
      <h3>{product.name.toUpperCase()}</h3>
      <strong>{product.category}</strong>
      <p>{product.shortDescription}</p>
      {product.status === 'ONLINE' && product.isOnline ? (
        <a className="product-link" href={href}>
          {label} →
        </a>
      ) : (
        <span className="product-status">{label}</span>
      )}
    </article>
  );
}
