"use client";

import Image from "next/image";
import Link from "next/link";

export function Navbar() {
  return (
    <nav className="w-full bg-white dark:bg-gray-900 shadow">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex items-center justify-between h-16">
        <Link href="/" className="flex items-center">
            <Image src="/logo.svg" alt="OneLine logo" width={32} height={32} />
            <span className="ml-2 font-bold text-lg text-gray-900 dark:text-white">
              OneLine
            </span>
        </Link>
        <div className="hidden md:flex space-x-4">
          <Link href="#features" className="text-gray-700 hover:text-gray-900 dark:text-gray-300">
              Features
          </Link>
          <Link href="#how" className="text-gray-700 hover:text-gray-900 dark:text-gray-300">
              How It Works
          </Link>
          <Link href="#faq" className="text-gray-700 hover:text-gray-900 dark:text-gray-300">
              FAQ
          </Link>
          <Link href="/privacy-policy" className="text-gray-700 hover:text-gray-900 dark:text-gray-300">
              Privacy
          </Link>
          <Link href="/terms" className="text-gray-700 hover:text-gray-900 dark:text-gray-300">
              Terms
          </Link>
          <Link href="/contact" className="text-gray-700 hover:text-gray-900 dark:text-gray-300">
              Contact
          </Link>
        </div>
      </div>
    </nav>
  );
}
