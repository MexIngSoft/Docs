'use client';

import { FormEvent, useState } from 'react';

type Status = 'idle' | 'saving' | 'success' | 'error';

export function ContactForm() {
  const [status, setStatus] = useState<Status>('idle');
  const [message, setMessage] = useState('');

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    setStatus('saving');
    setMessage('');
    const form = event.currentTarget;
    const data = Object.fromEntries(new FormData(form).entries());

    const response = await fetch('/api/contact', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data)
    });

    if (response.ok) {
      form.reset();
      setStatus('success');
      setMessage('Solicitud recibida. Te contactaremos para aterrizar la mejor solucion.');
      return;
    }

    const body = await response.json().catch(() => ({ error: 'No fue posible registrar el lead.' }));
    setStatus('error');
    setMessage(body.error ?? 'No fue posible registrar el lead.');
  }

  return (
    <form className="contact-form" onSubmit={submit}>
      <label>
        Nombre completo
        <input name="fullName" required minLength={2} />
      </label>
      <label>
        Email
        <input name="email" type="email" required />
      </label>
      <label>
        Telefono
        <input name="phone" inputMode="tel" />
      </label>
      <label>
        Empresa
        <input name="company" />
      </label>
      <label>
        Interes
        <select name="interest" defaultValue="Software a medida">
          <option>Software a medida</option>
          <option>LexNova</option>
          <option>Fiscora</option>
          <option>DocuCore</option>
          <option>ERP</option>
          <option>APIs y Microservicios</option>
        </select>
      </label>
      <label className="wide">
        Mensaje
        <textarea name="message" required minLength={8} />
      </label>
      <button className="button button-primary" disabled={status === 'saving'} type="submit">
        {status === 'saving' ? 'Enviando...' : 'Enviar solicitud'}
      </button>
      {message ? <p className={`form-message ${status}`}>{message}</p> : null}
    </form>
  );
}
