import { Header } from '../../components/Header';
import { getContactLeads } from '../../lib';
import { LeadStatusControl } from './LeadStatusControl';

export const dynamic = 'force-dynamic';

export default async function AdminLeadsPage() {
  const leads = await getContactLeads();

  return (
    <main className="page-frame admin-page">
      <Header />
      <section className="admin-heading">
        <span>Admin MexIngSof</span>
        <h1>Leads de contacto</h1>
        <p>
          TODO: integrar Auth/Gateway antes de usar este panel fuera de entorno local controlado.
        </p>
      </section>
      <div className="admin-table">
        {leads.length ? (
          leads.map((lead) => (
            <article className="admin-row admin-row-wide" key={lead.id}>
              <div>
                <h3>{lead.fullName}</h3>
                <p>
                  {lead.email} {lead.phone ? `- ${lead.phone}` : ''}
                </p>
                <p>{lead.company || 'Sin empresa'} · {lead.interest || 'Sin interes definido'}</p>
                <p>{lead.message}</p>
              </div>
              <LeadStatusControl id={lead.id} initialStatus={lead.status} />
            </article>
          ))
        ) : (
          <section className="empty-state">
            <h2>Sin leads todavia</h2>
            <p>Cuando el formulario guarde solicitudes apareceran aqui.</p>
          </section>
        )}
      </div>
    </main>
  );
}
