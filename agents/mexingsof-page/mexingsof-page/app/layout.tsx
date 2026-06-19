import './globals.css';
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'MexIngSof | Ingenieria de Software Mexicana',
  description: 'Soluciones de software, APIs, LegalTech, FiscalTech, DocuCore y ERP empresarial.'
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="es">
      <body>{children}</body>
    </html>
  );
}
