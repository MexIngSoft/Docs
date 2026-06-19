'use client';

import type { LeadStatus } from '@prisma/client';
import { useState } from 'react';

const statuses: LeadStatus[] = ['NEW', 'CONTACTED', 'QUALIFIED', 'DISCARDED'];

export function LeadStatusControl({ id, initialStatus }: { id: string; initialStatus: LeadStatus }) {
  const [status, setStatus] = useState(initialStatus);
  const [saving, setSaving] = useState(false);

  async function update(nextStatus: LeadStatus) {
    setSaving(true);
    const response = await fetch(`/api/contact-leads/${id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ status: nextStatus })
    });
    if (response.ok) setStatus(nextStatus);
    setSaving(false);
  }

  return (
    <label>
      Estado
      <select value={status} onChange={(event) => update(event.target.value as LeadStatus)}>
        {statuses.map((item) => (
          <option key={item} value={item}>
            {item}
          </option>
        ))}
      </select>
      {saving ? <small>Guardando...</small> : null}
    </label>
  );
}
