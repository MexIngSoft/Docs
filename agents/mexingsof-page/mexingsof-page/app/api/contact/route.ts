import { NextResponse } from 'next/server';
import { prisma } from '../../lib';

function isEmail(value: string) {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
}

export async function POST(request: Request) {
  const body = await request.json().catch(() => ({}));
  const fullName = String(body.fullName || body.name || '').trim();
  const email = String(body.email || '').trim().toLowerCase();
  const message = String(body.message || '').trim();

  if (!fullName) {
    return NextResponse.json({ success: false, error: 'Nombre completo requerido.' }, { status: 400 });
  }
  if (!email || !isEmail(email)) {
    return NextResponse.json({ success: false, error: 'Email requerido y valido.' }, { status: 400 });
  }
  if (!message) {
    return NextResponse.json({ success: false, error: 'Mensaje requerido.' }, { status: 400 });
  }

  const lead = await prisma.contactLead.create({
    data: {
      fullName,
      email,
      phone: body.phone ? String(body.phone).trim() : null,
      company: body.company ? String(body.company).trim() : null,
      interest: body.interest ? String(body.interest).trim() : null,
      message,
      source: body.source ? String(body.source).trim() : 'website'
    }
  });

  return NextResponse.json({ success: true, leadId: lead.id });
}
