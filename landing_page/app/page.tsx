import { Hero } from "../components/landing/Hero";
import { Features } from "../components/landing/Features";
import { HowItWorks } from "../components/landing/HowItWorks";
import { FAQ } from "../components/landing/FAQ";
import { AppScreen } from "../components/mockup/AppScreen";

export default function Home() {
  return (
    <div className="bg-white dark:bg-gray-900 text-gray-900 dark:text-gray-100">
      <Hero />
      <Features />
      <HowItWorks />
      <AppScreen />
      <FAQ />
    </div>
  );
}
