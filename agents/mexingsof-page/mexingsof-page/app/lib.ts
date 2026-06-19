import { PrismaClient, ProductStatus, LeadStatus } from '@prisma/client';

const globalForPrisma = globalThis as unknown as { prisma?: PrismaClient };

export const prisma = globalForPrisma.prisma ?? new PrismaClient();

if (process.env.NODE_ENV !== 'production') {
  globalForPrisma.prisma = prisma;
}

export const fallbackProducts = [
  {
    id: 'fallback-lexnova',
    slug: 'lexnova',
    name: 'LexNova',
    category: 'LegalTech',
    shortDescription: 'Inteligencia legal y gestion de documentos juridicos con IA.',
    longDescription: 'Plataforma LegalTech para expedientes, documentos, revision humana y flujos legales.',
    icon: 'FileText',
    status: ProductStatus.PENDING,
    isActive: true,
    isOnline: false,
    publicUrl: null,
    sortOrder: 1,
    createdAt: new Date(),
    updatedAt: new Date()
  },
  {
    id: 'fallback-fiscora',
    slug: 'fiscora',
    name: 'Fiscora',
    category: 'FiscalTech',
    shortDescription: 'Automatizacion fiscal, calculos y cumplimiento inteligente.',
    longDescription: 'Producto FiscalTech para CFDI, reportes fiscales y automatizacion tributaria.',
    icon: 'Calculator',
    status: ProductStatus.PENDING,
    isActive: true,
    isOnline: false,
    publicUrl: null,
    sortOrder: 2,
    createdAt: new Date(),
    updatedAt: new Date()
  },
  {
    id: 'fallback-docucore',
    slug: 'docucore',
    name: 'DocuCore',
    category: 'Gestion Documental',
    shortDescription: 'Gestion avanzada de documentos y flujos de trabajo.',
    longDescription: 'Motor documental para carga, extraccion, OCR y procesamiento controlado.',
    icon: 'FileStack',
    status: ProductStatus.READY,
    isActive: true,
    isOnline: false,
    publicUrl: null,
    sortOrder: 3,
    createdAt: new Date(),
    updatedAt: new Date()
  },
  {
    id: 'fallback-erp',
    slug: 'erp',
    name: 'ERP',
    category: 'Empresarial',
    shortDescription: 'Sistema ERP modular para empresas de todos los tamanos.',
    longDescription: 'ERP modular para ventas, cotizaciones, inventario, proveedores y operacion.',
    icon: 'Building2',
    status: ProductStatus.PENDING,
    isActive: true,
    isOnline: false,
    publicUrl: null,
    sortOrder: 4,
    createdAt: new Date(),
    updatedAt: new Date()
  },
  {
    id: 'fallback-apis',
    slug: 'apis-y-microservicios',
    name: 'APIs y Microservicios',
    category: 'Infraestructura',
    shortDescription: 'APIs robustas y seguras para integrar tus sistemas.',
    longDescription: 'Arquitectura reusable de APIs, Gateway General e integraciones backend.',
    icon: 'Network',
    status: ProductStatus.READY,
    isActive: true,
    isOnline: false,
    publicUrl: null,
    sortOrder: 5,
    createdAt: new Date(),
    updatedAt: new Date()
  }
];

export async function getActiveProducts() {
  try {
    const products = await prisma.product.findMany({
      where: { isActive: true },
      orderBy: { sortOrder: 'asc' }
    });
    return products.length ? products : fallbackProducts;
  } catch {
    return fallbackProducts;
  }
}

export async function getAdminProducts() {
  try {
    return await prisma.product.findMany({ orderBy: { sortOrder: 'asc' } });
  } catch {
    return fallbackProducts;
  }
}

export async function getContactLeads() {
  try {
    return await prisma.contactLead.findMany({ orderBy: { createdAt: 'desc' } });
  } catch {
    return [] as Array<{
      id: string;
      fullName: string;
      email: string;
      phone: string | null;
      company: string | null;
      interest: string | null;
      message: string;
      source: string;
      status: LeadStatus;
      createdAt: Date;
      updatedAt: Date;
    }>;
  }
}
