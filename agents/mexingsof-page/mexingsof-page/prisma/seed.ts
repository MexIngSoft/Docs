import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  const products = [
    {
      slug: 'lexnova',
      name: 'LexNova',
      category: 'LegalTech',
      shortDescription: 'Inteligencia legal y gestion de documentos juridicos con IA.',
      longDescription: 'Plataforma LegalTech para organizar expedientes, documentos, revision humana y flujos legales asistidos.',
      icon: 'FileText',
      status: 'PENDING',
      isActive: true,
      isOnline: false,
      publicUrl: null,
      sortOrder: 1
    },
    {
      slug: 'fiscora',
      name: 'Fiscora',
      category: 'FiscalTech',
      shortDescription: 'Automatizacion fiscal, calculos y cumplimiento inteligente.',
      longDescription: 'Producto FiscalTech para administrar CFDI, reportes fiscales, controles y automatizacion tributaria.',
      icon: 'Calculator',
      status: 'PENDING',
      isActive: true,
      isOnline: false,
      publicUrl: null,
      sortOrder: 2
    },
    {
      slug: 'docucore',
      name: 'DocuCore',
      category: 'Gestion Documental',
      shortDescription: 'Gestion avanzada de documentos y flujos de trabajo.',
      longDescription: 'Motor documental para carga, extraccion, OCR, artefactos y procesamiento controlado de documentos.',
      icon: 'FileStack',
      status: 'READY',
      isActive: true,
      isOnline: false,
      publicUrl: null,
      sortOrder: 3
    },
    {
      slug: 'erp',
      name: 'ERP',
      category: 'Empresarial',
      shortDescription: 'Sistema ERP modular para empresas de todos los tamanos.',
      longDescription: 'ERP modular para ventas, cotizaciones, inventario, proveedores, proyectos, procesos y operacion.',
      icon: 'Building2',
      status: 'PENDING',
      isActive: true,
      isOnline: false,
      publicUrl: null,
      sortOrder: 4
    },
    {
      slug: 'apis-y-microservicios',
      name: 'APIs y Microservicios',
      category: 'Infraestructura',
      shortDescription: 'APIs robustas y seguras para integrar tus sistemas.',
      longDescription: 'Arquitectura reusable de APIs, Gateway General, integraciones, automatizacion y servicios backend.',
      icon: 'Network',
      status: 'READY',
      isActive: true,
      isOnline: false,
      publicUrl: null,
      sortOrder: 5
    }
  ] as const;

  for (const item of products) {
    await prisma.product.upsert({
      where: { slug: item.slug },
      update: item,
      create: item
    });
  }
}

main()
  .then(() => console.log('MexIngSof seed completed.'))
  .finally(() => prisma.$disconnect());
