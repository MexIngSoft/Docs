import { ProductStatus } from '@prisma/client';
import { NextResponse } from 'next/server';
import { prisma } from '../../../lib';

const statusValues = Object.values(ProductStatus);

export async function PATCH(request: Request, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const body = await request.json().catch(() => ({}));
  const data: {
    status?: ProductStatus;
    isActive?: boolean;
    isOnline?: boolean;
    publicUrl?: string | null;
    sortOrder?: number;
  } = {};

  if (body.status !== undefined) {
    if (!statusValues.includes(body.status)) {
      return NextResponse.json({ success: false, error: 'Estado de producto invalido.' }, { status: 400 });
    }
    data.status = body.status;
  }
  if (body.isActive !== undefined) data.isActive = Boolean(body.isActive);
  if (body.isOnline !== undefined) data.isOnline = Boolean(body.isOnline);
  if (body.publicUrl !== undefined) data.publicUrl = body.publicUrl ? String(body.publicUrl).trim() : null;
  if (body.sortOrder !== undefined) data.sortOrder = Number(body.sortOrder);

  const product = await prisma.product.update({ where: { id }, data });
  return NextResponse.json({ success: true, product });
}
