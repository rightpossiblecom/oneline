export function FAQ() {
  const faq = [
    {
      q: "Do I need an account?",
      a: "No, OneLine works completely offline and does not require any login. Your data stays on your device.",
    },
    {
      q: "How do I back up my lines?",
      a: "You can export your notes to a JSON file or use the built-in sync feature when available.",
    },
    {
      q: "Is there a dark mode?",
      a: "Yes, the landing page and app support light and dark themes based on your system settings.",
    },
    {
      q: "What platforms are supported?",
      a: "OneLine will be available on Android, iOS, Web, Windows, macOS, and Linux through Flutter.",
    },
    {
      q: "Is my data shared?",
      a: "Never. We do not collect or share any personal data. Everything stays local. See our privacy policy for details.",
    },
  ];

  return (
    <section id="faq" className="py-24 bg-gray-50 dark:bg-gray-800">
      <div className="max-w-3xl mx-auto px-4">
        <h2 className="text-3xl font-bold text-center text-gray-900 dark:text-white">
          Frequently Asked Questions
        </h2>
        <div className="mt-8 space-y-6">
          {faq.map((item, idx) => (
            <div key={idx}>
              <h3 className="text-xl font-semibold text-gray-900 dark:text-white">
                {item.q}
              </h3>
              <p className="mt-2 text-gray-600 dark:text-gray-300">
                {item.a}
              </p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
