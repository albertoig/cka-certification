import Image from "next/image";

export default function Page() {

  const callAPI = async () => {
		try {
			const res = await fetch(
				`${process.env.BACKEND_URL}/`
			);
			const data = await res.json();
			return data;
		} catch (err) {
			return err;
		}
	};

  const data = callAPI()
  .then(result => {
    return `Hello, This is the Frontend Example of the CKA exam! The backend call result is: ${JSON.stringify(result)}`
  })
  .catch(error => {
    return `Caught an error: ${error}`
  });
  return data
}
