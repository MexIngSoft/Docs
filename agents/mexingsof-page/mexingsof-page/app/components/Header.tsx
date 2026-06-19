import { Logo } from './Logo';

const links = ['Inicio', 'Nosotros', 'Soluciones', 'Productos', 'Servicios', 'Tecnologias', 'Blog', 'Contacto'];

export function Header() {
  return (
    <header className="site-header">
      <a className="site-brand" href="#inicio" aria-label="Inicio MexIngSof">
        <Logo />
      </a>
      <nav className="main-nav" aria-label="Navegacion principal">
        {links.map((link) => (
          <a key={link} href={`#${link.toLowerCase()}`}>
            {link}
          </a>
        ))}
        <a className="talk-button" href="#contacto">
          Hablemos
        </a>
      </nav>
    </header>
  );
}
