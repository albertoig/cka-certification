
import { headers } from 'next/headers';

async function fetchData() {
	const headersInstance = await headers();
	// Now you can use headersInstance safely
	const res = await fetch(`${process.env.BACKEND_URL}/`, {
		headers: headersInstance,
	});
	if (!res.ok) {
		throw new Error('Data fetch failed');
	}
	return res.json();
}

export default async function Page() {
  let data;
  let error;

  try {
    data = await fetchData();
  } catch (err) {
    error = err.message;
    // Server-side logging
    console.error('Server-side error:', err);
  }

  if (error) return <p>Caught an error: {error}</p>;

  return (
    <div>
      <p>Hello, This is the Frontend Practice of the CKA exam! The backend call result is: {JSON.stringify(data)}</p>
    </div>
  );
}