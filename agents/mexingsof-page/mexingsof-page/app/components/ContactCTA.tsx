import { Clock, Mail, MapPin, Phone } from 'lucide-react';
import { ContactForm } from './ContactForm';

const details = [
  { label: 'Email', value: 'hola@mexingsof.com', icon: Mail },
  { label: 'Telefono', value: '+52 000 000 0000', icon: Phone },
  { label: 'Ubicacion', value: 'Mexico', icon: MapPin },
  { label: 'Horario', value: 'Lun - Vie 9:00 - 18:00', icon: Clock }
];

export function ContactCTA() {
  return (
    <section id="contacto" className="contact-section">
      <div className="contact-strip">
        <div>
          <h2>Tienes un proyecto en mente?</h2>
          <p>Hablemos y construyamos juntos la mejor solucion.</p>
        </div>
        <a className="button button-primary" href="#formulario">
          Contactar asesor
        </a>
        {details.map((detail) => {
          const Icon = detail.icon;
          return (
            <article key={detail.label}>
              <Icon size={22} />
              <strong>{detail.label}</strong>
              <span>{detail.value}</span>
            </article>
          );
        })}
      </div>
      <div id="formulario" className="contact-panel">
        <div className="section-heading">
          <h2>Contacto rapido</h2>
          <p>Registra tu solicitud para seguimiento interno y priorizacion comercial.</p>
        </div>
        <ContactForm />
      </div>
    </section>
  );
}
