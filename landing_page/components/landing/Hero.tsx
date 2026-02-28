import Link from "next/link";

export function Hero() {
  return (
    <section className="bg-white dark:bg-gray-900 py-24">
      <div className="max-w-3xl mx-auto px-4 text-center">
        <h1 className="text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
          Capture every thought in a single line.
        </h1>
        <p className="mt-4 text-lg text-gray-600 dark:text-gray-300">
          OneLine helps you jot down ideas, reminders, and notes faster than ever.
        </p>
        <div className="mt-8">
          <Link
            href="#"
            className="inline-block rounded-md btn-primary px-8 py-3 text-base font-medium"
          >
            Get Started
          </Link>
        </div>
      </div>
    </section>
  );
}
