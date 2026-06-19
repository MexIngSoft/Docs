import { Logo } from './Logo';

const groups = [
  ['Empresa', 'Nosotros', 'Mision, Vision y Valores', 'Carreras', 'Contacto'],
  ['Soluciones', 'LexNova', 'Fiscora', 'DocuCore', 'ERP', 'APIs y Microservicios'],
  ['Servicios', 'Desarrollo de Software', 'Consultoria IT', 'Integraciones', 'Mantenimiento', 'Soporte'],
  ['Recursos', 'Blog', 'Documentacion', 'Guias', 'Casos de Exito'],
  ['Legal', 'Aviso de Privacidad', 'Terminos y Condiciones']
];

export function Footer() {
  return (
    <footer className="site-footer">
      <div className="footer-grid">
        <div>
          <Logo />
          <p>Ingenieria de software mexicana para empresas que necesitan tecnologia util.</p>
          <div className="social-links">
            <span>f</span>
            <span>in</span>
            <span>gh</span>
            <span>yt</span>
          </div>
        </div>
        {groups.map(([title, ...items]) => (
          <nav key={title}>
            <h3>{title}</h3>
            {items.map((item) => (
              <a key={item} href="#contacto">
                {item}
              </a>
            ))}
          </nav>
        ))}
      </div>
      <p className="copyright">© 2024 MexIngSof. Todos los derechos reservados.</p>
    </footer>
  );
}
