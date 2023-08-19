"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.eSendOtpViaSms = void 0;
const client_sns_1 = require("@aws-sdk/client-sns");
const axios_1 = require("axios");
const firebaseFunctions = require("firebase-functions");
const otpGenerator = require("otp-generator");
const functions = firebaseFunctions.region("asia-southeast2");
exports.eSendOtpViaSms = functions.https.onCall(async (data, context) => {
    const logger = firebaseFunctions.logger;
    try {
        logger.info(`PHONE NUMBER: ${data.phoneNumber}`);
        const generatedOTP = otpGenerator.generate(6, {
            digits: true,
            upperCaseAlphabets: false,
            specialChars: false,
            lowerCaseAlphabets: false,
        });
        const isPHMobileNumber = data.phoneNumber.startsWith("+63");
        if (isPHMobileNumber) {
            await sendSMSViaSemaphore(generatedOTP);
        }
        else {
            await sendSMSViaSNS(generatedOTP);
        }
        return generatedOTP;
    }
    catch (error) {
        logger.error(error);
        return null;
    }
    async function sendSMSViaSemaphore(otp) {
        // Semaphore does not accept a phone number that starts with "+"
        const formattedPhoneNumber = data.phoneNumber.replace("+", "");
        const postData = {
            apikey: process.env.SEMAPHORE_API_KEY,
            number: formattedPhoneNumber,
            message: `Your One-Time Password (OTP) for Login verification is: ${otp} This code will expire in 5 minutes. Please do not share it with anyone.`,
        };
        const headers = {
            "Accept": "*/*",
            "Content-Type": "application/json",
        };
        await (0, axios_1.default)({
            method: "POST",
            headers,
            url: process.env.SEMAPHORE_API_ENDPOINT,
            data: postData,
        });
        // const result = await axios({
        //   method: "POST",
        //   headers,
        //   url: process.env.SEMAPHORE_API_ENDPOINT,
        //   data: postData,
        // });
        // logger.info(`Result from Semaphore ${result.data}`);
        logger.info(`OTP:${otp} SENT TO: ${formattedPhoneNumber} VIA SEMAPHORE`);
    }
    async function sendSMSViaSNS(otp) {
        const snsClient = new client_sns_1.SNSClient({
            region: "ap-southeast-1",
            credentials: {
                accessKeyId: process.env.AWS_ACCESS_KEY_ID,
                secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY,
            },
        });
        const command = new client_sns_1.PublishCommand({
            Message: `Your One-Time Password (OTP) for Login verification is: ${otp} This code will expire in 5 minutes. Please do not share it with anyone.`,
            PhoneNumber: data.phoneNumber,
        });
        await snsClient.send(command);
        // const result = await snsClient.send(command);
        // logger.info(`Result from SNS ${result}`);
        logger.info(`OTP:${otp} SENT TO: ${data.phoneNumber} VIA AWS SNS`);
    }
});
//# sourceMappingURL=verification.js.map