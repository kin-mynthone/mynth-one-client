// Start writing functions
// https://www.youtube.com/watch?v=gA6WGYQWrKc
// https://firebase.google.com/docs/functions/typescript
// https://firebase.google.com/docs/functions/organize-functions

// Always update version of firebase-functions
// Run npm install --save firebase-functions@latest in functions directory

// To deploy a function run firebase deploy --only functions:helloWorld
// To delete a function run firebase functions:delete helloWorld
// IMPORTANT: DEPLOY OR DELETE 1 FUNCTION AT A TIME.
// NEVER DO A BULK DELETE OR BULK DEPLOY.

// Fix lint errors run npm run lint -- --fix

// To deploy functions locally via emulator run npm run serve
// To auto serve functions when change is detected run npm run build:watch

import * as admin from "firebase-admin";
admin.initializeApp();

import password = require("./password");
import login = require("./login");


exports.eDecryptPassword = password.eDecryptPassword;
exports.eSendOtp = login.eSendOtp;

