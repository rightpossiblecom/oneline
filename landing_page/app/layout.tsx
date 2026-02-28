import type { Metadata } from "next";
import { Inter } from "next/font/google";
import "./globals.css";

// custom components
import { Navbar } from "../components/layout/Navbar";
import { Footer } from "../components/landing/Footer";

const inter = Inter({
  subsets: ["latin"],
  variable: "--font-inter",
});

export const metadata: Metadata = {
  title: "OneLine – capture ideas quickly",
  description: "OneLine is a minimalist note taking tool that lets you record thoughts in a single line. No account needed.",
  icons: {
    icon: "/logo.svg",
    shortcut: "/logo.svg",
    apple: "/logo.svg",
  },
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className={`${inter.variable} antialiased`}
      >
        <div className="flex flex-col min-h-screen">
          {/* navigation bar */}
          <Navbar />
          <main className="grow">
            {children}
          </main>
          <Footer />
        </div>
      </body>
    </html>
  );
}
