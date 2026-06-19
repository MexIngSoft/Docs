import { NextResponse } from 'next/server';
import { getContactLeads } from '../../lib';

export async function GET() {
  const leads = await getContactLeads();
  return NextResponse.json({ success: true, leads });
}
