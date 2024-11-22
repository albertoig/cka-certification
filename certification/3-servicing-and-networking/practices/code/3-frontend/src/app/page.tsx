import { useState, useEffect } from 'react';

export default function Page() {
  const [data, setData] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    const callAPI = async () => {
      try {
        const res = await fetch(`${process.env.NEXT_PUBLIC_BACKEND_URL}/`);
        const data = await res.json();
        setData(data);
      } catch (err) {
        setError(err.message);
      }
    };

    callAPI();
  }, []);

  if (error) return <p>Caught an error: {error}</p>;

  if (!data) return <p>Loading...</p>;

  return <p>Hello, This is the Frontend Practice of the CKA exam! The backend call result is: {JSON.stringify(data)}</p>;
}