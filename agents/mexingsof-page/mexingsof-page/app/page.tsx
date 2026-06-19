import { ContactCTA } from './components/ContactCTA';
import { Footer } from './components/Footer';
import { Header } from './components/Header';
import { HeroSection } from './components/HeroSection';
import { SolutionsSection } from './components/SolutionsSection';
import { TechnologySection } from './components/TechnologySection';
import { ValueBar } from './components/ValueBar';
import { getActiveProducts } from './lib';

export const dynamic = 'force-dynamic';

export default async function Home() {
  const products = await getActiveProducts();

  return (
    <main className="page-frame">
      <Header />
      <HeroSection />
      <ValueBar />
      <SolutionsSection products={products} />
      <TechnologySection />
      <ContactCTA />
      <Footer />
    </main>
  );
}
