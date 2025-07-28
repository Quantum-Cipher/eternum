const admin = require("firebase-admin");
const fs = require("fs");

// Load Firebase service account key
const serviceAccount = require("./serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://eternum-39083.firebaseio.com"  // ✅ Your actual project ID
});

const db = admin.firestore();
const logPath = `${process.env.HOME}/eternum/ghostnode_engine/logs/eternal_beacon.log`;

try {
  const lines = fs.readFileSync(logPath, "utf-8").trim().split("\n").slice(-30);
  const payload = {
    timestamp: new Date().toISOString(),
    lines,
  };

  db.collection("eternal_beacon").add(payload).then(() => {
    console.log("📡 Synced Eternal Beacon to Firebase");
  });
} catch (err) {
  console.error("❌ Failed to sync:", err.message);
}
