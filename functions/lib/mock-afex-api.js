"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.createExhibitor = void 0;
const firebaseFunctions = require("firebase-functions");
const firestore_1 = require("@google-cloud/firestore");
const auth_1 = require("firebase-admin/auth");
const admin = require("firebase-admin");
const axios_1 = require("axios");
const AES = require("crypto-js/aes");
const functions = firebaseFunctions.region("asia-southeast2");
exports.createExhibitor = functions.https.onCall(async (data, context) => {
    const logger = firebaseFunctions.logger;
    const db = admin.firestore();
    try {
        validateBodyFields();
        const encryptedPassword = encryptPassword(data.password);
        const userUid = await createFirebaseAuthAccount();
        await createExhibitorAccountDoc(userUid, encryptedPassword);
        await createExhibitorDoc(userUid);
        const sendbirdUserData = await createSendbirdAccount(userUid);
        await createSendbirdDoc(sendbirdUserData);
        return true;
    }
    catch (error) {
        console.log(error);
        return null;
    }
    function validateBodyFields() {
        const id = data.id;
        const name = data.name;
        const password = data.password;
        const email = data.email;
        const phoneNumber = data.phoneNumber;
        const displayName = data.displayName;
        const photoURL = data.photoURL;
        if (typeof id !== "string") {
            throw Error("invalid id type");
        }
        if (id === "") {
            throw Error("id is empty");
        }
        if (typeof name !== "string") {
            throw Error("invalid name type");
        }
        if (name === "") {
            throw Error("name is empty");
        }
        if (typeof password !== "string") {
            throw Error("invalid password type");
        }
        if (password === "") {
            throw Error("password is empty");
        }
        if (password.length <= 7) {
            throw Error("password should have at least 8 characters");
        }
        const isEmailValid = checkIfEmailIsValid(email);
        if (!isEmailValid) {
            throw Error("invalid email address");
        }
        const isPhoneNumberValid = checkIfPhoneNumberIsValid(phoneNumber);
        if (!isPhoneNumberValid) {
            throw Error("invalid phone number");
        }
        if (typeof displayName !== "string") {
            throw Error("invalid displayName type");
        }
        if (displayName === "") {
            throw Error("displayName is empty");
        }
        if (typeof photoURL !== "string") {
            throw Error("invalid photoURL type");
        }
        if (photoURL === "") {
            throw Error("photoURL is empty");
        }
    }
    function checkIfEmailIsValid(email) {
        return email.match(/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
    }
    function checkIfPhoneNumberIsValid(phoneNumber) {
        return phoneNumber.match(/^(\+639)\d{9}$/);
    }
    function encryptPassword(rawPassword) {
        const passphrase = process.env.PASSPHRASE;
        const encryptedPassword = AES.encrypt(rawPassword, passphrase).toString();
        logger.info("ENCRYPTED PASSWORD");
        return encryptedPassword;
    }
    async function createFirebaseAuthAccount() {
        const user = await (0, auth_1.getAuth)().createUser({
            uid: data.id,
            email: data.email,
            emailVerified: true,
            phoneNumber: data.phoneNumber,
            password: data.password,
            displayName: data.displayName,
            photoURL: data.photoURL,
        });
        logger.info("CREATED FIREBASE_AUTH ACCOUNT");
        await (0, auth_1.getAuth)().setCustomUserClaims(user.uid, {
            role: "exhibitor",
        });
        logger.info("SET FIREBASE_AUTH ROLE TO EXHIBITOR");
        return user.uid;
    }
    async function createExhibitorAccountDoc(uid, encryptedPassword) {
        await db.collection("exhibitorAccounts").doc(uid).set({
            name: data.name,
            id: uid,
            email: data.email,
            password: encryptedPassword,
            phoneNumber: data.phoneNumber,
            updatedAt: firestore_1.FieldValue.serverTimestamp(),
            createdAt: firestore_1.FieldValue.serverTimestamp(),
        });
        logger.info("CREATED EXHIBITOR ACCOUNT DOCUMENT");
    }
    async function createExhibitorDoc(uid) {
        await db.collection("exhibitors").doc(uid).set({
            id: uid,
            name: data.name,
            email: data.email,
            phoneNumber: data.phoneNumber,
            updatedAt: firestore_1.FieldValue.serverTimestamp(),
            createdAt: firestore_1.FieldValue.serverTimestamp(),
        });
        logger.info("CREATED EXHIBITOR DOCUMENT");
    }
    async function createSendbirdAccount(userUid) {
        const headers = {
            "Accept": "*/*",
            "Content-Type": "application/json",
            "Api-Token": process.env.SENDBIRD_API_TOKEN,
        };
        const payload = {
            user_id: userUid,
            nickname: data.name,
            profile_url: data.photoURL,
            issue_access_token: true,
            metadata: { role: "exhibitor" },
        };
        const result = await (0, axios_1.default)({
            method: "POST",
            headers: headers,
            url: `https://api-${process.env.SENDBIRD_APP_ID}.sendbird.com/v3/users`,
            data: payload,
        });
        logger.info("CREATED A SENDBIRD ACCOUNT");
        logger.info(result.data);
        return result.data;
    }
    async function createSendbirdDoc(sendbirdUserData) {
        const sendbirdUserJson = JSON.stringify(sendbirdUserData);
        const sendbirdUser = JSON.parse(sendbirdUserJson);
        await db.collection("sendbirdUsers").doc(sendbirdUser.user_id).set({
            profileUrl: sendbirdUser.profile_url,
            userId: sendbirdUser.user_id,
            isActive: sendbirdUser.is_active,
            nickname: sendbirdUser.nickname,
            accessToken: sendbirdUser.access_token,
            role: sendbirdUser.metadata.role,
            updatedAt: firestore_1.FieldValue.serverTimestamp(),
            createdAt: firestore_1.FieldValue.serverTimestamp(),
        });
        logger.info("CREATED SENDBIRD DOCUMENT");
    }
});
//# sourceMappingURL=mock-afex-api.js.map