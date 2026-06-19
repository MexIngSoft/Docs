import { Boxes, Cpu, Gauge, ShieldCheck } from 'lucide-react';

const metrics = [
  { value: '+20', label: 'Proyectos exitosos', icon: Gauge },
  { value: '+15', label: 'Tecnologias y herramientas', icon: Cpu },
  { value: '+10', label: 'Industrias atendidas', icon: Boxes },
  { value: '100%', label: 'Compromiso con la calidad', icon: ShieldCheck }
];

export function TechnologySection() {
  return (
    <section id="tecnologias" className="technology-section">
      <div className="technology-copy">
        <h2>Tecnologia que conecta y transforma</h2>
        <p>
          En MexIngSof construimos el futuro digital de empresas y profesionales en todo Mexico
          y mas alla.
        </p>
      </div>
      <div className="metrics-grid">
        {metrics.map((metric) => {
          const Icon = metric.icon;
          return (
            <article className="metric-card" key={metric.label}>
              <Icon size={30} />
              <strong>{metric.value}</strong>
              <span>{metric.label}</span>
            </article>
          );
        })}
      </div>
      <div className="mexico-map" aria-hidden="true">
        {Array.from({ length: 44 }).map((_, index) => (
          <i key={index} />
        ))}
      </div>
    </section>
  );
}
