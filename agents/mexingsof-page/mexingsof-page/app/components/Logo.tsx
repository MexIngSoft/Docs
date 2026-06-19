export function Logo({ large = false }: { large?: boolean }) {
  return (
    <div className={large ? 'logo logo-large' : 'logo'}>
      <div className="logo-mark">
        <span>M</span>
        <span>S</span>
      </div>
      <div>
        <strong>
          MEXING<span>SOF</span>
        </strong>
        <small>Ingenieria de Software Mexicana</small>
      </div>
    </div>
  );
}
