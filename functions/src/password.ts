import * as firebaseFunctions from "firebase-functions";
const CryptoJS = require("crypto-js");

const functions = firebaseFunctions.region("asia-southeast2");

export const eDecryptPassword = functions.https.onCall(
  async (data, context) => {
    try {
      const passphrase = process.env.PASSPHRASE;
      const bytes = CryptoJS.AES.decrypt(data.encryptedPassword, passphrase);
      const originalText = bytes.toString(CryptoJS.enc.Utf8);
      console.log(`DECRYPTED PASSWORD: ${originalText}`);
      return originalText;
    } catch (error) {
      console.log(error);
      return null;
    }
  }
);
