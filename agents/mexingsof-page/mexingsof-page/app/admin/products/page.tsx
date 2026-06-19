import { Header } from '../../components/Header';
import { getAdminProducts } from '../../lib';
import { ProductAdminTable } from './ProductAdminTable';

export const dynamic = 'force-dynamic';

export default async function AdminProductsPage() {
  const products = await getAdminProducts();

  return (
    <main className="page-frame admin-page">
      <Header />
      <section className="admin-heading">
        <span>Admin MexIngSof</span>
        <h1>Productos y soluciones</h1>
        <p>
          TODO: integrar Auth/Gateway antes de usar este panel fuera de entorno local controlado.
        </p>
      </section>
      <ProductAdminTable products={products} />
    </main>
  );
}
