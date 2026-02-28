import { ReactNode } from "react";

interface Feature {
  title: string;
  description: string;
  icon: ReactNode;
}

const features: Feature[] = [
  {
    title: "Quick Notes",
    description: "Type or speak and save immediate one-line items.",
    icon: <span className="text-2xl">📝</span>,
  },
  {
    title: "Organize Easily",
    description: "Search, tag and reorder your lines with simple gestures.",
    icon: <span className="text-2xl">📂</span>,
  },
  {
    title: "Cross‑Device",
    description: "Sync across devices using local storage with no accounts.",
    icon: <span className="text-2xl">☁️</span>,
  },
];

export function Features() {
  return (
    <section id="features" className="py-24 bg-gray-50 dark:bg-gray-800">
      <div className="max-w-5xl mx-auto px-4">
        <h2 className="text-3xl font-bold text-center text-gray-900 dark:text-white">
          Features
        </h2>
        <div className="mt-12 grid gap-8 sm:grid-cols-2 lg:grid-cols-3">
          {features.map((f) => (
            <div key={f.title} className="flex flex-col items-center text-center">
              <div className="p-4 rounded-full bg-primary/20 dark:bg-primary/30 text-primary mb-4">
                {f.icon}
              </div>
              <h3 className="text-xl font-semibold text-gray-900 dark:text-white">
                {f.title}
              </h3>
              <p className="mt-2 text-gray-600 dark:text-gray-300">
                {f.description}
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
