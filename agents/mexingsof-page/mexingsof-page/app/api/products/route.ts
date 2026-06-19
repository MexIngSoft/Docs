import { NextResponse } from 'next/server';
import { getActiveProducts } from '../../lib';

export async function GET() {
  const products = await getActiveProducts();
  return NextResponse.json({ success: true, products });
}
