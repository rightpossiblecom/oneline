import Image from "next/image";

export function AppScreen() {
  return (
    <div className="flex justify-center mt-12">
      <div className="w-full max-w-md border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden shadow-lg">
        <Image src="/window.svg" alt="App mockup" width={400} height={300} />
      </div>
    </div>
  );
}
