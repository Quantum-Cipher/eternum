const admin = require("firebase-admin");
const fs = require("fs");

const serviceAccount = require("./serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://eternum-39083.firebaseio.com"
});

const db = admin.firestore();

const linksDoc = {
  label: "Google Cloud Resource Manager",
  url: "https://console.cloud.google.com/cloud-resource-manager?pli=1&inv=1&invt=Ab36tg",
  added_on: new Date().toISOString()
};

db.collection("system_links").add(linksDoc).then(() => {
  console.log("✅ GCP Link synced to Firebase Firestore → system_links");
});
