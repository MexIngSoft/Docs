import { Code2, Network, Puzzle, Target } from 'lucide-react';

const items = [
  {
    title: 'Innovacion',
    text: 'Creamos soluciones modernas con tecnologia de ultima generacion.',
    icon: Target
  },
  {
    title: 'Ingenieria',
    text: 'Arquitectura solida, codigo limpio y mejores practicas.',
    icon: Puzzle
  },
  {
    title: 'Software',
    text: 'Sistemas escalables, seguros y de alto rendimiento.',
    icon: Code2
  },
  {
    title: 'Soluciones',
    text: 'Entregamos valor real que impulsa tu negocio y productividad.',
    icon: Network
  }
];

export function ValueBar() {
  return (
    <section id="nosotros" className="value-bar">
      {items.map((item) => {
        const Icon = item.icon;
        return (
          <article className="value-item" key={item.title}>
            <span className="value-icon">
              <Icon size={30} />
            </span>
            <div>
              <h3>{item.title}</h3>
              <p>{item.text}</p>
            </div>
          </article>
        );
      })}
    </section>
  );
}
