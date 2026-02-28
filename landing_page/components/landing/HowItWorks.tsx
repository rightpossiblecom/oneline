export function HowItWorks() {
  return (
    <section id="how" className="py-24 bg-white dark:bg-gray-900">
      <div className="max-w-3xl mx-auto px-4">
        <h2 className="text-3xl font-bold text-center text-gray-900 dark:text-white">
          How It Works
        </h2>
        <div className="mt-12 space-y-12">
          <div className="flex items-start">
            <div className="shrink-0">
              <span className="text-3xl">1️⃣</span>
            </div>
            <div className="ml-4">
              <h3 className="text-xl font-semibold text-gray-900 dark:text-white">
                Write or speak your line
              </h3>
              <p className="mt-2 text-gray-600 dark:text-gray-300">
                Launch the app and immediately type or dictate the thought.
              </p>
            </div>
          </div>
          <div className="flex items-start">
            <div className="flex-shrink-0">
              <span className="text-3xl">2️⃣</span>
            </div>
            <div className="ml-4">
              <h3 className="text-xl font-semibold text-gray-900 dark:text-white">
                Tag and organize
              </h3>
              <p className="mt-2 text-gray-600 dark:text-gray-300">
                Add tags or reorder your lines to keep things tidy.
              </p>
            </div>
          </div>
          <div className="flex items-start">
            <div className="flex-shrink-0">
              <span className="text-3xl">3️⃣</span>
            </div>
            <div className="ml-4">
              <h3 className="text-xl font-semibold text-gray-900 dark:text-white">
                Access anywhere
              </h3>
              <p className="mt-2 text-gray-600 dark:text-gray-300">
                Your lines stay with you; no account required.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
