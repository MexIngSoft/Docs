import { LeadStatus } from '@prisma/client';
import { NextResponse } from 'next/server';
import { prisma } from '../../../lib';

const statusValues = Object.values(LeadStatus);

export async function PATCH(request: Request, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params;
  const body = await request.json().catch(() => ({}));
  if (!statusValues.includes(body.status)) {
    return NextResponse.json({ success: false, error: 'Estado de lead invalido.' }, { status: 400 });
  }

  const lead = await prisma.contactLead.update({
    where: { id },
    data: { status: body.status }
  });
  return NextResponse.json({ success: true, lead });
}
