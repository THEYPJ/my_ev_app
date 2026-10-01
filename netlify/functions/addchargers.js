exports.handler = async (event, context) => {
  // Only allow POST requests
  if (event.httpMethod !== "POST") {
    return { statusCode: 405, body: "Method Not Allowed" };
  }

  try {
    const chargerData = JSON.parse(event.body);

    // TODO: Connect to your database (e.g., Supabase, MongoDB, Firebase)
    // const db = await connectToDatabase();
    // await db.collection('chargers').insertOne(chargerData);

    console.log("New charger received:", chargerData.name);

    return {
      statusCode: 200,
      headers: {
        "Access-Control-Allow-Origin": "*", // Configure for your Flutter web domain
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ message: "Charger added successfully", data: chargerData }),
    };
  } catch (error) {
    return {
      statusCode: 400,
      body: JSON.stringify({ error: "Invalid payload or database error" }),
    };
  }
};