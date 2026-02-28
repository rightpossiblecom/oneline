import Image from "next/image";
import Link from "next/link";

export function Footer() {
  return (
    <footer className="bg-gray-100 dark:bg-gray-800 py-10">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex flex-col md:flex-row md:justify-between items-center">
          <div className="flex items-center">
            <Image src="/logo.svg" alt="OneLine logo" width={32} height={32} />
            <span className="ml-2 font-bold text-lg text-gray-900 dark:text-white">
              OneLine
            </span>
          </div>
          <p className="mt-4 md:mt-0 text-sm text-gray-600 dark:text-gray-400">
            A sleek utility for capturing ideas in one line.
          </p>
        </div>
        <div className="mt-6 flex flex-wrap justify-center gap-4">
          <Link href="/privacy-policy" className="text-gray-600 hover:text-gray-900 dark:text-gray-400">
              Privacy Policy
          </Link>
          <Link href="/terms" className="text-gray-600 hover:text-gray-900 dark:text-gray-400">
              Terms of Service
          </Link>
          <Link href="/contact" className="text-gray-600 hover:text-gray-900 dark:text-gray-400">
              Contact
          </Link>
        </div>
        <div className="mt-6 text-center text-xs text-gray-500 dark:text-gray-400">
          © {new Date().getFullYear()} OneLine. All rights reserved.
        </div>
      </div>
    </footer>
  );
}
