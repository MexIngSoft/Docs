import { Cloud, Database, Laptop, Server } from 'lucide-react';
import { Logo } from './Logo';

export function HeroSection() {
  return (
    <section id="inicio" className="hero-section">
      <div className="hero-copy">
        <Logo large />
        <div className="hero-title-block">
          <h1>
            Soluciones de software innovadoras que <span>impulsan</span> a Mexico.
          </h1>
          <p>
            Desarrollamos plataformas, aplicaciones y APIs inteligentes que transforman procesos y
            generan valor para empresas y profesionales.
          </p>
          <div className="hero-actions">
            <a className="button button-primary" href="#contacto">
              Conoce mas
            </a>
            <a className="button button-outline" href="#productos">
              Nuestros productos
            </a>
          </div>
        </div>
      </div>
      <div className="hero-visual" aria-hidden="true">
        <div className="hero-curve" />
        <div className="tech-orbit">
          <Cloud className="cloud-icon" size={48} />
          <Server className="server-icon" size={64} />
          <Database className="database-icon" size={58} />
          <div className="dashboard-card">
            <Laptop size={128} strokeWidth={1.2} />
            <span>API</span>
          </div>
        </div>
      </div>
    </section>
  );
}
