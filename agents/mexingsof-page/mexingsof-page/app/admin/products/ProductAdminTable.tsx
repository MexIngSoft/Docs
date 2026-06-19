'use client';

import type { Product, ProductStatus } from '@prisma/client';
import { useState } from 'react';

const statuses: ProductStatus[] = ['PENDING', 'READY', 'ONLINE', 'PAUSED', 'ARCHIVED'];

export function ProductAdminTable({ products }: { products: Product[] }) {
  const [rows, setRows] = useState(products);
  const [savingId, setSavingId] = useState<string | null>(null);

  async function patch(id: string, patchData: Partial<Product>) {
    setSavingId(id);
    const response = await fetch(`/api/products/${id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(patchData)
    });
    const body = await response.json();
    if (body.product) {
      setRows((current) => current.map((item) => (item.id === id ? body.product : item)));
    }
    setSavingId(null);
  }

  return (
    <div className="admin-table">
      {rows.map((product) => (
        <article className="admin-row" key={product.id}>
          <div>
            <h3>{product.name}</h3>
            <p>{product.category}</p>
          </div>
          <label>
            Estado
            <select value={product.status} onChange={(event) => patch(product.id, { status: event.target.value as ProductStatus })}>
              {statuses.map((status) => (
                <option key={status} value={status}>
                  {status}
                </option>
              ))}
            </select>
          </label>
          <label>
            Activo
            <input checked={product.isActive} type="checkbox" onChange={(event) => patch(product.id, { isActive: event.target.checked })} />
          </label>
          <label>
            Online
            <input checked={product.isOnline} type="checkbox" onChange={(event) => patch(product.id, { isOnline: event.target.checked })} />
          </label>
          <label>
            URL publica
            <input
              defaultValue={product.publicUrl ?? ''}
              onBlur={(event) => patch(product.id, { publicUrl: event.target.value || null })}
              placeholder="https://..."
            />
          </label>
          <label>
            Orden
            <input
              defaultValue={product.sortOrder}
              min={0}
              type="number"
              onBlur={(event) => patch(product.id, { sortOrder: Number(event.target.value) })}
            />
          </label>
          <span>{savingId === product.id ? 'Guardando...' : 'OK'}</span>
        </article>
      ))}
    </div>
  );
}
